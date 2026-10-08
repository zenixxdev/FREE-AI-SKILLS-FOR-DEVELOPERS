---
name: "input-sanitization-and-defense"
description: "Defending REST and GraphQL APIs against mass assignment, prototype pollution, oversized payloads, JSON bombs, and MIME type confusion attacks."
category: "security"
subcategory: "api-security"
language: "agnostic"
framework: "none"
technology: "api-security"
difficulty: "intermediate"
tags: ["security", "api-security", "mass-assignment", "prototype-pollution", "content-sniffing", "sanitization"]
---

# API Input Sanitization, Mass-Assignment Defense, and Content Sniffing

## Purpose
Instruct AI agents to protect backend APIs from structural payload attacks, accidental privilege escalation via mass assignment, and object prototype tampering.

## When to Use
Use when handling API request bodies, file uploads, third-party webhook ingestions, or updating database models from request parameters.

## Inputs / Context
Inbound request payloads, ORM models, file upload streams, and server middleware configurations.

## Instructions
1. Defend Against Mass Assignment (Over-Posting):
   - Never pass raw request body objects directly into ORM creation or update methods (`User.create(req.body)` or `user.update(req.body)`).
   - Use strict DTOs (Data Transfer Objects) or explicit whitelisting: only extract permitted fields (e.g., `const { name, bio } = req.body;`).
   - Prevent clients from overriding sensitive internal fields: `role`, `isAdmin`, `isVerified`, `accountId`, `balance`.
2. Defend Against Prototype Pollution (JavaScript/Node.js):
   - Reject or sanitize JSON payloads containing `__proto__`, `constructor`, or `prototype` keys before deep merging.
   - Use `Object.create(null)` for dictionary lookups without prototypes, or use `Map`.
3. Payload Size Limits and Parsing Defenses:
   - Configure strict body size limits on JSON parsers (e.g., `express.json({ limit: '100kb' })`) to prevent memory exhaustion DoS.
   - Guard against deeply nested JSON objects (JSON bombs) by enforcing maximum recursion depth in parsers.
4. Prevent MIME-Type Confusion and Content Sniffing:
   - Send `X-Content-Type-Options: nosniff` header on all responses to prevent browsers from executing non-script files as JavaScript.
   - On file upload endpoints, never trust client-supplied `Content-Type` headers or file extensions alone; verify file magic bytes (binary signatures) using libraries like `file-type`.

## Constraints / Rules
- Never pass unvalidated `req.body` directly to database save methods.
- Do not use unbounded `bodyParser.json()` without explicit byte limits.
- Avoid recursive object merging functions without prototype pollution guards.

## Workflow
1. Configure body parser with strict size limit (e.g., 100kb).
2. Filter incoming objects against prototype pollution keys.
3. Validate and whitelist permitted fields into an explicit DTO.
4. Verify uploaded file magic bytes.
5. Attach `X-Content-Type-Options: nosniff` header.

## Expected Output
Hardened API controller and middleware implementing strict DTO whitelisting, prototype pollution defense, and MIME-sniffing prevention.

## Validation Checklist
- [ ] Are database models updated via explicit DTOs rather than raw request bodies?
- [ ] Are sensitive attributes (`role`, `balance`, `admin`) protected from client assignment?
- [ ] Are JSON payload size limits configured (<= 100kb for standard APIs)?
- [ ] Is `X-Content-Type-Options: nosniff` header active?
- [ ] Are uploaded files validated using binary magic bytes?

## Common Mistakes & Antipatterns
- Calling `User.update(req.body, { where: { id } })`, allowing an attacker to submit `{"isAdmin": true}` and elevate their own privileges.
- Merging user objects with an insecure recursive merge function, polluting `Object.prototype` and corrupting the entire Node.js runtime.
- Trusting an uploaded file named `avatar.jpg` that actually contains executable PHP or HTML script.

## Concrete Real-World Example
Scenario: A user profile update endpoint allows users to make themselves system administrators because it passes the entire JSON payload directly into `db.users.update()`.
Prompt: Harden this user profile update route against mass-assignment and prototype pollution.
Application: The AI creates a Zod schema permitting only `firstName`, `lastName`, and `avatarUrl`, strips all unexpected properties, validates payload depth, rejects keys matching `__proto__`, and updates only the whitelisted attributes.
