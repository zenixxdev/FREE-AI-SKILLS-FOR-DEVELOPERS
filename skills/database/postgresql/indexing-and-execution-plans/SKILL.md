---
name: "indexing-and-execution-plans"
description: "Designing optimal PostgreSQL index strategies (B-Tree, GIN, BRIN, Partial, Covering) and diagnosing execution bottlenecks using EXPLAIN (ANALYZE, BUFFERS)."
category: "database"
subcategory: "postgresql"
language: "sql"
framework: "none"
technology: "postgresql"
difficulty: "advanced"
tags: ["database", "postgresql", "indexing", "explain-analyze", "gin", "brin", "performance"]
---

# PostgreSQL Indexing Architecture and EXPLAIN Plan Analysis

## Purpose
Provide AI agents with deep PostgreSQL optimization capabilities to inspect query execution plans, diagnose buffer cache hits, and design targeted indexing strategies.

## When to Use
Use when optimizing slow PostgreSQL queries, indexing JSONB or full-text data, scaling append-only time-series tables, or resolving sequential scan bottlenecks.

## Inputs / Context
Query SQL, table schema, volume/cardinality metrics, and `EXPLAIN (ANALYZE, BUFFERS)` output.

## Instructions
1. Run and evaluate queries using `EXPLAIN (ANALYZE, BUFFERS, COSTS, TIMING)`.
2. Inspect buffer statistics: compare `Buffers: shared hit` (memory cache) vs `Buffers: shared read` (disk I/O) to identify memory pressure and disk thrashing.
3. Identify plan node bottlenecks: Seq Scan on large tables, nested loops with unexpected row counts, expensive Hash/Sort operations spilling to disk (`WorkMem` exceeded).
4. Select the correct PostgreSQL index type:
   - B-Tree: Standard equality, ranges (`<`, `<=`, `=`, `>=`, `>`), and `ORDER BY`.
   - GIN (Generalized Inverted Index): Fast lookup within JSONB arrays, full-text search (`tsvector`), and multi-attribute array tags.
   - BRIN (Block Range Index): Extremely small, high-performance index for massive append-only tables naturally sorted by physical order (e.g., timestamps, auto-incrementing IDs).
   - GiST: Geometric, geospatial (PostGIS), and range types (`daterange`).
5. Use Partial Indexes (`CREATE INDEX ... WHERE active = true`) to index only relevant rows, reducing index size and write overhead.
6. Use Covering Indexes with `INCLUDE (col1, col2)` to enable Index-Only Scans, satisfying queries entirely from the index without reading the table heap.
7. Always create indexes concurrently in production (`CREATE INDEX CONCURRENTLY`) to prevent locking writes on live tables.

## Constraints / Rules
- Never run `CREATE INDEX` without `CONCURRENTLY` on a production table experiencing live traffic.
- Avoid over-indexing: each index incurs write overhead on `INSERT`, `UPDATE`, and `DELETE`.
- Do not create single-column B-Tree indexes on every column; analyze multi-column query patterns.

## Workflow
1. Execute query with `EXPLAIN (ANALYZE, BUFFERS)`.
2. Locate the node with the highest actual time or disk buffer read count.
3. Formulate the index design (composite order: equality columns first, followed by range columns).
4. Add `INCLUDE` columns if index-only scan is beneficial.
5. Create index with `CONCURRENTLY` and re-run `EXPLAIN (ANALYZE, BUFFERS)` to verify plan shift from Seq Scan to Index/Bitmap Scan.

## Expected Output
Optimized SQL query, `CREATE INDEX CONCURRENTLY` DDL statements, and before/after EXPLAIN plan performance comparison.

## Validation Checklist
- [ ] Does `EXPLAIN ANALYZE` confirm an Index Scan or Bitmap Index Scan?
- [ ] Is disk spill avoided during sorting (`Sort Method: quicksort` within `work_mem`)?
- [ ] Are partial indexes used where filtering on a boolean or status enum?
- [ ] Is `CREATE INDEX CONCURRENTLY` specified for migration scripts?
- [ ] Are multi-column indexes ordered with equality columns preceding range columns?

## Common Mistakes & Antipatterns
- Indexing composite columns in the wrong order: placing a range column before an equality column in a composite index, preventing the index from narrowing subsequent fields.
- Creating a standard B-Tree index on a JSONB column containing arrays, which fails to index individual elements (requires a GIN index).
- Forgetting to run `ANALYZE` after large data loads, causing the query planner to choose suboptimal plans based on stale table statistics.

## Concrete Real-World Example
Scenario: A customer query searching orders by `status = 'pending'` and `created_at > NOW() - INTERVAL '7 days'` does a full sequential scan over 20 million rows taking 8 seconds.
Prompt: Design a targeted PostgreSQL index to make this order query execute in under 10ms.
Application: The AI reviews the table stats, observes that 'pending' orders represent only 1% of the table, and creates a partial covering index: `CREATE INDEX CONCURRENTLY idx_orders_pending ON orders (created_at DESC) INCLUDE (customer_id, total) WHERE status = 'pending';`, resulting in an instant Index-Only Scan taking 2ms.
