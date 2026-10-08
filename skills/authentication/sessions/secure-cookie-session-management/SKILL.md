---
name: "secure-cookie-session-management"
description: "Architecting secure, stateful server-side session management with Redis backends, cryptographically random session IDs, session fixation defense, and cookie flags."
category: "authentication"
subcategory: "sessions"
language: "typescript"
framework: "none"
technology: "session-auth"
difficulty: "intermediate"
tags: ["authentication", "sessions", "cookies", "security", "session-fixation", "redis"]
---

# Stateful Session Management and Secure Cookie Hygiene

## Purpose
Provide AI agents with concrete rules for implementing battle-tested stateful session management with strict cookie security flags and instantaneous revocation.

## When to Use
Use when building traditional web applications, administrative dashboards, or high-security services where immediate session revocation and defense-in-depth are paramount.

## Inputs / Context
Session store (Redis/Postgres), cookie configuration, session idle/absolute timeouts, and authentication routes.

## Instructions
1. Generate session IDs using a cryptographically secure pseudorandom number generator (CSPRNG) with at least 128 bits of entropy (e.g., `crypto.randomBytes(32).toString('hex')`).
2. Always configure all four essential cookie security flags:
   - `HttpOnly`: Prevents client-side scripts from reading the cookie via `document.cookie`, mitigating XSS token theft.
   - `Secure`: Ensures cookies are transmitted exclusively over encrypted HTTPS connections.
   - `SameSite=Lax` (or `SameSite=Strict` for high-security portals): Prevents cookies from being attached to cross-site requests, mitigating CSRF attacks.
   - `Domain` and `Path`: Scope cookies strictly to the application domain (`Path=/`).
3. Prevent Session Fixation attacks: always regenerate the session ID immediately upon any privilege change (login, logout, role escalation, password change).
4. Implement Dual Timeouts:
   - Idle Timeout: Expire session after N minutes of inactivity (e.g., 30 minutes).
   - Absolute Timeout: Force complete re-authentication after a maximum elapsed window (e.g., 12 hours) regardless of ongoing activity.
5. Support Global and Granular Session Revocation: Allow users to view all active sessions (IP address, user agent, last active) and terminate individual sessions or 'Log out of all devices'.
6. Protect against CSRF: pair session cookies with Synchronizer Token Pattern or Double Submit Cookie validation on all state-changing HTTP requests.

## Constraints / Rules
- Never retain the same session ID across authentication boundary transitions (login).
- Never set `HttpOnly: false` on session cookies.
- Do not store sensitive database objects in session cache; store only the minimal `userId` and authorization version.

## Workflow
1. Initialize session middleware with Redis backing store.
2. Configure cookie flags (`HttpOnly`, `Secure`, `SameSite=Lax`).
3. On successful login, regenerate session ID using `req.session.regenerate()`.
4. Validate idle and absolute timeouts on each incoming request.
5. Invalidate session in Redis and clear cookie on logout.

## Expected Output
Stateful session management implementation with secure cookie flags, Redis store integration, session fixation defense, and revocation endpoints.

## Validation Checklist
- [ ] Are `HttpOnly`, `Secure`, and `SameSite` flags enabled on cookies?
- [ ] Is session ID regenerated immediately upon login?
- [ ] Are both idle and absolute timeouts enforced?
- [ ] Can sessions be revoked immediately in Redis by user ID?
- [ ] Is session ID generated using CSPRNG with >= 128 bits of entropy?

## Common Mistakes & Antipatterns
- Forgetting to regenerate the session ID on login, allowing an attacker who set a known session cookie on a shared computer to hijack the user's logged-in session (Session Fixation).
- Omitting `SameSite` attribute, relying solely on custom headers for CSRF protection.
- Storing entire user records in the session store, leading to stale permissions when user roles are updated in the primary database.

## Concrete Real-World Example
Scenario: An online banking portal uses cookies without `HttpOnly` or `SameSite`, allowing cross-site malicious scripts to trigger fund transfers.
Prompt: Secure this Express session implementation for a financial dashboard.
Application: The AI configures `express-session` with `connect-redis`, sets `cookie: { secure: true, httpOnly: true, sameSite: 'strict', maxAge: 1800000 }`, enforces `req.session.regenerate()` upon login, and adds CSRF double-submit token validation.
