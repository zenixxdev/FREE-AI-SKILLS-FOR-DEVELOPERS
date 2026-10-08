---
name: "rate-limiting-and-resilience"
description: "Designing high-reliability backend resilience patterns including token bucket rate limiting, distributed circuit breakers, and jittered exponential backoff retries."
category: "backend"
subcategory: "general"
language: "agnostic"
framework: "none"
technology: "distributed-systems"
difficulty: "advanced"
tags: ["backend", "resilience", "rate-limiting", "circuit-breaker", "retries", "fault-tolerance"]
---

# Backend Rate Limiting, Circuit Breakers, and Retries

## Purpose
Provide universal architectural patterns for safeguarding backend systems against cascading failures, traffic spikes, and degraded third-party downstream dependencies.

## When to Use
Use when integrating external HTTP APIs, designing public API gateways, or stabilizing services under heavy load.

## Inputs / Context
Traffic thresholds, downstream SLA constraints, failure rate trigger conditions, and retry policies.

## Instructions
1. Implement Rate Limiting at the ingress gateway using the Token Bucket or Sliding Window Counter algorithm backed by Redis.
2. Return standard HTTP headers on rate-limited responses: `X-RateLimit-Limit`, `X-RateLimit-Remaining`, `X-RateLimit-Reset`, and HTTP `429 Too Many Requests` with a `Retry-After` header.
3. Protect downstream integrations using the Circuit Breaker pattern with three distinct states:
   - Closed: Normal operation; requests pass through.
   - Open: Failure threshold exceeded (e.g., 50% errors over 10s); fail fast immediately without calling downstream.
   - Half-Open: Trial state; allow a small percentage of probe requests through to test service recovery.
4. Implement Retries strictly for transient failures (HTTP 408, 429, 502, 503, 504 and network timeouts); never retry non-idempotent 4xx client errors (400, 401, 403, 404, 422).
5. Always apply Full Jitter to Exponential Backoff retry calculations (`sleep = random(0, min(max_backoff, base * 2 ^ attempt))`) to prevent the 'thundering herd' problem.
6. Enforce hard timeout limits on all outbound socket connections and request execution phases.

## Constraints / Rules
- Never retry non-idempotent operations (e.g., POST payments) without an explicit Idempotency Key.
- Avoid infinite retry loops; cap maximum retry attempts (typically 3-5).
- Never implement circuit breakers using local in-memory state when running across a multi-instance auto-scaled cluster without centralized state synchronization.

## Workflow
1. Define SLA, timeout budgets, and error rate thresholds for each external dependency.
2. Configure sliding window rate limiters per IP / API key.
3. Wrap external client calls in a circuit breaker wrapper.
4. Implement retry loops with jittered backoff for idempotent operations.
5. Expose Prometheus metrics for circuit state changes and rejected requests.

## Expected Output
Resilience layer implementation providing distributed rate limiting, circuit breaker state management, and jittered retries.

## Validation Checklist
- [ ] Are rate limit responses returning HTTP 429 and `Retry-After` headers?
- [ ] Does the circuit breaker trip to Open state when failure thresholds are crossed?
- [ ] Are retries restricted to transient errors and idempotent operations?
- [ ] Is randomized jitter added to exponential backoff delays?
- [ ] Are socket and request timeouts configured on all outbound clients?

## Common Mistakes & Antipatterns
- Retrying failed requests with a fixed delay, synchronizing hundreds of clients and repeatedly knocking down the recovering server.
- Retrying HTTP 400 Bad Request or HTTP 401 Unauthorized errors that will never succeed on repeat.
- Lacking outbound timeouts, causing web worker threads to hang indefinitely when a partner API degrades.

## Concrete Real-World Example
Scenario: When an external SMS provider suffers a micro-outage, an auth service locks up because hundreds of worker threads hang waiting on timed-out HTTP calls.
Prompt: Implement a resilient HTTP client wrapper with circuit breaking and retries for this SMS notification service.
Application: The AI wraps the HTTP client in a circuit breaker that trips to Open after 5 consecutive 5xx errors, applies a 2-second timeout per attempt, retries idempotent status checks using full jitter backoff, and fails fast with a cached fallback when the circuit is Open.
