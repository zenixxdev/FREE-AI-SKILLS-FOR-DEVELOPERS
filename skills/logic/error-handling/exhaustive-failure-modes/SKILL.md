---
name: "exhaustive-failure-modes"
description: "Taxonomizing domain failure modes, distinguishing transient from permanent errors, modeling typed error hierarchies, and ensuring exhaustive compiler verification."
category: "logic"
subcategory: "error-handling"
language: "typescript"
framework: "none"
technology: "error-handling"
difficulty: "intermediate"
tags: ["logic", "error-handling", "failure-modes", "domain-errors", "exhaustiveness"]
---

# Exhaustive Error Modeling and Failure Mode Taxonomy

## Purpose
Guide AI in structuring comprehensive error taxonomies that classify failures accurately, provide actionable operational context, and ensure all error branches are handled.

## When to Use
Use when designing domain services, API clients, distributed workflows, or refactoring generic try/catch blocks.

## Inputs / Context
Domain operations, potential external failure points (network, storage, auth, rate limit), and user impact.

## Instructions
1. Classify all errors into three operational categories:
   - Domain Errors: Expected business rule violations (e.g., `InsufficientFundsError`).
   - Technical/Transient Errors: Recoverable operational failures (e.g., `DatabaseTimeoutError`, `RateLimitExceededError`).
   - Fatal/Bug Errors: Unrecoverable software defects or invariant violations (e.g., `NullPointerError`, `CorruptedStateError`).
2. Model domain errors as distinct, typed classes inheriting from a base `AppError`.
3. Include structured context on every error instance: error code, timestamp, entity ID, correlation ID, and whether the error is retryable.
4. Ensure exhaustive handling of union error types in TypeScript using the `never` type pattern in `switch/case` default blocks.
5. Never catch errors without taking concrete action: log with context, translate to a higher-level domain error, retry, or re-throw.
6. Mask internal technical details in public-facing errors while preserving full diagnostic traces in internal application logs.

## Constraints / Rules
- Never write empty catch blocks (`catch (e) {}`).
- Never throw generic strings or plain object literals (`throw 'error'`); always throw instances of `Error`.
- Avoid catching top-level fatal exceptions simply to return a fake fallback without logging.

## Workflow
1. Catalog all potential failure scenarios for the feature.
2. Define domain error class hierarchy with metadata properties.
3. Implement operation returning `Result<T, DomainError>` or throwing typed errors.
4. Add exhaustive pattern matching handler at the controller or UI boundary.
5. Verify compiler enforcement using `assertNever(x: never): never`.

## Expected Output
Strongly typed error class taxonomy with structured metadata, retryability flags, and exhaustive pattern-matching handlers.

## Validation Checklist
- [ ] Are errors categorized as domain, transient, or fatal?
- [ ] Do error classes include machine-readable error codes?
- [ ] Is exhaustive pattern matching enforced by the compiler?
- [ ] Are internal stack traces excluded from client responses?
- [ ] Are all caught errors logged or translated with context preserved?

## Common Mistakes & Antipatterns
- Catching all errors and returning HTTP 500, obscuring client validation issues (400) or missing resources (404).
- Throwing raw strings (`throw "Invalid email"`), losing stack trace information and error prototype chains.
- Catching an error, logging it, and then rethrowing it at multiple intermediate layers, flooding logs with duplicate entries.

## Concrete Real-World Example
Scenario: A payment handler catches all exceptions with `catch (e) { return "failed"; }`, making it impossible for the caller to know whether to retry (network timeout) or prompt the user for a new card (insufficient funds).
Prompt: Create a typed error taxonomy and handler for this payment gateway integration.
Application: The AI creates `PaymentDeclinedError` (permanent), `GatewayTimeoutError` (transient, retryable = true), and `InvalidCardDataError`, implements a handler that retries timeouts with backoff, and maps domain errors to precise client responses.
