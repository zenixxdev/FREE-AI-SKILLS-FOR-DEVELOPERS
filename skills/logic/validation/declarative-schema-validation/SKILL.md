---
name: "declarative-schema-validation"
description: "Constructing robust, declarative validation pipelines at application boundaries using schema validators (Zod, Pydantic, Joi) with custom transformations and error formatting."
category: "logic"
subcategory: "validation"
language: "typescript"
framework: "none"
technology: "zod"
difficulty: "intermediate"
tags: ["logic", "validation", "schemas", "zod", "sanitization", "runtime-safety"]
---

# Declarative Runtime Schema Validation and Sanitization

## Purpose
Provide concrete patterns for strictly validating and sanitizing untrusted incoming data (HTTP requests, files, environment variables, webhooks) before it reaches application business logic.

## When to Use
Use at all system entrypoints: API route handlers, form submission processors, environment variable loaders, and inter-service messaging queues.

## Inputs / Context
Data schemas, business validation rules, sanitization requirements (trimming, stripping HTML), and error reporting formats.

## Instructions
1. Validate all external inputs at the system perimeter before any business logic executes; treat all external data as untrusted `unknown`.
2. Use declarative runtime schema libraries (such as Zod for TypeScript or Pydantic for Python) rather than manual imperative `if/else` checks.
3. Infer static types directly from runtime schemas (`type User = z.infer<typeof UserSchema>`) to guarantee single-source-of-truth type parity.
4. Apply sanitization transformations within the schema parsing pipeline (e.g., `.trim()`, `.toLowerCase()`, stripping disallowed characters).
5. Chain refined custom validations (`.refine()`) for cross-field business invariants (e.g., `endDate >= startDate`).
6. Format validation failure errors into standardized structures mapping field paths to user-friendly error messages (avoid leaking raw schema internals).
7. Strip unknown properties (`.strip()`) to prevent mass assignment vulnerabilities, or reject them (`.strict()`) where strict adherence is required.

## Constraints / Rules
- Never trust client-side validation alone; always enforce identical or stricter validation on the backend.
- Never use `as Type` casting on raw unvalidated input; always use `.parse()` or `.safeParse()`.
- Do not expose sensitive internal property paths in public validation error messages.

## Workflow
1. Define schema specifying types, lengths, regex patterns, and optionality.
2. Attach normalization transformations (trimming, type coercion).
3. Add multi-field refinement rules for business constraints.
4. Parse input safely using `.safeParse()` and handle failure branch.
5. Test against malicious payloads (SQL injection strings, oversized payloads, type mismatch).

## Expected Output
Reusable declarative schema definition, inferred TypeScript types, and validation middleware with structured error responses.

## Validation Checklist
- [ ] Are inputs verified at the perimeter before reaching service layers?
- [ ] Are static types inferred directly from the schema without duplication?
- [ ] Are multi-field dependencies (e.g., password confirmation) validated?
- [ ] Are unexpected fields stripped or rejected to prevent mass-assignment?
- [ ] Are validation error messages user-friendly and actionable?

## Common Mistakes & Antipatterns
- Writing dozens of manual `if (!req.body.name || typeof req.body.name !== 'string')` checks that miss null, undefined, or empty-string edge cases.
- Duplicating TypeScript interfaces and validation functions separately, causing them to drift out of sync.
- Casting unvalidated JSON payloads with `const data = JSON.parse(str) as UserProfile`.

## Concrete Real-World Example
Scenario: An API registration endpoint allows users to submit empty strings for passwords and crashes when an unexpected property is passed.
Prompt: Build a strict validation schema for a user registration endpoint using Zod.
Application: The AI creates `RegistrationSchema` with trimmed strings, email format, minimum 12-character password complexity, cross-field password confirmation refinement, strips unknown keys, and returns a 422 Problem Details response on validation failure.
