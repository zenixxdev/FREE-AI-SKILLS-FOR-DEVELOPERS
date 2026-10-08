---
name: "token-rotation-and-validation"
description: "Engineering secure JSON Web Token (JWT) lifecycles with asymmetric key signatures (RS256/EdDSA), short-lived access tokens, refresh token rotation, and revocation lists."
category: "authentication"
subcategory: "jwt"
language: "typescript"
framework: "none"
technology: "jwt"
difficulty: "advanced"
tags: ["authentication", "jwt", "tokens", "refresh-token-rotation", "rs256", "cryptography"]
---

# JWT Architecture, Token Rotation, and Cryptographic Validation

## Purpose
Instruct AI agents to implement secure JWT authentication systems that prevent algorithm confusion attacks, support instantaneous revocation, and rotate refresh tokens automatically.

## When to Use
Use when building distributed microservice authentication, mobile app authentication backends, or stateless API session layers.

## Inputs / Context
Key pairs (private/public), token expiration limits, claims schema, and token storage backend (Redis/DB).

## Instructions
1. Sign tokens using asymmetric algorithms (RS256 or EdDSA / Ed25519) so services can verify tokens using public keys without possessing the private signing key.
2. Guard against the 'none' algorithm and Algorithm Confusion attacks: explicitly specify the expected algorithm during verification (e.g., `algorithms: ['RS256']`); never trust the `alg` header from the client token.
3. Configure short token lifespans: Access Tokens must expire in 5-15 minutes; Refresh Tokens should expire in 7-30 days.
4. Implement Automatic Refresh Token Rotation:
   - When a refresh token is used, invalidate it immediately and issue a brand-new refresh token and access token pair.
   - Store refresh token family IDs in database/Redis.
   - Detect Token Theft / Reuse: If an already-used or invalidated refresh token is presented, immediately revoke the ENTIRE token family (all refresh tokens belonging to that user session), forcing re-authentication.
5. Validate all standard JWT claims: `exp` (expiration), `nbf` (not before), `iat` (issued at), `iss` (issuer), and `aud` (audience).
6. Store tokens securely: deliver tokens in `HttpOnly`, `Secure`, `SameSite=Strict` cookies.
7. Keep JWT payloads lightweight: include only essential identifiers (`sub`, `roles`); never put sensitive data (passwords, credit card info, PII) in unencrypted JWT claims.

## Constraints / Rules
- Never accept tokens signed with the `none` algorithm.
- Never use symmetric HS256 across distributed third-party services where public-key verification is needed.
- Do not store refresh tokens as raw plain text in the database; hash them with SHA-256 before storage.

## Workflow
1. Generate asymmetric RSA-4096 or Ed25519 key pair.
2. Issue short-lived access token and hashed refresh token with family identifier.
3. Verify access token signature, issuer, audience, and expiration on every request.
4. On refresh request, atomically rotate refresh token in database.
5. If token reuse is detected, revoke all tokens in the family and log a security alert.

## Expected Output
Secure JWT signing, verification, and refresh token rotation middleware with reuse detection and family revocation.

## Validation Checklist
- [ ] Are verification algorithms explicitly whitelisted (`algorithms: ['RS256']`)?
- [ ] Are access tokens short-lived (<= 15 minutes)?
- [ ] Is refresh token rotation implemented with automatic family revocation on reuse?
- [ ] Are refresh tokens stored as cryptographic hashes in the database?
- [ ] Are tokens delivered in HttpOnly, Secure, SameSite cookies?

## Common Mistakes & Antipatterns
- Allowing the JWT library to dynamically use the `alg` specified in the token header, enabling attackers to forge signatures using the public key as an HMAC secret.
- Setting access token expiration to 30 days with no revocation mechanism, leaving accounts compromised indefinitely if a token leaks.
- Putting confidential user data into the JWT payload, forgetting that JWT claims are merely Base64-encoded and readable by anyone.

## Concrete Real-World Example
Scenario: An attacker intercepts an old refresh token and attempts to generate new access tokens while the legitimate user is also active.
Prompt: Implement refresh token rotation with reuse detection in Node.js.
Application: The AI creates a database schema tracking `tokenFamilyId`, `isRevoked`, and `tokenHash`. When the attacker submits the consumed token, the server detects reuse, invalidates all sessions under `tokenFamilyId`, deletes the session cookie, and prompts the user to re-authenticate.
