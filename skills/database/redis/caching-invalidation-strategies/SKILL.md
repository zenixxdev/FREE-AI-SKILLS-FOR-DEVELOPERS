---
name: "caching-invalidation-strategies"
description: "Architecting resilient Redis caching layers utilizing Cache-Aside, Write-Through, TTL jitter, dogpile/stampede prevention via distributed locks, and probabilistic early expiration."
category: "database"
subcategory: "redis"
language: "agnostic"
framework: "none"
technology: "redis"
difficulty: "advanced"
tags: ["database", "redis", "caching", "invalidation", "cache-stampede", "ttl-jitter", "distributed-locks"]
---

# Redis Caching Strategies and Invalidation Architecture

## Purpose
Provide concrete engineering patterns for implementing high-performance Redis caching layers that eliminate cache stampedes, stale data bugs, and memory exhaustion.

## When to Use
Use when adding a caching layer over relational databases or external APIs, caching expensive computation results, or preventing database overload.

## Inputs / Context
Data volatility, cache hit ratio goals, memory capacity, read/write patterns, and acceptable staleness tolerance.

## Instructions
1. Standardize on the Cache-Aside (Lazy Loading) pattern for general read workflows:
   - Check Redis for key. If HIT, return cached value immediately.
   - If MISS, acquire distributed lock or compute from primary database, write result to Redis with TTL, and return.
2. Always attach a Time-To-Live (TTL) to every cached key; unexpiring keys in Redis lead to uncontrolled memory growth and eventual OOM evictions.
3. Prevent Cache Stampedes (Dogpile Effect) when hot keys expire under high concurrency:
   - Use Probabilistic Early Expiration (XFetch algorithm) to recompute cache in the background before hard expiration.
   - Or use Redis-based distributed mutex locks (e.g., `SET key lock NX PX 5000`) so only a single worker recomputes the cache while others wait.
4. Prevent synchronized mass-expirations by adding randomized Jitter to TTLs (`actualTTL = baseTTL + random(-jitter, +jitter)`).
5. Invalidate caches explicitly on data mutations: emit cache invalidation events or delete keys directly upon write (`redis.del(key)`).
6. Namespace Redis keys cleanly using colons: `service:entity:identifier:attribute` (e.g., `ecommerce:product:84920:details`).
7. Store structured data using Redis Hashes (`HSET`, `HGETALL`) for multi-field entities or compact binary serialization (MessagePack, protobuf) instead of verbose JSON strings.

## Constraints / Rules
- Never write keys without a TTL unless explicitly intended for persistent storage.
- Never use the `KEYS *` command in production Redis; it blocks the single-threaded server. Use `SCAN` with cursor iteration instead.
- Avoid caching empty or null results indefinitely; use a very short TTL (e.g., 30 seconds) for negative caching to prevent cache penetration attacks.

## Workflow
1. Define key namespacing convention and serialization strategy.
2. Implement Cache-Aside wrapper with base TTL and randomized jitter.
3. Add distributed locking around cache-miss recalculation.
4. Hook cache deletion/invalidation into database write pipelines.
5. Monitor cache hit/miss metrics and memory fragmentation ratio (`INFO memory`).

## Expected Output
Resilient Redis caching service wrapper with TTL jitter, stampede protection, atomic mutations, and negative cache handling.

## Validation Checklist
- [ ] Does every written key include an explicit TTL?
- [ ] Is randomized jitter added to TTL values to avoid synchronized expiry?
- [ ] Is `KEYS *` prohibited in favor of non-blocking `SCAN`?
- [ ] Are cache stampedes prevented on hot key misses using distributed locks or XFetch?
- [ ] Are caches invalidated or updated upon primary data mutation?

## Common Mistakes & Antipatterns
- Caching an expensive database query without a mutex lock, causing 1,000 concurrent requests to hit the database simultaneously when the key expires (Cache Stampede).
- Setting identical 1-hour TTLs on 500,000 product keys during an import, causing all 500,000 keys to expire at the exact same second 1 hour later.
- Running `KEYS user:*` on a production Redis instance with 10 million keys, freezing the Redis server for several seconds.

## Concrete Real-World Example
Scenario: A viral news website crashes its Postgres database every 10 minutes because the homepage article cache expires, and 5,000 concurrent requests simultaneously execute the same heavy SQL join.
Prompt: Refactor this article cache retrieval function to prevent cache stampedes in Redis.
Application: The AI wraps the fetch in an atomic `SET lock:article:123 NX PX 3000` pattern, allowing only the first request to query Postgres while other incoming requests wait or receive stale data with a soft TTL, and adds a +/- 15% randomized jitter to the hard TTL.
