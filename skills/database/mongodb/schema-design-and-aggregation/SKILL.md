---
name: "schema-design-and-aggregation"
description: "Architecting scalable MongoDB document schemas using embedding vs. referencing patterns, bucket patterns, compound indexes, and multi-stage aggregation pipelines."
category: "database"
subcategory: "mongodb"
language: "javascript"
framework: "none"
technology: "mongodb"
difficulty: "intermediate"
tags: ["database", "mongodb", "aggregation-pipeline", "schema-design", "document-db", "indexes"]
---

# MongoDB Schema Design Patterns and Aggregation Pipelines

## Purpose
Instruct AI agents to design high-performance MongoDB data models that balance document size limits, avoid unbounded arrays, and optimize multi-stage aggregation pipelines.

## When to Use
Use when modeling document data in MongoDB, building analytics aggregations, designing event logs, or refactoring relational schemas into document models.

## Inputs / Context
Application access patterns (read vs. write ratio), query shapes, data cardinality (1:1, 1:N, 1:Many, 1:Million), and document growth rates.

## Instructions
1. Model data based on application query access patterns rather than theoretical entity normalization.
2. Embedding vs. Referencing:
   - Embed: When child entities are always read with the parent, updated together, and have bounded cardinality (e.g., 1 to a few dozen addresses).
   - Reference: When child entities are read independently, updated frequently, or have unbounded cardinality (e.g., 1 to thousands of log entries).
3. Prevent the Unbounded Array antipattern: never allow an embedded array to grow indefinitely within a document; MongoDB has a strict 16MB document size limit.
4. Use the Bucket Pattern for time-series and IoT event data: group events into documents representing hourly or daily buckets with summary fields.
5. Create Compound Indexes following the Equality, Sort, Range (ESR) rule: equality filters first, sort keys second, range filters last.
6. Build efficient Aggregation Pipelines:
   - Place `$match` and `$project` stages as early as possible in the pipeline to filter and prune fields before memory-intensive `$group` or `$sort` stages.
   - Ensure the initial `$match` and `$sort` stages utilize existing indexes.
   - Use `$facet` for multi-faceted search and pagination in a single round-trip.
7. Use MongoDB schema validation rules (`$jsonSchema`) to enforce data consistency and required attributes at the collection level.

## Constraints / Rules
- Never design schemas that allow documents to exceed the 16MB BSON limit.
- Avoid using `$lookup` (joins) in high-frequency OLTP read paths; denormalize critical read data into the primary document instead.
- Do not place `$group` before `$match` in aggregation pipelines.

## Workflow
1. List the top 5 most frequent read and write queries.
2. Choose embedding or referencing based on cardinality and query co-occurrence.
3. Formulate compound indexes following the ESR rule.
4. Construct aggregation pipeline with early filter stages.
5. Verify with `explain("executionStats")` to ensure `nReturned == totalDocsExamined`.

## Expected Output
MongoDB schema definitions, JSON schema validation rules, compound index specifications, and optimized aggregation pipelines.

## Validation Checklist
- [ ] Are embedded arrays strictly bounded in size?
- [ ] Do compound indexes follow the Equality, Sort, Range (ESR) rule?
- [ ] Are `$match` stages placed at the very beginning of aggregation pipelines?
- [ ] Are large collections protected with `$jsonSchema` validation?
- [ ] Does `explain()` verify that the pipeline utilizes an index without in-memory sorting spills?

## Common Mistakes & Antipatterns
- Modeling a social network by embedding all user followers into a single document's `followers: []` array, causing documents to blow past the 16MB limit.
- Writing aggregation pipelines that `$lookup` three different collections on every user page load, treating MongoDB like a slow relational database.
- Building compound indexes in arbitrary order, failing to support combined filter and sort operations.

## Concrete Real-World Example
Scenario: An activity feed aggregation in MongoDB takes 4 seconds to execute because it filters and sorts over an unindexed collection of 2 million activities.
Prompt: Optimize this MongoDB activity feed aggregation pipeline and add required indexes.
Application: The AI creates a compound index on `{ userId: 1, createdAt: -1 }`, moves `$match: { userId: ... }` to stage 1, immediately follows with `$sort: { createdAt: -1 }`, limits to 20 records before applying `$lookup` for author profiles, reducing latency to 12ms.
