---
name: "horizontal-scaling-and-sharding"
description: "Scaling databases and stateful backends from single nodes to distributed clusters using read-replicas, CQRS, horizontal database sharding, and write buffers."
category: "architecture"
subcategory: "scalability"
language: "agnostic"
framework: "none"
technology: "scaling-architecture"
difficulty: "advanced"
tags: ["architecture", "scalability", "sharding", "read-replicas", "cqrs", "horizontal-scaling"]
---

# Horizontal Scaling, Read Replicas, and Sharding Architectures

## Purpose
Provide AI agents with architectural strategies for scaling database read and write throughput when single-node relational instances reach hardware CPU, memory, and IOPS ceilings.

## When to Use
Use when scaling databases past single large instances, handling massive read/write imbalances, or architecting multi-terabyte data platforms.

## Inputs / Context
Read vs write QPS ratios, dataset size, query latency percentiles, and hardware constraints.

## Instructions
1. Vertical vs. Horizontal Scaling Roadmap:
   - Stage 1: Vertical Scaling (Bigger Instance) + Index Tuning & Connection Pooling.
   - Stage 2: Caching (Redis/Memcached) for hot read paths.
   - Stage 3: Read Replicas (Read/Write Splitting) with asynchronous replication for read-heavy workloads (e.g., 90% reads, 10% writes).
   - Stage 4: CQRS (Command Query Responsibility Segregation): Separate specialized read databases (Elasticsearch/ClickHouse for search and analytics) from OLTP write masters.
   - Stage 5: Horizontal Sharding: Splitting data across multiple write-master databases.
2. Read/Write Splitting Architecture:
   - Configure application connection routers: send `SELECT` queries to Read Replica pools; send `INSERT`, `UPDATE`, `DELETE` to the Primary Master.
   - Mitigate Replication Lag: When a user performs a write (e.g., posts a comment), route subsequent reads from that specific user to the Primary Master for 5 seconds ('Read-Your-Own-Writes' consistency), while routing general users to replicas.
3. Horizontal Sharding Patterns:
   - Range-Based Sharding: Partition by range (e.g., IDs 1-10M on Shard 1). Risk: severe write hot-spotting on the latest range.
   - Hash-Based Sharding: Partition by `hash(sharding_key) % num_shards`. Provides uniform write distribution.
   - Directory / Lookup Sharding: A central mapping service maps entity IDs to specific physical shard nodes. Highly flexible for shard migrations.
4. Sharding Router / Proxy Layer:
   - Abstract sharding topology behind a routing proxy (Vitess, Citus, or application-level routing) so developers write standard queries without managing raw shard connections.

## Constraints / Rules
- Never jump directly to horizontal database sharding before exhausting caching, indexing, and read-replica optimizations.
- Avoid sharding keys that cause cross-shard queries on primary OLTP workflows.
- Do not ignore replication lag in read-replica configurations.

## Workflow
1. Audit database metrics to determine whether the bottleneck is Read-bound or Write-bound.
2. If Read-bound, deploy Read Replicas with Read-Your-Own-Writes routing.
3. If Write-bound, select an optimal sharding key and hashing strategy.
4. Implement sharding router middleware.
5. Establish automated shard rebalancing procedures.

## Expected Output
Comprehensive database scaling architecture blueprint featuring read/write splitting, replication lag mitigation, and horizontal sharding routing diagrams.

## Validation Checklist
- [ ] Is Read/Write splitting implemented with a routing proxy?
- [ ] Is 'Read-Your-Own-Writes' consistency enforced for mutating users?
- [ ] Is the sharding key evaluated for uniform hash distribution?
- [ ] Are cross-shard joins strictly avoided in high-frequency queries?
- [ ] Are shard rebalancing and migration plans documented?

## Common Mistakes & Antipatterns
- Sharding prematurely when simple query indexing and a 20-dollar Redis cache would have solved the performance bottleneck with 1% of the complexity.
- Reading from a read replica immediately after a user updates their profile, showing the user their old profile because of 200ms replication lag, confusing the user into resubmitting.
- Selecting a sharding key like `country`, causing the US shard to melt while other country shards remain 95% empty.

## Concrete Real-World Example
Scenario: A SaaS project management platform is running out of database write IOPS on an AWS RDS Postgres primary database holding 40 million tasks across 5,000 corporate tenants.
Prompt: Design a horizontal database sharding strategy for this multi-tenant SaaS platform.
Application: The AI selects `tenant_id` as the sharding key, hashes tenant IDs across a cluster of 4 PostgreSQL shards, routes tenant queries via application middleware, guarantees all tenant task queries stay confined to a single shard, and provides unlimited horizontal write scaling.
