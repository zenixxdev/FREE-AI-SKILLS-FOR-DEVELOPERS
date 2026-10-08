---
name: "node-automation-scripts"
description: "Building command-line automation scripts in Node.js using Commander.js, execa for subprocess execution, Ora spinners, Chalk formatting, and signal handling."
category: "automation"
subcategory: "javascript"
language: "javascript"
framework: "none"
technology: "nodejs-cli"
difficulty: "intermediate"
tags: ["automation", "javascript", "nodejs", "cli", "commander", "subprocess", "tooling"]
---

# Node.js Automation Scripting, CLI Tooling, and Process Execution

## Purpose
Instruct AI agents to author polished, robust command-line automation scripts and developer tools in Node.js with interactive feedback and safe subprocess management.

## When to Use
Use when creating developer CLI tools, code generators, repository setup scripts, build hooks, or cross-platform automation utilities.

## Inputs / Context
CLI commands, options, subprocess execution requirements, user prompts, and terminal output specifications.

## Instructions
1. Structure CLI Applications with Commander.js:
   - Define clear commands, descriptions, arguments, and options with short/long flags (`-b, --branch <name>`).
   - Implement automatic `--help` generation and version flags (`-V, --version`).
2. Robust Subprocess Execution with `execa`:
   - Replace brittle `child_process.exec()` with `execa` or `child_process.spawn()` with arguments arrays (`['git', 'commit', '-m', message]`).
   - Never pass concatenated shell strings to prevent command injection vulnerabilities.
   - Stream subprocess output to stdout/stderr in real time for long-running commands.
3. Interactive Terminal UX:
   - Provide visual progress spinners (Ora) during asynchronous operations; stop and mark with green checks or red crosses upon completion.
   - Color-code terminal output with Chalk: blue for info, green for success, yellow for warnings, red for errors.
   - Support interactive prompts using `@inquirer/prompts` for missing required options.
4. Cross-Platform Path Handling:
   - Always use `path.join()` or `path.resolve()`; never concatenate path strings with `/` or `\`, ensuring full compatibility across Windows, macOS, and Linux.
5. Graceful Interruption Handling:
   - Trap `SIGINT` (Ctrl+C) and `SIGTERM`: restore terminal cursor visibility, terminate spawned child processes, clean up scratch files, and exit with code 130.

## Constraints / Rules
- Never use `child_process.exec(commandString)` with untrusted parameters.
- Never hardcode POSIX-only path separators (`/`) in filesystem operations.
- Avoid leaving terminal cursors hidden if an uncaught exception occurs during a spinner animation.

## Workflow
1. Define CLI program and commands using Commander.
2. Add argument validation and interactive prompt fallbacks.
3. Execute external tools via safe subprocess execution.
4. Render progress feedback with spinners and color-coded status.
5. Attach cleanup hooks for SIGINT and uncaught errors.

## Expected Output
Production Node.js CLI script featuring robust command parsing, safe subprocess execution, cross-platform path safety, and polished terminal feedback.

## Validation Checklist
- [ ] Are commands parsed using Commander with help documentation?
- [ ] Are subprocesses spawned with argument arrays (no shell injection)?
- [ ] Are paths cross-platform using `path.join`?
- [ ] Are SIGINT signals handled cleanly to restore the terminal?
- [ ] Does the script return standard exit codes (0 for success)?

## Common Mistakes & Antipatterns
- Concatenating user input into shell commands: `exec('git checkout ' + branch)`, allowing command injection if branch contains `; rm -rf /`.
- Using `console.log('\033[31mError\033[0m')` directly instead of a cross-platform styling library, producing unreadable escape characters on Windows terminals.
- Leaving a spinner spinning forever when an async function rejects an unhandled error.

## Concrete Real-World Example
Scenario: An internal developer scaffolding tool frequently breaks on Windows developer laptops due to path separator bugs and hangs when child git commands fail.
Prompt: Refactor this project scaffolding script in Node.js to be cross-platform, safe, and interactive.
Application: The AI builds a CLI using Commander, replaces shell strings with `execa`, uses `path.resolve` for cross-platform file paths, wraps steps in Ora spinners with Chalk formatting, and traps `SIGINT` to clean up incomplete folders.
