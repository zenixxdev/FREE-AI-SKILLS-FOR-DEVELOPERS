---
name: "pkce-authorization-flow"
description: "Implementing secure OAuth 2.1 / OIDC Authorization Code Flow utilizing Proof Key for Code Exchange (PKCE), state verification, and token exchange."
category: "authentication"
subcategory: "oauth"
language: "typescript"
framework: "none"
technology: "oauth2-oidc"
difficulty: "advanced"
tags: ["authentication", "oauth2", "pkce", "oidc", "security", "authorization-code"]
---

# OAuth 2.1 Authorization Code Flow with PKCE

## Purpose
Provide concrete implementation rules for OAuth 2.0 / 2.1 Authorization Code Flow with PKCE, preventing authorization code interception and CSRF attacks across Single Page Apps, mobile apps, and backends.

## When to Use
Use when integrating third-party login (Google, GitHub, Auth0, Okta), building an identity provider, or authenticating SPAs and mobile applications.

## Inputs / Context
Client ID, authorization endpoint, token endpoint, redirect URI, requested scopes, and storage layer for session state.

## Instructions
1. Enforce OAuth 2.1 standards: always use Authorization Code Flow with PKCE (Proof Key for Code Exchange) for both public clients (SPA/mobile) and confidential clients (web servers); deprecate the OAuth 2.0 Implicit Flow.
2. PKCE Generation (Client-Side Initiation):
   - Generate a cryptographically random `code_verifier` string (43 to 128 characters from unreserved characters [A-Z, a-z, 0-9, '-', '.', '_', '~']).
   - Calculate the `code_challenge`: SHA-256 hash of the `code_verifier`, Base64URL-encoded (method: `S256`). Never use `plain`.
   - Generate a cryptographically random `state` parameter and a `nonce` to prevent Cross-Site Request Forgery (CSRF) and token replay.
   - Store `code_verifier`, `state`, and `nonce` in secure, temporary storage (e.g., HttpOnly cookie or encrypted session).
3. Authorization Request: Redirect user to authorization endpoint with: `response_type=code`, `client_id`, `redirect_uri`, `scope`, `state`, `code_challenge`, and `code_challenge_method=S256`.
4. Callback Validation:
   - Verify returned `state` parameter exactly matches the stored session `state`. If mismatched or missing, abort immediately (CSRF detected).
   - Extract authorization `code`.
5. Token Exchange:
   - Send POST request to token endpoint with: `grant_type=authorization_code`, `code`, `redirect_uri`, `client_id`, and the original plain `code_verifier`.
   - The authorization server hashes the received `code_verifier` and verifies it matches the previously submitted `code_challenge`.
6. Token Storage: Store returned refresh and access tokens in secure, HttpOnly, SameSite=Lax/Strict cookies; never store tokens in browser `localStorage` or `sessionStorage`.

## Constraints / Rules
- Never use the deprecated Implicit Flow (`response_type=token`).
- Never use `code_challenge_method=plain`; always enforce `S256`.
- Never store OAuth access or refresh tokens in `localStorage`, which is vulnerable to XSS theft.

## Workflow
1. Generate high-entropy `code_verifier` and `state` parameters.
2. Compute SHA-256 `code_challenge`.
3. Construct authorization URL and redirect client.
4. On redirect callback, validate `state` parameter.
5. POST to token endpoint with authorization code and `code_verifier`.
6. Set secure HttpOnly cookies with returned session tokens.

## Expected Output
Complete OAuth2 PKCE client flow with cryptographically secure parameter generation, state validation, and secure cookie session storage.

## Validation Checklist
- [ ] Is PKCE enforced using `code_challenge_method=S256`?
- [ ] Is `state` parameter generated with high entropy and verified on callback?
- [ ] Are tokens stored in secure, HttpOnly, SameSite cookies rather than localStorage?
- [ ] Is the deprecated Implicit Flow completely avoided?
- [ ] Are authorization codes exchanged only once and immediately invalidated?

## Common Mistakes & Antipatterns
- Storing JWT access tokens in `localStorage`, allowing any injected third-party script (XSS) to steal credentials.
- Omitting the `state` parameter, leaving users vulnerable to OAuth login CSRF attacks.
- Using `code_challenge_method=plain`, defeating the security benefits of PKCE.

## Concrete Real-World Example
Scenario: A React Single Page App implements Google Login by receiving access tokens directly in URL hash fragments (Implicit Flow) and storing them in localStorage.
Prompt: Modernize this OAuth login flow to use Authorization Code Flow with PKCE and secure backend session cookies.
Application: The AI creates a backend proxy endpoint that initiates PKCE, redirects to Google with an `S256` challenge, validates state on callback, exchanges the code and verifier server-side, and issues an encrypted HttpOnly session cookie to the SPA.
