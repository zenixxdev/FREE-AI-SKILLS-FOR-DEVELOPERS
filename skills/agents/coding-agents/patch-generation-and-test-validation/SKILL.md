---
name: "patch-generation-and-test-validation"
description: "Engineering autonomous coding agent loops that inspect codebases, generate unified diff patches, execute test suites, and iteratively repair broken tests."
category: "agents"
subcategory: "coding-agents"
language: "python"
framework: "none"
technology: "coding-agents"
difficulty: "advanced"
tags: ["agents", "coding-agents", "git-patch", "unified-diff", "test-validation", "code-repair"]
---

# Autonomous Coding Agent Patch Generation and Test Validation

## Purpose
Provide AI agents with rigorous engineering protocols for discovering code contexts, generating standard Git unified diffs, running automated test suites, and validating patches.

## When to Use
Use when building AI software engineer agents (like SWE-bench style agents), automated bug-fix bots, or automated refactoring pipelines.

## Inputs / Context
Bug description / issue text, project repository directory, test command (`pytest`, `npm test`), and Git diff tools.

## Instructions
1. Context Discovery and Localization:
   - Search the codebase using keyword search, symbol references, and file trees to locate the minimal set of files responsible for the issue.
   - Do NOT load entire repositories into context; inspect only relevant files and functions.
2. Reproduce the Defect First:
   - Before modifying application source code, write a reproduction test case that reliably reproduces the reported bug.
   - Execute the test suite and confirm the reproduction test FAILS with the expected assertion error.
3. Generate Minimal Unified Diffs (Git Patches):
   - Instruct the agent to generate changes in standard Git Unified Diff format (`diff --git a/... b/...`) or targeted file replacements.
   - Apply edits conservatively: do not reformat unrelated lines or change code style conventions.
4. Execute Test Validation Loop:
   - Apply the patch to the working tree.
   - Run the automated test suite.
   - If the reproduction test passes AND all existing regression tests pass: the patch is verified.
   - If tests fail: capture the compiler/test error output, feed it back to the agent, and iteratively refine the patch (capped at 3 repair iterations).
5. Clean Up and Commit:
   - Ensure the patch leaves zero temporary debug files, print statements, or commented-out code.
   - Format a clean Git commit message following Conventional Commits (`fix(auth): ...`).

## Constraints / Rules
- Never declare a bug fixed without running the automated test suite.
- Never modify unrelated files or reformat the entire codebase in a bug-fix patch.
- Do not bypass failing tests by deleting or disabling existing assertions.

## Workflow
1. Analyze issue description and localize relevant source files.
2. Author and run a failing reproduction test.
3. Formulate minimal bug fix and apply patch to files.
4. Run full test suite to verify fix and absence of regressions.
5. If tests fail, feed error trace to agent for iteration.
6. Commit verified patch with clean commit message.

## Expected Output
Autonomous coding agent loop implementation capable of issue localization, patch generation, test execution, and iterative error repair.

## Validation Checklist
- [ ] Does the agent author a reproduction test before fixing the bug?
- [ ] Is the patch restricted to minimal necessary changes?
- [ ] Does the patch pass the full regression test suite?
- [ ] Are test failure outputs fed back into an iterative repair loop?
- [ ] Are temporary debug logs and files completely removed before commit?

## Common Mistakes & Antipatterns
- Modifying 15 unrelated files to fix a 1-line bug, introducing merge conflicts and unintended regressions.
- 'Fixing' a bug by modifying the test assertion to expect the broken behavior instead of fixing the application code.
- Failing to verify that the reproduction test actually failed before applying the patch.

## Concrete Real-World Example
Scenario: A Python pricing calculator has a rounding error bug reported in an issue ticket.
Prompt: Run an autonomous coding agent loop to locate, reproduce, fix, and verify this rounding defect.
Application: The AI searches for calculation functions, authors a failing test `test_proration_rounding` in `tests/test_pricing.py`, confirms it fails with `AssertionError: 99.99 != 100.00`, modifies the rounding logic in `pricing.py`, re-runs pytest, verifies all 42 tests pass, and outputs a clean Git unified diff.
