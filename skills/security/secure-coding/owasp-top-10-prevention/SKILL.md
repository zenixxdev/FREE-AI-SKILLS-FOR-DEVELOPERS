---
name: "owasp-top-10-prevention"
description: "Systematic defensive engineering patterns to eliminate the OWASP Top 10 vulnerabilities: Injection, Broken Auth, SSRF, XSS, and Security Misconfiguration."
category: "security"
subcategory: "secure-coding"
language: "agnostic"
framework: "none"
technology: "owasp-security"
difficulty: "advanced"
tags: ["security", "owasp", "sql-injection", "xss", "ssrf", "secure-coding", "defense-in-depth"]
---

# OWASP Top 10 Defensive Engineering and Secure Coding

## Purpose
Equip AI agents with definitive secure coding principles to proactively eliminate common software vulnerabilities during code synthesis and code review.

## When to Use
Use during all software development activities, code reviews, API endpoint construction, and security vulnerability audits.

## Inputs / Context
Source code, data inputs, external communication calls, configuration parameters, and template rendering logic.

## Instructions
1. Injection Defense:
   - SQL Injection: ALWAYS use parameterized queries or type-safe ORM query builders. Never concatenate user strings into raw SQL statements.
   - Command Injection: Avoid invoking OS shells (`exec`, `system`). If unavoidable, use spawn with fixed argument arrays (`execFile`, `spawn`) without shell interpolation (`shell: false`).
2. Cross-Site Scripting (XSS) Defense:
   - Rely on context-aware automatic escaping engines (React JSX, modern template engines).
   - Never use `dangerouslySetInnerHTML`, `v-html`, or `innerHTML` with untrusted data without sanitizing through DOMPurify.
   - Set a strict Content Security Policy (CSP) header: `default-src 'self'; script-src 'self'; object-src 'none';`.
3. Server-Side Request Forgery (SSRF) Defense:
   - When fetching user-supplied URLs, never fetch private IP ranges (`10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`, `127.0.0.0/8`, `169.254.169.254` AWS metadata).
   - Validate URLs against strict protocol whitelists (`http:`, `https:` only) and resolve DNS to verify the target IP is public before connecting.
4. Security Misconfiguration Defense:
   - Disable debug modes, directory browsing, and default credentials in production.
   - Remove verbose server headers (`X-Powered-By`, `Server`).
   - Configure security headers using Helmet: `Strict-Transport-Security`, `X-Content-Type-Options: nosniff`, `X-Frame-Options: DENY`.

## Constraints / Rules
- Never concatenate user strings into database queries or shell command strings.
- Never fetch user-provided URLs without validating against private/loopback IP address ranges.
- Do not disable SSL/TLS certificate verification (`rejectUnauthorized: false` is strictly forbidden).

## Workflow
1. Audit all data input boundaries (query params, body, headers, files).
2. Apply parameterization and type enforcement.
3. Configure security response headers.
4. Block internal network access on outbound URL fetches.
5. Verify with automated static security analysis (SAST).

## Expected Output
Hardened application code featuring parameterized queries, safe subprocess execution, SSRF protections, and strict security headers.

## Validation Checklist
- [ ] Are all database queries parameterized with zero string concatenation?
- [ ] Is unescaped HTML rendering prohibited or sanitized via DOMPurify?
- [ ] Are outbound HTTP requests protected against internal IP SSRF?
- [ ] Are standard security headers (HSTS, CSP, X-Frame-Options) configured?
- [ ] Is shell command execution eliminated or secured with argument vectors?

## Common Mistakes & Antipatterns
- Concatenating query parameters: `db.query("SELECT * FROM users WHERE email = '" + req.body.email + "'")`, opening a trivial SQL injection flaw.
- Allowing users to specify a webhook URL and fetching it directly, enabling attackers to query `http://169.254.169.254/latest/meta-data/` and steal AWS IAM instance credentials.
- Rendering untrusted user input using `dangerouslySetInnerHTML`, permitting stored XSS attacks.

## Concrete Real-World Example
Scenario: An image proxy endpoint takes a `url` parameter and fetches it to resize it, allowing internal network port scanning and AWS metadata credential theft.
Prompt: Harden this image fetcher route against SSRF attacks and DNS rebinding.
Application: The AI resolves the DNS hostname before connecting, verifies the IP does not match private or link-local ranges (`169.254.0.0/16`, `127.0.0.0/8`), pins the resolved IP for the HTTP request to prevent DNS rebinding, and disables redirect following.
