---
name: "idempotent-script-automation"
description: "Writing robust, idempotent Python automation scripts utilizing argparse CLI interfaces, file locks, atomic write operations, and graceful retry handlers."
category: "automation"
subcategory: "python"
language: "python"
framework: "none"
technology: "python-automation"
difficulty: "intermediate"
tags: ["automation", "python", "idempotency", "atomic-writes", "cli", "batch-processing"]
---

# Idempotent Python Script Automation and Batch Processing

## Purpose
Instruct AI agents to author production-grade Python automation scripts that can be safely re-run repeatedly without creating duplicate data or corrupting state.

## When to Use
Use when writing cron jobs, data migration scripts, filesystem cleanup utilities, bulk API synchronizers, or batch ETL jobs.

## Inputs / Context
Input data sources, target destinations, batch sizes, retry parameters, and logging requirements.

## Instructions
1. Enforce Idempotency Across All Actions:
   - Check Before Action: Verify whether an operation has already been performed before executing (e.g., check if a record or file already exists with identical hash).
   - Running the script 5 times consecutively must produce the exact same system state as running it once.
2. Atomic File Writes:
   - Never write directly to a destination file in place: a crash mid-write leaves a corrupted, half-written file.
   - Write to a temporary file in the same directory (`tempfile.NamedTemporaryFile(dir=..., delete=False)`), flush and sync to disk (`os.fsync`), and perform an atomic rename (`os.replace`) to the final destination.
3. Prevent Concurrent Overlap with File Locks:
   - Use `fcntl.flock` (Linux/macOS) or a lockfile mechanism to prevent multiple instances of the script from executing simultaneously if a previous run is still in progress.
4. Build Professional CLI Interfaces with `argparse`:
   - Support `--dry-run` to simulate actions and log planned changes without executing mutations.
   - Support `--verbose` / `--quiet` logging flags and configurable batch sizes (`--batch-size 100`).
5. Process in Bounded Batches with Checkpointing:
   - Process large collections in chunks; persist a progress state file or database watermark so the script can resume from the last successful item after an interruption.
6. Structured Logging and Exit Codes:
   - Use Python's `logging` module with timestamps and log levels (avoid raw `print`).
   - Return standard exit codes: `0` for success, non-zero for specific error conditions.

## Constraints / Rules
- Never write non-atomic file modifications in batch scripts.
- Never write scripts without a `--dry-run` flag for destructive mutations.
- Do not let batch scripts run indefinitely without progress checkpointing.

## Workflow
1. Parse CLI arguments including `--dry-run` and `--batch-size`.
2. Acquire process file lock to prevent overlapping runs.
3. Read watermark checkpoint from previous run.
4. Process items in batches with atomic updates and error handling.
5. Save updated watermark checkpoint and release lock on exit.

## Expected Output
Production Python automation script featuring CLI argument parsing, process locking, atomic file operations, dry-run simulation, and checkpoint resumption.

## Validation Checklist
- [ ] Is the script idempotent (safe to run repeatedly)?
- [ ] Is `--dry-run` implemented for safe previewing?
- [ ] Are file writes atomic via temp files and `os.replace`?
- [ ] Is process concurrency prevented using file locks?
- [ ] Are errors logged with structured formatting and standard exit codes?

## Common Mistakes & Antipatterns
- Overwriting a 500MB production database dump in-place; the server runs out of disk space halfway through, destroying both the old and new files.
- Running a cron job every 5 minutes that takes 8 minutes to run, spawning dozens of overlapping processes that exhaust server RAM.
- Using `print()` statements instead of configurable `logging`, making it impossible to redirect logs to syslog or parse in Datadog.

## Concrete Real-World Example
Scenario: A daily customer sync script creates duplicate records in Salesforce whenever the network times out and the script is re-run manually.
Prompt: Make this customer sync automation script idempotent and resilient to partial failures.
Application: The AI adds an `external_id` lookup before upserting records, stores a local `sync_checkpoint.json` watermark, acquires an exclusive `fcntl.flock` lock, implements a `--dry-run` flag, and uses exponential backoff retries, making re-runs 100% safe and duplicate-free.
