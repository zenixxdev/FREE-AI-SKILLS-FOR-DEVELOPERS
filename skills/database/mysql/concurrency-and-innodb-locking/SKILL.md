---
name: "concurrency-and-innodb-locking"
description: "Diagnosing and mitigating MySQL InnoDB row locks, gap locks, next-key locks, and deadlocks in high-concurrency transactional systems."
category: "database"
subcategory: "mysql"
language: "sql"
framework: "none"
technology: "mysql-innodb"
difficulty: "advanced"
tags: ["database", "mysql", "innodb", "locking", "deadlocks", "concurrency", "transactions"]
---

# MySQL InnoDB Concurrency, Locking, and Deadlock Mitigation

## Purpose
Provide concrete engineering procedures for designing MySQL transactions that minimize lock contention, prevent deadlocks, and operate reliably under high concurrent throughput.

## When to Use
Use when designing high-concurrency transactional write paths (inventory reservation, wallet balance transfers, booking engines) or debugging MySQL deadlocks.

## Inputs / Context
Table schemas with primary/foreign keys, transaction SQL statements, isolation levels, and `SHOW ENGINE INNODB STATUS` output.

## Instructions
1. Keep transaction execution times as short as possible: gather and validate all input data before opening a transaction; never execute external network calls inside a transaction.
2. Understand InnoDB locking mechanics:
   - Row Locks: Acquired on index records during `SELECT ... FOR UPDATE` or `UPDATE`.
   - Gap Locks: Acquired between index records to prevent phantom reads under `REPEATABLE READ`.
   - Next-Key Locks: A combination of a row lock and a gap lock on the gap preceding the record.
3. Access records in a deterministic order across all concurrent transactions (e.g., always lock row IDs in ascending order: `ORDER BY id ASC`) to eliminate circular wait conditions that cause deadlocks.
4. Ensure all `UPDATE` and `DELETE` statements utilize selective indexed columns in their `WHERE` clause; if an `UPDATE` does not match an index, InnoDB locks every row and gap in the entire table.
5. In high-concurrency read-heavy environments, consider switching transaction isolation from `REPEATABLE READ` to `READ COMMITTED` with row-based binary logging (`binlog_format=ROW`) to disable gap locks.
6. Inspect deadlocks using `SHOW ENGINE INNODB STATUS` and search for the `LATEST DETECTED DEADLOCK` section.
7. Implement application-level retry logic with jittered backoff for transactions failing with MySQL error 1213 (Deadlock found when trying to get lock).

## Constraints / Rules
- Never execute slow HTTP calls, email sending, or heavy file generation inside an active database transaction.
- Avoid updating large unindexed ranges within transactions.
- Never set `autocommit=0` globally; manage transactions explicitly using `START TRANSACTION` and `COMMIT`.

## Workflow
1. Extract deadlock traces from `SHOW ENGINE INNODB STATUS`.
2. Identify the competing transactions and the specific locks held and requested.
3. Order resource acquisition sequences across all application code paths.
4. Optimize index coverage on the locking queries.
5. Add automatic transaction retry wrappers in application code.

## Expected Output
Deadlock-free SQL transaction sequences, targeted indexing DDL, and application retry wrapper code.

## Validation Checklist
- [ ] Are multiple resources locked in consistent, deterministic order across all transactions?
- [ ] Are all `UPDATE` and `SELECT FOR UPDATE` queries backed by indexes?
- [ ] Are external network calls strictly excluded from active transactions?
- [ ] Are transactions kept minimal in duration?
- [ ] Is error 1213 handled with automated retry logic in the application layer?

## Common Mistakes & Antipatterns
- Updating rows without an index, causing InnoDB to lock the entire table and blocking all other concurrent writes.
- Two transactions locking rows in reverse order (Tx1 locks A then B; Tx2 locks B then A), causing an immediate deadlock.
- Performing long-running batch data migrations inside a single massive transaction instead of chunking into small batches of 1,000 rows.

## Concrete Real-World Example
Scenario: An inventory checkout endpoint deadlocks frequently when two customers attempt to purchase the same set of items at the same moment.
Prompt: Fix the deadlocks occurring during multi-item inventory reservations in MySQL InnoDB.
Application: The AI sorts the inventory item IDs in ascending numerical order in application memory before issuing `SELECT ... FOR UPDATE WHERE id IN (?) ORDER BY id ASC`, guaranteeing that all concurrent transactions acquire locks in identical sequence and eliminating circular wait deadlocks.
