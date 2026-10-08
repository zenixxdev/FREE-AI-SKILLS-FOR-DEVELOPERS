---
name: "webauthn-registration-and-login"
description: "Implementing phishing-resistant passwordless authentication using Passkeys, WebAuthn, FIDO2, public-key cryptography, and SimpleWebAuthn."
category: "authentication"
subcategory: "passkeys"
language: "typescript"
framework: "none"
technology: "webauthn-fido2"
difficulty: "advanced"
tags: ["authentication", "passkeys", "webauthn", "fido2", "passwordless", "cryptography"]
---

# Passkeys and WebAuthn / FIDO2 Passwordless Authentication

## Purpose
Instruct AI agents to implement phishing-resistant Passkey registration and authentication flows adhering strictly to W3C WebAuthn Level 3 specifications.

## When to Use
Use when implementing Passkeys, hardware security keys (YubiKey), Touch ID / Face ID biometric login, or multi-factor authentication (MFA).

## Inputs / Context
Relying Party (RP) configuration (ID, name, origin), user account model, credential database table, and WebAuthn library.

## Instructions
1. Understand WebAuthn architecture:
   - Relying Party (RP): The backend server application.
   - Client: The web browser or mobile OS supporting `navigator.credentials`.
   - Authenticator: The hardware security key, Touch ID, Face ID, or platform passkey provider.
2. Registration Ceremony (Create Credential):
   - Server generates registration options: cryptographically random `challenge` (saved in session with 60s TTL), `rp` (name and `id` matching domain origin), `user` (id, name, displayName), and allowed `pubKeyCredParams` (e.g., -7 for ES256, -257 for RS256).
   - Browser calls `navigator.credentials.create({ publicKey: options })`.
   - Server receives `attestationResponse`: verifies `challenge` matches session, verifies `origin` matches server domain, extracts and stores `credentialID`, `credentialPublicKey`, and `counter` (initialized to 0) in the user credentials database.
3. Authentication Ceremony (Get Assertion):
   - Server generates authentication options: cryptographically random `challenge`, matching `rpId`, and list of user's registered `allowCredentials` IDs.
   - Browser calls `navigator.credentials.get({ publicKey: options })`.
   - Server receives `assertionResponse`: verifies `challenge`, verifies `origin`, verifies signature using stored `credentialPublicKey`.
   - Replay and Clone Detection: verify the returned `counter` is strictly greater than the stored `counter`; if `counter <= storedCounter` (and counter > 0), alert possible cloned authenticator and reject authentication.
4. Update stored `counter` with the newly received counter value upon successful verification.
5. Issue application session upon successful assertion.

## Constraints / Rules
- Never verify WebAuthn responses on the client side; cryptographic verification must occur on the server.
- Never hardcode `rpID` or `origin`; validate strictly against the host domain.
- Do not ignore the signature counter check, as it provides clone detection for hardware tokens.

## Workflow
1. Configure Relying Party identity and origins.
2. Implement `/auth/passkey/register-options` and `/auth/passkey/register-verify`.
3. Implement `/auth/passkey/login-options` and `/auth/passkey/login-verify`.
4. Store credential ID, public key bytes, and signature counter in database.
5. Create accessible UI with fallback for browsers without WebAuthn support.

## Expected Output
Complete WebAuthn Level 3 Passkey registration and login endpoints with challenge generation, signature verification, and counter validation.

## Validation Checklist
- [ ] Are challenges generated with CSPRNG and stored temporarily in session?
- [ ] Is origin strictly verified against expected HTTPS domain?
- [ ] Is signature counter validated to detect cloned authenticators?
- [ ] Are public keys stored safely in binary/base64url format?
- [ ] Is the ceremony phishing-resistant (bound to RP ID)?

## Common Mistakes & Antipatterns
- Accepting arbitrary `origin` headers without validation, completely nullifying WebAuthn's built-in phishing protection.
- Failing to verify that the returned challenge matches the challenge issued in the initial registration/login step.
- Failing to increment and check the signature counter, missing clone attacks on physical security keys.

## Concrete Real-World Example
Scenario: A web application wants to eliminate passwords by enabling Apple Touch ID and Windows Hello Passkey logins.
Prompt: Implement Passkey registration and login using SimpleWebAuthn in a TypeScript backend.
Application: The AI creates `generateRegistrationOptions` saving a base64url challenge in Redis, validates the browser's attestation response with `verifyRegistrationResponse`, stores the credential in PostgreSQL, and verifies subsequent login assertions with clone-detection counter tracking.
