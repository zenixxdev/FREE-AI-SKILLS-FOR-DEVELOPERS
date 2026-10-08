---
name: "signature-verification-and-delivery"
description: "Implementing secure webhook receivers and dispatch engines with HMAC-SHA256 signature verification, replay attack prevention, and idempotent retry pipelines."
category: "api"
subcategory: "webhooks"
language: "agnostic"
framework: "none"
technology: "webhooks"
difficulty: "intermediate"
tags: ["api", "webhooks", "hmac-sha256", "security", "replay-attacks", "signature-verification"]
---

# Webhook Signature Verification and Resilient Delivery Engine

## Purpose
Provide AI agents with rigorous security and reliability patterns for both receiving external webhooks (Stripe, GitHub) and building outgoing webhook dispatch engines.

## When to Use
Use when ingesting third-party webhook events, designing webhook notification systems for SaaS platforms, or securing asynchronous callbacks.

## Inputs / Context
Webhook payload, secret signing key, signature header (e.g., `X-Signature`, `Stripe-Signature`), timestamp tolerance window.

## Instructions
1. RECEIVING WEBHOOKS:
   - Always verify the cryptographic signature using HMAC-SHA256 over the raw, unparsed request body string paired with the shared webhook secret.
   - Prevent Timing Attacks: always compare the computed signature against the header signature using constant-time comparison (`crypto.timingSafeEqual`).
   - Prevent Replay Attacks: require and verify a timestamp header (e.g., `t=1710000000`). Reject requests older than a tolerance window (e.g., 5 minutes / 300 seconds).
   - Ingest Immediately: upon signature verification, persist the event payload into a queue or database and return HTTP `200 OK` or `202 Accepted` within 200ms; execute actual business logic asynchronously in a background worker.
   - Enforce Idempotency: track received webhook event IDs to discard duplicate deliveries.
2. DISPATCHING WEBHOOKS:
   - Compute signature header: `t=TIMESTAMP,v1=HMAC_SHA256(secret, TIMESTAMP + "." + payload)`.
   - Implement exponential backoff retries with jitter for non-2xx responses or network timeouts over 24-72 hours.
   - Automatically disable or alert on webhook subscriptions that fail consistently for over 50 consecutive attempts.

## Constraints / Rules
- Never verify webhook signatures using parsed JSON objects (`req.body`); verification must run against the exact raw byte buffer received over the wire.
- Never use standard string equality (`===`) for signature verification; always use constant-time comparison.
- Do not perform slow synchronous business processing before returning HTTP 200 to the webhook provider.

## Workflow
1. Capture raw request body before JSON body-parser middleware executes.
2. Extract timestamp and signature components from header.
3. Verify timestamp is within 300-second window.
4. Calculate expected HMAC-SHA256 signature and verify with constant-time equality.
5. Deduplicate event ID and push to background processing queue.
6. Return HTTP 200 OK immediately.

## Expected Output
Secure webhook handler implementation with raw body parsing, timing-safe HMAC verification, replay defense, and async queue offloading.

## Validation Checklist
- [ ] Is signature verified against raw unparsed request bytes?
- [ ] Is constant-time equality (`timingSafeEqual`) used for comparison?
- [ ] Are timestamps validated to block replay attacks?
- [ ] Does the endpoint respond with 200 OK immediately before long-running tasks run?
- [ ] Are event IDs deduplicated to ensure idempotent processing?

## Common Mistakes & Antipatterns
- Parsing the request body with `JSON.parse()` and re-stringifying with `JSON.stringify()` before computing the HMAC; key order or whitespace differences break the signature.
- Using `signature === computedSignature`, exposing the endpoint to remote timing side-channel attacks.
- Processing heavy database migrations synchronously in the webhook controller, causing the webhook provider (e.g., Stripe) to timeout and repeatedly retry the webhook.

## Concrete Real-World Example
Scenario: A payment webhook handler crashes or times out because it re-stringifies JSON payloads to verify signatures and runs credit card provisioning synchronously.
Prompt: Refactor this Stripe webhook receiver to be secure, fast, and resilient against replay attacks.
Application: The AI captures `req.rawBody`, validates `t` timestamp against `Date.now()`, performs constant-time HMAC comparison, pushes the verified event to a BullMQ Redis queue, and immediately returns `{ received: true }` with status 200.
