---
name: "declarative-query-optimization"
description: "Optimizing relational SQL queries by replacing procedural loops with set-based operations, leveraging window functions, Common Table Expressions (CTEs), and eliminating Cartesian products."
category: "database"
subcategory: "sql"
language: "sql"
framework: "none"
technology: "ansi-sql"
difficulty: "intermediate"
tags: ["database", "sql", "query-optimization", "window-functions", "cte", "set-based"]
---

# Declarative SQL Query Optimization and Set-Based Logic

## Purpose
Direct AI models to write performant, declarative SQL queries that utilize the database engine's set-based relational optimizer rather than procedural row-by-row logic.

## When to Use
Use when writing complex database reports, analytic queries, batch updates, or optimizing slow-running queries.

## Inputs / Context
Database schema, table cardinality, query requirements, and existing execution performance.

## Instructions
1. Think in sets, not rows: eliminate procedural cursors, `WHILE` loops, and repeated single-row queries in favor of declarative set-based queries (`JOIN`, `UNION ALL`, `CASE WHEN`).
2. Utilize Window Functions (`ROW_NUMBER()`, `RANK()`, `LEAD()`, `LAG()`, `SUM(...) OVER (...)`) for ranking and running totals instead of self-joins or correlated subqueries.
3. Structure complex multi-step queries using readable Common Table Expressions (`WITH cte AS (...)`) rather than deeply nested derived tables.
4. Select only needed columns explicitly (`SELECT id, name, created_at`); avoid `SELECT *` which wastes network I/O, prevents index-only scans, and breaks caching.
5. Avoid non-sargable expressions in `WHERE` clauses (e.g., `WHERE YEAR(created_at) = 2024` prevents index usage; use `WHERE created_at >= '2024-01-01' AND created_at < '2025-01-01'` instead).
6. Replace `UNION` with `UNION ALL` when duplicate elimination is not strictly required, avoiding expensive sorting operations.
7. Use `EXISTS` instead of `IN` when testing for presence against subqueries with large result sets.

## Constraints / Rules
- Never use `SELECT *` in production application code.
- Avoid using correlated subqueries in the `SELECT` projection list for large record sets.
- Do not apply functions or string manipulation to indexed columns in `WHERE` or `ON` clauses.

## Workflow
1. Formulate query using declarative joins and filter predicates.
2. Replace correlated subqueries with window functions or CTEs.
3. Ensure all filter predicates are sargable (index-seek compatible).
4. Restrict projection to required columns.
5. Analyze query execution plan (`EXPLAIN ANALYZE`).

## Expected Output
High-performance ANSI-SQL query utilizing set-based operations, window functions, and sargable predicates.

## Validation Checklist
- [ ] Are all filter predicates in `WHERE` clauses sargable?
- [ ] Is `SELECT *` eliminated in favor of explicit column lists?
- [ ] Are window functions used instead of expensive self-joins?
- [ ] Is `UNION ALL` preferred over `UNION` where duplicates are impossible or acceptable?
- [ ] Does `EXPLAIN` confirm the absence of full table scans on large tables?

## Common Mistakes & Antipatterns
- Wrapping indexed date columns in functions like `WHERE DATE(order_date) = '2024-05-01'`, forcing the engine to scan every single row in the table.
- Using `SELECT *` across joined tables with dozens of unused columns, exhausting network bandwidth and database memory.
- Using procedural cursors to iterate over rows and perform updates one by one instead of a single set-based `UPDATE ... FROM`.

## Concrete Real-World Example
Scenario: An analytics query calculates each user's latest transaction using a correlated subquery that scans a 10-million row table for every single customer.
Prompt: Optimize this customer latest transaction query to run in under 200ms.
Application: The AI rewrites the query using `ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date DESC)` inside a CTE, filtering for `WHERE rn = 1`, reducing query execution time from 45 seconds to 120 milliseconds.
