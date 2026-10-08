---
name: "strict-type-contracts"
description: "Designing expressive, compile-time verified domain models and API contracts using TypeScript strict mode, discriminated unions, branded types, and type guards."
category: "frontend"
subcategory: "typescript"
language: "typescript"
framework: "none"
technology: "typescript"
difficulty: "advanced"
tags: ["frontend", "typescript", "type-safety", "discriminated-unions", "branded-types", "type-guards"]
---

# Strict TypeScript Domain Modeling and Type Contracts

## Purpose
Direct AI models to construct foolproof type definitions that make illegal states unrepresentable, eliminate `any` types, and ensure end-to-end type safety across the frontend stack.

## When to Use
Use when designing domain models, typing state management stores, writing SDKs, declaring API contracts, or refactoring loosely typed JavaScript into strict TypeScript.

## Inputs / Context
Domain entities, business rules, API payload schemas, possible error modes, and state lifecycle transitions.

## Instructions
1. Enable strict mode in `tsconfig.json` (`strict: true`, `noImplicitAny: true`, `strictNullChecks: true`, `noUncheckedIndexedAccess: true`).
2. Model polymorphic data and state machines using Discriminated Unions with a single shared discriminant property (e.g., `type: 'idle' | 'loading' | 'success' | 'error'`).
3. Make illegal states unrepresentable: never combine optional properties that must exist together (e.g., `{ data?: Data; error?: Error; isLoading: boolean }` is an antipattern; use a discriminated union instead).
4. Utilize Branded Types (nominal typing) for primitive identifiers (e.g., `type UserId = string & { readonly __brand: unique symbol }`) to prevent passing a `CompanyId` where a `UserId` is expected.
5. Implement custom Type Guards (`value is TargetType`) and assertion functions (`asserts condition`) to narrow types safely at runtime boundaries.
6. Use `unknown` instead of `any` for incoming untrusted data (e.g., JSON parsing, API responses) and validate using runtime schema parsers (such as Zod) before type casting.
7. Leverage `satisfies` operator to validate that an expression matches a type contract without widening the inferred literal types.

## Constraints / Rules
- Never use `any` unless explicitly wrapping untyped third-party legacy libraries with documented justification.
- Avoid non-null assertions (`!`) unless immediately following a verified condition that the compiler cannot infer.
- Never use TypeScript `enum`; prefer `const` objects with `as const` and indexed access types (`typeof MY_ENUM[keyof typeof MY_ENUM]`).

## Workflow
1. Identify core domain entities and their invariant relationships.
2. Define primitive branded types for IDs and validated scalars.
3. Formulate state representations as discriminated union records.
4. Build user-defined type guards and runtime validation boundaries.
5. Verify compiler diagnostic output under `tsc --noEmit`.

## Expected Output
Strict, clean TypeScript types, branded primitives, and discriminated unions with zero `any` declarations and exhaustive switch-case handling.

## Validation Checklist
- [ ] Is `noUncheckedIndexedAccess` satisfied for dynamic property lookups?
- [ ] Are all asynchronous UI states modeled as discriminated unions?
- [ ] Are nominal types used to distinguish domain entity IDs?
- [ ] Are runtime boundaries validated from `unknown` rather than cast via `as`?
- [ ] Does `tsc --noEmit` pass with zero type errors?

## Common Mistakes & Antipatterns
- Declaring state as `{ isLoading: boolean, data?: User, error?: Error }`, allowing nonsensical states like `{ isLoading: true, error: Error }`.
- Using `as unknown as MyType` type assertions to bypass compiler errors instead of fixing structural incompatibilities.
- Using TypeScript numeric enums which emit reverse-mapping objects into JavaScript bundles.

## Concrete Real-World Example
Scenario: A payment processing module has subtle runtime crashes because customer IDs, transaction IDs, and invoice IDs (all strings) are accidentally passed into the wrong API parameters.
Prompt: Refactor this payment module's types to prevent parameter transposition bugs and make state transitions type-safe.
Application: The AI creates nominal branded types (`CustomerId`, `TransactionId`), models payment state as a discriminated union (`PendingPayment`, `AuthorizedPayment`, `FailedPayment`), and creates exhaustive pattern matching functions using `never` check.
