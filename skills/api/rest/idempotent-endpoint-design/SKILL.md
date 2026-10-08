---
name: "idempotent-endpoint-design"
description: "Designing robust, idempotent REST API mutations (POST, PUT, PATCH, DELETE) using IETF Idempotency-Key headers, atomic distributed locks, and response caching."
category: "api"
subcategory: "rest"
language: "agnostic"
framework: "none"
technology: "rest-api"
difficulty: "intermediate"
tags: ["api", "rest", "idempotency", "http", "distributed-systems", "payments"]
---

# Idempotent REST API Design and Idempotency Keys

## Purpose
Instruct AI agents to implement reliable HTTP endpoints where duplicate network requests (caused by client retries, timeouts, or disconnects) do not produce duplicate side-effects.

## When to Use
Use when designing billing/payment APIs, order creation endpoints, email dispatch triggers, or any mutation where duplicate execution causes financial or data corruption.

## Inputs / Context
API endpoint specifications, payload schemas, side-effects, idempotency header standard (`Idempotency-Key`), and storage backend.

## Instructions
1. Adhere to standard HTTP method idempotency semantics:
   - GET, HEAD, OPTIONS, PUT, DELETE must be inherently idempotent.
   - POST is non-idempotent by default; require an `Idempotency-Key` HTTP header for non-idempotent state mutations.
2. Implement Idempotency-Key processing pipeline:
   - Validate client provides a valid UUIDv4 or string token in `Idempotency-Key`.
   - Compute a SHA-256 fingerprint hash of the request method, path, and request body.
   - Check cache/database for existing key:
     * If key exists with identical payload hash and status `COMPLETED`: immediately return the cached status code and response body without re-executing logic.
     * If key exists with a DIFFERENT payload hash: reject immediately with HTTP `422 Unprocessable Entity` or `400 Bad Request` ('Idempotency key reused with mismatched payload').
     * If key exists with status `PROCESSING`: reject with HTTP `409 Conflict` or `425 Too Early` to prevent concurrent execution of the same key.
   - If key does not exist: atomically store key with status `PROCESSING` and a short lock TTL (e.g., 60 seconds).
3. Execute the domain mutation within an isolated transaction.
4. Upon successful completion, update the idempotency record to `COMPLETED`, store the HTTP status code, headers, and response body, and set a retention TTL (e.g., 24-72 hours).
5. On unhandled server errors, delete the idempotency lock so the client can retry safely.
6. Return standard headers: `Idempotency-Key`, `Original-Request-Date`.

## Constraints / Rules
- Never execute non-idempotent side effects before acquiring the idempotency lock.
- Never return cached responses if the payload hash differs from the initial request.
- Do not store unbounded idempotency records; always enforce a retention TTL.

## Workflow
1. Extract and validate `Idempotency-Key` header from inbound request.
2. Hash incoming request body.
3. Query Redis/Postgres for existing idempotency record using atomic lock primitives.
4. Process business logic or return cached response.
5. Save final HTTP response to the idempotency store upon completion.

## Expected Output
Idempotent API endpoint middleware and controller code supporting header validation, payload fingerprinting, atomic state transitions, and cached response replay.

## Validation Checklist
- [ ] Are duplicate requests with identical keys replaying the initial response without re-executing logic?
- [ ] Are duplicate keys with different payloads rejected with HTTP 422?
- [ ] Is concurrent execution with the same key blocked with HTTP 409?
- [ ] Is an expiration TTL set on stored idempotency keys?
- [ ] Are locks released if an unhandled internal exception occurs?

## Common Mistakes & Antipatterns
- Saving the idempotency response before the database transaction commits, returning success even if the database rollback failed.
- Allowing clients to reuse the same idempotency key with different payment amounts without detecting the payload mismatch.
- Failing to handle in-flight duplicate requests arriving milliseconds apart, leading to double-charging before the first request finishes.

## Concrete Real-World Example
Scenario: An e-commerce customer with a spotty mobile connection taps 'Pay $100' three times because the first two requests timed out.
Prompt: Build an idempotency middleware for this Express payment route using Redis.
Application: The AI creates middleware checking `Idempotency-Key`, sets an atomic `SET NX` lock with a hash of `{ amount: 100, cartId: 'xyz' }`, processes the payment only once, caches the 200 response, and returns the cached response for the two subsequent retried requests.
