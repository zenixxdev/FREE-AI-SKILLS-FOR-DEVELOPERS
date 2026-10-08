# Security Policy

## Reporting Security Issues

We take the security of software generated with and by our skills seriously. If you discover a security vulnerability, an insecure design pattern, or an instruction that encourages dangerous development practices in any skill, please report it responsibly.

**Please do NOT file public GitHub issues for security vulnerabilities.**

Instead, please report security issues via:
- **GitHub Private Vulnerability Reporting**: Use the 'Report a vulnerability' button in the repository Security tab.
- **Security Email**: Contact the maintainers directly at `security@free-ai-skills.org`.

We acknowledge receipt within 48 hours and provide a remediation timeline.

---

## What Constitutes a Security Issue in a Skill?

A skill contains a security vulnerability if:
1. It instructs an AI to generate code susceptible to OWASP Top 10 vulnerabilities (e.g., SQL injection, XSS, SSRF, IDOR).
2. It recommends insecure defaults (e.g., storing raw passwords, unauthenticated mutation endpoints, disabling SSL verification).
3. It promotes vulnerable dependencies or deprecated cryptographic primitives (e.g., MD5, SHA-1 for passwords).
4. It suggests patterns that expose secrets, API keys, or private environment variables in client-side code or public logs.

---

## Defensive Engineering Expectations

All skills in this repository must actively practice **Defense-in-Depth**:
- All database queries must be parameterized.
- All user inputs must be validated at perimeter boundaries.
- All authorization checks must verify tenant and object ownership.
- All authentication tokens must be stored in secure, HttpOnly cookies or encrypted vaults.
- All shell executions must use argument vectors to prevent command injection.
