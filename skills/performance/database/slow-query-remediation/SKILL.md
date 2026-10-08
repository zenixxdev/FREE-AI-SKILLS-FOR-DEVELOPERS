---
name: "slow-query-remediation"
description: "Systematic remediation of database slow queries, eliminating sequential scans, reducing lock wait times, optimizing pagination, and partitioning large tables."
category: "performance"
subcategory: "database"
language: "sql"
framework: "none"
technology: "database-tuning"
difficulty: "advanced"
tags: ["performance", "database", "slow-queries", "indexing", "keyset-pagination", "partitioning"]
---

# Database Slow Query Remediation and Lock Contention Reduction

## Purpose
Instruct AI agents to systematically diagnose, refactor, and index slow database queries, replace slow offset pagination, and reduce lock contention.

## When to Use
Use when database CPU reaches 100%, queries appear in the database slow query log, or table growth causes queries to slow down exponentially.

## Inputs / Context
Slow query log entry, execution duration, table schema, volume/row count, and existing indexes.

## Instructions
1. Triage Slow Query Logs:
   - Identify queries with high execution frequency and high total time (`pg_stat_statements` in Postgres or MySQL Slow Query Log).
   - Differentiate between a fast query executed 10,000 times (N+1 problem) and a single query taking 30 seconds.
2. Replace Offset Pagination with Keyset (Cursor) Pagination:
   - Avoid `OFFSET 100000 LIMIT 20`: the database must scan and discard 100,000 rows before returning 20 rows, leading to catastrophic degradation on deep pages.
   - Use Keyset Pagination: `WHERE (created_at, id) < (:last_created_at, :last_id) ORDER BY created_at DESC, id DESC LIMIT 20`. This performs an instant O(1) index seek regardless of page depth.
3. Optimize Subqueries and Joins:
   - Convert correlated subqueries to `JOIN` or window functions.
   - Ensure foreign key columns in `JOIN ... ON` conditions are indexed on both tables.
4. Eliminate Table-Scan Filter Predicates:
   - Remove wildcard-prefixed `LIKE '%term'` searches from relational queries; use Full-Text Search (PostgreSQL `tsvector` with GIN index) instead.
5. Partition Massive Tables (> 50 Million Rows):
   - Implement Table Partitioning (declarative partitioning by range or list, e.g., partitioning audit logs or transactions by month/year).
   - Ensure queries utilize Partition Pruning by filtering on the partition key.
6. Reduce Lock Contention:
   - Read uncommitted snapshots where appropriate or use `SKIP LOCKED` for queue/worker job retrieval (`SELECT ... FOR UPDATE SKIP LOCKED`).

## Constraints / Rules
- Never use deep `OFFSET` pagination on large tables in production.
- Do not perform leading wildcard searches (`LIKE '%keyword'`) on standard B-Tree indexes.
- Avoid large unbounded `UPDATE` or `DELETE` operations; batch updates into chunks of 1,000 rows.

## Workflow
1. Identify top offending queries using `pg_stat_statements`.
2. Run `EXPLAIN (ANALYZE, BUFFERS)` to locate sequential scans or sorting bottlenecks.
3. Replace offset pagination with keyset cursor pagination.
4. Add composite covering indexes matching filter and sort order.
5. Verify execution time reduction and absence of disk sort spills.

## Expected Output
Optimized SQL query, replacement of offset pagination with cursor pagination, and targeted index creation DDL.

## Validation Checklist
- [ ] Is deep offset pagination replaced with keyset cursor pagination?
- [ ] Are all foreign keys and join conditions indexed?
- [ ] Are leading wildcard `LIKE '%...'` searches replaced with full-text search?
- [ ] Does `EXPLAIN ANALYZE` confirm an index seek with zero sequential scans?
- [ ] Is query execution time reduced to within SLA (< 50ms)?

## Common Mistakes & Antipatterns
- Using `LIMIT 25 OFFSET 500000`, forcing the database engine to read half a million rows from disk just to throw them away.
- Running a bulk `DELETE FROM logs WHERE created_at < NOW() - INTERVAL '30 days'` on a 100-million row table in one go, locking the table and filling the transaction log.
- Missing indexes on foreign key columns, causing child table scans whenever parent records are modified.

## Concrete Real-World Example
Scenario: A customer transactions table with 15 million rows takes 14 seconds to load page 50 of transaction history using `OFFSET 1000`.
Prompt: Optimize this slow transaction pagination query.
Application: The AI replaces `OFFSET 1000 LIMIT 20` with keyset cursor pagination `WHERE (created_at, id) < (:last_date, :last_id) ORDER BY created_at DESC, id DESC LIMIT 20`, backed by a composite index `(created_at DESC, id DESC)`, dropping query execution time from 14 seconds to 3 milliseconds.
