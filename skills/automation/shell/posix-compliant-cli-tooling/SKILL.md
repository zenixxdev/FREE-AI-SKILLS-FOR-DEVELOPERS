---
name: "posix-compliant-cli-tooling"
description: "Authoring rock-solid, defensive Bash and POSIX-compliant shell scripts with set -euo pipefail, safe variable expansion, trap cleanup, and portable utilities."
category: "automation"
subcategory: "shell"
language: "bash"
framework: "none"
technology: "bash-posix"
difficulty: "intermediate"
tags: ["automation", "shell", "bash", "posix", "defensive-scripting", "trap", "devops"]
---

# POSIX-Compliant Shell Scripting and Defensive Bash Architecture

## Purpose
Equip AI agents with the discipline required to author bulletproof, portable shell scripts that handle errors strictly, clean up resources on exit, and avoid common shell pitfalls.

## When to Use
Use when writing deployment scripts, CI runner steps, system maintenance scripts, backup hooks, or container entrypoints in Bash/sh.

## Inputs / Context
Automation goals, target OS environments (Linux, macOS, Alpine ash), arguments, and cleanup tasks.

## Instructions
1. Enforce Strict Defensive Mode at the Top of Every Script:
   - `set -euo pipefail`
   - `-e`: Exit immediately if any command exits with a non-zero status.
   - `-u`: Treat unset variables and parameters as an error and exit immediately.
   - `-o pipefail`: Return the exit status of the first command in a pipeline that failed (instead of masking failures with the last command).
2. Quote All Variable Expansions:
   - Always wrap variable expansions in double quotes: `"$my_var"`, `"$1"`, `"$file"`.
   - Unquoted expansions undergo word splitting and globbing, causing catastrophic bugs when paths contain spaces.
3. Guaranteed Resource Cleanup with `trap`:
   - Always use `trap cleanup EXIT INT TERM` to clean up temporary directories and locks.
   - Define a `cleanup()` function that deletes scratch files and terminates background child processes:
     `cleanup() { rm -rf "$TEMP_DIR"; }`
4. Safe Temporary Directory Creation:
   - Use `TEMP_DIR="$(mktemp -d)"` rather than hardcoding `/tmp/myscript`.
5. Self-Locating Script Directory:
   - Reliably determine the script's physical location regardless of current working directory:
     `SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"`
6. Verify Tool Dependencies Upfront:
   - Check required CLI tools exist before running:
     `command -v jq >/dev/null 2>&1 || { echo >&2 "Error: jq is required but not installed."; exit 1; }`
7. Portable Syntax vs Bashisms:
   - Use `#!/usr/bin/env bash` when utilizing Bash features (`[[`, arrays, `${var//search/replace}`).
   - If targeting pure POSIX `/bin/sh` (Alpine Linux), restrict syntax to standard `[` test brackets and avoid bash-only constructs.

## Constraints / Rules
- Never write production shell scripts without `set -euo pipefail`.
- Never use unquoted variable expansions (`rm -rf $DIR` can delete root `/` if `$DIR` is empty or unset).
- Do not use absolute paths for system binaries (`/usr/bin/grep`); rely on `PATH` resolution.

## Workflow
1. Declare shebang and strict mode flags (`set -euo pipefail`).
2. Identify script directory and create temp dir.
3. Attach `trap cleanup EXIT INT TERM` handler.
4. Verify required binary dependencies.
5. Parse arguments with `getopts` or `while` loop.
6. Execute business logic with quoted variables.

## Expected Output
Robust, defensive Bash script featuring strict error modes, trap cleanup, quoted variable safety, and dependency verification.

## Validation Checklist
- [ ] Is `set -euo pipefail` present at the top?
- [ ] Are all variable expansions wrapped in double quotes?
- [ ] Is temporary file cleanup guaranteed via `trap ... EXIT`?
- [ ] Are required CLI dependencies validated using `command -v`?
- [ ] Does shellcheck report zero warnings on the script?

## Common Mistakes & Antipatterns
- Writing `rm -rf "$TARGET_DIR/*"`, but `$TARGET_DIR` is unset, and because `-u` was not set, the shell executes `rm -rf /*`, destroying the operating system.
- Failing a command inside a pipe (`curl https://broken.url | tar -xz`), but the script continues blindly because `pipefail` was omitted.
- Failing to clean up temporary directories created in `/tmp`, eventually filling the host disk inode table.

## Concrete Real-World Example
Scenario: A database backup script fails silently in production because a `pg_dump` pipe command failed, creating an empty backup archive that went unnoticed.
Prompt: Author a bulletproof, defensive Bash script for creating and uploading compressed database backups.
Application: The AI structures the script with `set -euo pipefail`, binds `trap cleanup EXIT INT TERM` to delete temporary dump files, checks for `pg_dump` and `aws` CLI tools, quotes all paths, checks pipe exit statuses, and sends Slack alerts on failure.
