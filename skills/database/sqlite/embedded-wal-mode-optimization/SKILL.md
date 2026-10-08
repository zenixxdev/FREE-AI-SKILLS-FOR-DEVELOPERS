---
name: "embedded-wal-mode-optimization"
description: "Configuring high-concurrency embedded SQLite databases utilizing Write-Ahead Logging (WAL), memory-mapped I/O, optimal pragmas, and transaction batching."
category: "database"
subcategory: "sqlite"
language: "sql"
framework: "none"
technology: "sqlite"
difficulty: "intermediate"
tags: ["database", "sqlite", "embedded", "wal-mode", "pragmas", "performance", "concurrency"]
---

# SQLite Embedded Optimization, WAL Mode, and Pragmas

## Purpose
Provide concrete configuration standards and transaction patterns to unlock high concurrent read/write throughput in embedded SQLite instances.

## When to Use
Use when running SQLite in production (desktop apps, mobile apps, local developer tooling, edge services, single-node web services).

## Inputs / Context
SQLite database connection handler, concurrency requirements, durability needs, and memory budget.

## Instructions
1. Enable Write-Ahead Logging (WAL) mode immediately on opening the database: `PRAGMA journal_mode = WAL;`. This allows concurrent readers to operate without blocking writers, and writers to operate without blocking readers.
2. Configure optimal performance Pragmas on connection initialization:
   - `PRAGMA synchronous = NORMAL;`: Provides significant write speedups while preserving database integrity across application crashes.
   - `PRAGMA busy_timeout = 5000;`: Configures SQLite to wait up to 5,000ms when encountering a database lock before throwing `SQLITE_BUSY`.
   - `PRAGMA cache_size = -64000;`: Allocates 64MB of page cache in RAM (negative number specifies kibibytes).
   - `PRAGMA foreign_keys = ON;`: Enforces foreign key constraint verification (disabled by default in SQLite).
   - `PRAGMA temp_store = MEMORY;`: Stores temporary tables and indices in RAM instead of disk.
   - `PRAGMA mmap_size = 30000000000;`: Enables memory-mapped I/O for direct kernel memory access.
3. Batch write operations into explicit transactions: wrapping 1,000 individual `INSERT` statements in a single `BEGIN TRANSACTION ... COMMIT` improves write performance by 100x-1000x.
4. Use prepared statements for all recurring queries to eliminate query parsing overhead and guarantee SQL injection immunity.
5. In multi-threaded environments, configure a single shared connection for writes and a pool of read-only connections, or use a serialized connection pool.

## Constraints / Rules
- Never write single-row inserts in a loop without wrapping them in an explicit transaction.
- Do not use SQLite over network-attached storage (NFS/SMB) in WAL mode, as POSIX file locking is unreliable over network filesystems.
- Avoid running long-running read transactions in WAL mode, as this prevents WAL log truncation and causes the `-wal` file to grow uncontrollably.

## Workflow
1. Open database connection.
2. Execute initialization PRAGMA statements (`journal_mode`, `synchronous`, `busy_timeout`, `foreign_keys`).
3. Wrap batch operations in `BEGIN IMMEDIATE TRANSACTION`.
4. Monitor database and `-wal` file sizes.
5. Run periodic `PRAGMA optimize;` before closing connections.

## Expected Output
SQLite connection initialization script and transaction wrappers maximizing concurrent read/write throughput.

## Validation Checklist
- [ ] Is `PRAGMA journal_mode = WAL;` enabled?
- [ ] Is `PRAGMA busy_timeout` set to at least 5000ms?
- [ ] Is `PRAGMA foreign_keys = ON;` explicitly configured?
- [ ] Are bulk inserts batched inside explicit transactions?
- [ ] Are prepared statements utilized for all parameter bindings?

## Common Mistakes & Antipatterns
- Leaving SQLite in default rollback journal mode (`journal_mode = DELETE`), causing writes to lock the entire database and block all reads.
- Executing 5,000 individual inserts in a loop without a transaction, forcing 5,000 separate disk sync operations that take minutes instead of milliseconds.
- Forgetting `PRAGMA foreign_keys = ON;`, allowing child records to be inserted with non-existent parent IDs.

## Concrete Real-World Example
Scenario: A desktop app using SQLite freezes for 10 seconds whenever it imports a 5,000-row CSV file, and crashes with `SQLITE_BUSY` when the user clicks anything during import.
Prompt: Optimize this SQLite database connection and import routine for high throughput and non-blocking reads.
Application: The AI configures `journal_mode = WAL`, sets `busy_timeout = 5000`, wraps the CSV parsing loop in a single `BEGIN TRANSACTION`, and uses prepared statements, cutting the import time from 10 seconds to 80ms while keeping the UI responsive.
