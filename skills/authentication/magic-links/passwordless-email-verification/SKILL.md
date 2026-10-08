---
name: "passwordless-email-verification"
description: "Designing secure passwordless magic link authentication with cryptographic token hashing, single-use enforcement, anti-scanner confirmation, and short TTLs."
category: "authentication"
subcategory: "magic-links"
language: "typescript"
framework: "none"
technology: "magic-links"
difficulty: "intermediate"
tags: ["authentication", "magic-links", "passwordless", "email", "security", "tokens"]
---

# Passwordless Magic Link Authentication and Email Verification

## Purpose
Guide AI in implementing secure, passwordless email login flows that prevent token leakage, protect against email spam scanners, and ensure single-use token consumption.

## When to Use
Use when implementing passwordless authentication, email address verification, or account recovery via email.

## Inputs / Context
Email delivery service, token persistence store, rate limiter, and frontend callback routes.

## Instructions
1. Generate high-entropy, cryptographically secure tokens: create a 32-byte random token (`crypto.randomBytes(32).toString('hex')`).
2. Hash Before Storage: NEVER store the raw token in the database. Compute the SHA-256 hash of the token (`crypto.createHash('sha256').update(rawToken).digest('hex')`) and store only the hash with the associated user ID and expiration timestamp.
3. Enforce Short Lifespans: Magic link tokens must expire in 10 to 15 minutes.
4. Enforce Single-Use Consumption:
   - When the user clicks the link, hash the incoming token and look up the record.
   - Atomically delete or mark the token as used in a single database transaction (`DELETE FROM magic_tokens WHERE token_hash = ? RETURNING user_id`).
   - If no record was updated/returned, reject immediately (token invalid or already consumed).
5. Defend Against Automated Email Security Scanners (Enterprise Firewalls):
   - Corporate spam filters (e.g., Proofpoint, Mimecast) crawl and click all links in incoming emails automatically, which prematurely consumes single-use tokens.
   - Defense: Do NOT consume the token or log the user in on HTTP `GET /auth/verify?token=...`.
   - Instead, render a clean landing page with a 'Click here to sign in' confirmation button that triggers an HTTP `POST` to consume the token.
6. Rate Limit Magic Link Requests: Enforce aggressive rate limits per email address (e.g., max 3 requests per 15 minutes) and per IP address to prevent email flooding and resource exhaustion.
7. Prevent User Enumeration: Always return a generic success message ('If an account exists with this email, a sign-in link has been sent') regardless of whether the email was found in the database.

## Constraints / Rules
- Never store plaintext magic link tokens in the database.
- Never log the user in directly via an unconfirmed `GET` request.
- Do not allow tokens to be reused under any circumstances.

## Workflow
1. Client submits email address.
2. Check rate limit for target email.
3. Generate 32-byte random token, hash with SHA-256, and store hash with 15-minute TTL.
4. Send email containing link with raw token.
5. User clicks link to landing page and clicks confirmation button.
6. POST request atomically consumes token and issues session cookie.

## Expected Output
Secure magic link generation and verification service with SHA-256 hashing, anti-scanner confirmation page, and atomic single-use consumption.

## Validation Checklist
- [ ] Are tokens hashed with SHA-256 before database storage?
- [ ] Is token expiration capped at <= 15 minutes?
- [ ] Is token consumption executed atomically in a single transaction?
- [ ] Is automated email scanner pre-fetching prevented via POST confirmation?
- [ ] Are email responses sanitized to prevent account enumeration?

## Common Mistakes & Antipatterns
- Storing magic tokens in plain text, allowing any database reader or read-replica leak to compromise every user account.
- Consuming the token on HTTP `GET`, causing corporate antivirus scanners to invalidate links before users even open their email.
- Revealing whether an email is registered ('User not found' vs 'Email sent'), facilitating user enumeration attacks.

## Concrete Real-World Example
Scenario: Enterprise users report that magic links are always reported as 'Invalid or already expired' the moment they receive them in Microsoft Outlook.
Prompt: Fix this magic link expiration bug caused by enterprise email security scanners.
Application: The AI converts the verification endpoint from a `GET` auto-login into a landing page with a CSRF-protected `POST /verify` form, preventing Outlook's automated URL crawler from consuming the one-time token.
