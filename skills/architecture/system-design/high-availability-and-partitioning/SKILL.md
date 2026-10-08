---
name: "high-availability-and-partitioning"
description: "Designing high-availability distributed systems utilizing the CAP theorem, horizontal partitioning (sharding), consistent hashing, and redundancy."
category: "architecture"
subcategory: "system-design"
language: "agnostic"
framework: "none"
technology: "system-design"
difficulty: "advanced"
tags: ["architecture", "system-design", "high-availability", "sharding", "consistent-hashing", "cap-theorem"]
---

# High Availability System Design and Partitioning Architecture

## Purpose
Instruct AI agents to author comprehensive system design architectures that eliminate single points of failure, partition data horizontally, and maintain high availability (99.99%+).

## When to Use
Use when architecting large-scale backend systems, preparing system design proposals, designing high-throughput data platforms, or scaling beyond single-node databases.

## Inputs / Context
Traffic scale (QPS/RPS), data storage growth per year, latency budget, availability target (number of 9s), and consistency model requirements.

## Instructions
1. Eliminate All Single Points of Failure (SPOF):
   - Every tier of the architecture (DNS, Load Balancers, API Gateways, Application Servers, Caches, Databases) must be deployed across at least two Availability Zones (AZs) with automated failover.
2. Evaluate CAP / PACELC Theorem Trade-offs:
   - Under network partitions (P): Choose Consistency (CP) for financial ledgers, inventory counters, and auth tokens; choose Availability (AP) for social media feeds, analytics telemetry, and shopping cart browsing.
3. Horizontal Data Partitioning (Sharding):
   - Select a high-cardinality Partition Key that evenly distributes write and read traffic (e.g., `user_id` or `tenant_id`).
   - Avoid low-cardinality keys (like `country` or `gender`) that create hot partition bottlenecks.
4. Consistent Hashing for Distributed Nodes:
   - Use Consistent Hashing with virtual nodes (tokens) across distributed caches and database shards.
   - When a node is added or removed, consistent hashing rebalances only `K/N` keys (where K is total keys, N is node count), preventing massive cache churn.
5. Asynchronous Decoupling via Message Queues:
   - Convert synchronous HTTP request-response chains between microservices into asynchronous message-driven queues (Kafka, SQS) to isolate failures and absorb traffic spikes.
6. Graceful Degradation and Shedding:
   - Implement load shedding (rejecting low-priority background requests when CPU > 85%) to protect critical user login and checkout transactions.

## Constraints / Rules
- Never design a high-availability system with a single master database without automated standby replication and failover.
- Avoid cross-shard joins and distributed transactions (2PC) across database shards; design queries to be satisfied within a single shard.
- Do not choose a partition key that concentrates traffic onto a single hot node.

## Workflow
1. Estimate capacity: calculate QPS, read/write ratio, and 5-year storage volume.
2. Define high-level architecture diagrams (Load Balancers, Services, Caches, Shards).
3. Select partition key and consistent hashing scheme.
4. Formulate failure modes for each tier and establish redundancy.
5. Document latency budgets and CAP theorem trade-offs.

## Expected Output
System Design specification document featuring capacity calculations, data flow architecture, sharding strategy, and failure recovery protocols.

## Validation Checklist
- [ ] Are single points of failure eliminated across all tiers?
- [ ] Is the partition key evaluated for hot-spot distribution risks?
- [ ] Is consistent hashing utilized for cache/shard routing?
- [ ] Are CAP theorem consistency/availability trade-offs explicitly justified?
- [ ] Is load shedding and circuit breaking designed for peak traffic surges?

## Common Mistakes & Antipatterns
- Sharding a database by `created_date`, causing 100% of all current write traffic to hit the single shard representing 'today', leaving historical shards completely idle.
- Relying on cross-datacenter two-phase commit (2PC) transactions, causing network latency to choke entire system throughput.
- Designing a redundant 4-node API cluster that all connects to a single un-replicated MySQL database running on a single VM.

## Concrete Real-World Example
Scenario: A video sharing platform expects 100,000 video uploads per day and 100 million video views per day, exceeding the capacity of any single database node.
Prompt: Design a high-availability, horizontally partitioned system architecture for this video platform.
Application: The AI calculates throughput (1,200 read QPS baseline, 5,000 peak), shards user and video metadata using consistent hashing on `video_id`, places a Redis cluster in front of metadata shards, offloads video streaming to CloudFront CDN, and routes uploads through an asynchronous S3/SQS worker pipeline.
