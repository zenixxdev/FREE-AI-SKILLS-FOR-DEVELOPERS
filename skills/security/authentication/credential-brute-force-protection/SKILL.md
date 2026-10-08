---
name: "credential-brute-force-protection"
description: "Hardening authentication endpoints against credential stuffing and brute-force attacks using Argon2id password hashing, progressive delays, account lockouts, and CAPTCHA gates."
category: "security"
subcategory: "authentication"
language: "agnostic"
framework: "none"
technology: "auth-security"
difficulty: "advanced"
tags: ["security", "passwords", "argon2id", "brute-force", "credential-stuffing", "rate-limiting"]
---

# Credential Brute-Force Defense, Lockouts, and Argon2id Hashing

## Purpose
Provide concrete security standards for storing user credentials safely and protecting login endpoints from credential stuffing, dictionary attacks, and automated brute-forcing.

## When to Use
Use when implementing user password registration, login verification, password reset endpoints, or account security settings.

## Inputs / Context
User credentials, login endpoint, IP address, user-agent, and failed attempt counters.

## Instructions
1. Password Storage Standard:
   - Use Argon2id (OWASP recommended winner of the Password Hashing Competition) with minimum memory: 64MB (65536 KiB), iterations: 3, parallelism: 4.
   - If Argon2id is unsupported, use bcrypt with a work factor cost of at least 12.
   - Never use outdated, fast hash algorithms (MD5, SHA-1, SHA-256, SHA-512) for passwords.
2. Defend Against Timing Attacks:
   - When a login attempt specifies an unrecognized username/email, execute a dummy password hash computation (using a precomputed fixed hash) so that response time is identical to an authentic user lookup, preventing user enumeration via timing analysis.
3. Multi-Layered Brute-Force Rate Limiting:
   - IP-level rate limiting: max 10 failed attempts per IP per minute across all accounts.
   - Account-level rate limiting: max 5 failed attempts per specific username/email per 15 minutes.
4. Progressive Delays and Challenges:
   - After 3 consecutive failed attempts on an account, require a CAPTCHA (e.g., Cloudflare Turnstile).
   - After 5 consecutive failed attempts, lock the account for 15-30 minutes and dispatch an email alert to the account owner with an immediate unlock link.
5. Check against Compromised Password Databases:
   - During registration and password change, check password against HaveIBeenPwned via k-Anonymity API (sending only the first 5 characters of SHA-1 hash).

## Constraints / Rules
- Never truncate user passwords (bcrypt has a 72-byte limit; hash with SHA-256 first if supporting arbitrary length with bcrypt).
- Never send cleartext passwords over unencrypted HTTP.
- Do not reveal whether the username or the password was incorrect ('Invalid credentials').

## Workflow
1. Receive login request and check IP/account rate limits.
2. Query user by email. If not found, execute dummy Argon2id verification and return 401.
3. If found, verify password using Argon2id.
4. On failure, increment failed attempt counter, trigger CAPTCHA or lockout if threshold met, and return generic 401.
5. On success, reset failed attempt counter and issue session.

## Expected Output
Hardened password hashing and authentication controller with Argon2id, timing attack resistance, account lockout, and rate limiting.

## Validation Checklist
- [ ] Are passwords hashed using Argon2id or bcrypt (cost >= 12)?
- [ ] Is dummy hashing performed for non-existent users to eliminate timing differences?
- [ ] Are login failures reported as generic 'Invalid credentials'?
- [ ] Are account lockouts triggered after repeated failures?
- [ ] Are known compromised passwords rejected during registration?

## Common Mistakes & Antipatterns
- Using raw SHA-256 to hash passwords, which modern GPUs can crack at billions of guesses per second.
- Returning 'User not found' on wrong email and 'Incorrect password' on wrong password, allowing attackers to compile lists of valid customer emails.
- Implementing account lockout based solely on IP, allowing distributed botnets to bypass rate limits.

## Concrete Real-World Example
Scenario: An attacker uses a botnet of 10,000 rotating IP addresses to perform credential stuffing against a login endpoint, bypassing simple IP rate limiting.
Prompt: Protect this login endpoint from distributed credential stuffing attacks.
Application: The AI implements dual-key rate limiting (per-IP and per-account), enforces Cloudflare Turnstile verification after 3 failures on an account, hashes with Argon2id, performs dummy hashing on missing users, and locks the target account for 15 minutes after 5 failures.
