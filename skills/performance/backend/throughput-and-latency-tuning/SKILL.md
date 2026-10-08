---
name: "throughput-and-latency-tuning"
description: "Tuning backend service throughput and latency through asynchronous non-blocking I/O, thread pool right-sizing, connection reuse, and response streaming."
category: "performance"
subcategory: "backend"
language: "agnostic"
framework: "none"
technology: "backend-performance"
difficulty: "advanced"
tags: ["performance", "backend", "throughput", "latency", "connection-pooling", "keep-alive"]
---

# Backend Throughput and Latency Optimization

## Purpose
Provide AI agents with concrete architectural optimizations for maximizing requests-per-second (RPS) throughput and minimizing P95/P99 latency in backend services.

## When to Use
Use when scaling microservices, preparing for high-traffic events (flash sales), reducing infrastructure server costs, or tuning API gateways.

## Inputs / Context
Current RPS, P50/P95/P99 latency metrics, CPU/memory saturation levels, connection pool settings, and downstream dependencies.

## Instructions
1. Measure P95 and P99 Latency: Never rely on average (mean) latency; averages obscure severe latency spikes suffered by tail percentiles.
2. Enable HTTP Keep-Alive and Connection Pooling:
   - Always reuse TCP sockets across HTTP requests to downstream services and databases (`keepAlive: true`).
   - Establishing a new TLS handshake on every outbound request adds 50-150ms of needless latency per call.
3. Optimize Database Connection Pools:
   - Size connection pools accurately using Little's Law and thread count formulas: `pool_size = (core_count * 2) + effective_spindle_count`.
   - Avoid oversized connection pools: having 500 database connections for 4 CPU cores causes massive CPU context-switching overhead and degrades performance.
4. Parallelize Independent Operations:
   - When an endpoint requires data from multiple independent services or queries, execute them concurrently (`Promise.all()`, `asyncio.gather()`, or goroutines) rather than sequentially.
5. Implement Response Compression:
   - Enable Brotli or Gzip compression on JSON and text payloads above 1KB; disable compression for payloads under 1KB where compression overhead exceeds bandwidth gains.
6. Stream Large Payloads:
   - Stream large JSON arrays or file exports directly to the client rather than buffering the entire multi-megabyte payload into server RAM.
7. Optimize JSON Serialization:
   - Use fast JSON serializers (e.g., `fast-json-stringify` in Node, `orjson` in Python) on hot API paths.

## Constraints / Rules
- Never create new HTTP client or database pool instances per request; pools must be long-lived singletons.
- Avoid setting unbounded connection pool maximums.
- Do not compress small responses (< 1KB) or already compressed binary assets (JPEG, PNG, Gzip).

## Workflow
1. Run baseline load tests (using k6 or wrk) recording P50, P95, and P99 latency.
2. Enable HTTP keep-alive and connection reuse on all outbound clients.
3. Convert sequential downstream calls into parallel operations.
4. Tune database connection pool sizes based on core counts.
5. Re-run load tests to verify increased RPS and lowered P99 tail latency.

## Expected Output
High-throughput backend configuration featuring connection pooling, parallel downstream calls, fast serialization, and verified P99 latency reductions.

## Validation Checklist
- [ ] Are P95 and P99 percentiles tracked and reduced?
- [ ] Is HTTP Keep-Alive active on all outbound HTTP/RPC clients?
- [ ] Are independent downstream queries executed concurrently?
- [ ] Are database connection pools sized properly without context-switching bloat?
- [ ] Are large responses streamed without full memory buffering?

## Common Mistakes & Antipatterns
- Instantiating a new database connection client inside the route handler on every incoming request, exhausting sockets and causing 100ms connection delays.
- Executing 4 independent database queries sequentially with `await` when they could have been executed in parallel with `Promise.all()`.
- Setting database connection pool size to 1,000 connections, causing PostgreSQL to thrash in lock contention and crash under load.

## Concrete Real-World Example
Scenario: An API gateway endpoint takes 450ms P95 latency because it makes three sequential HTTP calls to user, billing, and permission services, creating new HTTP connections each time.
Prompt: Optimize this backend API gateway route for high throughput and lower latency.
Application: The AI configures an `http.Agent` with `keepAlive: true` and a max socket pool, launches all three microservice fetches concurrently via `Promise.all()`, and applies Brotli compression, dropping P95 latency from 450ms to 95ms and quadrupling maximum throughput.
