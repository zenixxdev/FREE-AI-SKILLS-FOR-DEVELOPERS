---
name: "pr-review-and-squash-merge-standards"
description: "Establishing pull request submission standards, comprehensive PULL_REQUEST_TEMPLATE.md, atomic PR sizing, Conventional Commit squashing, and review etiquette."
category: "github"
subcategory: "pull-requests"
language: "markdown"
framework: "github"
technology: "pull-requests"
difficulty: "intermediate"
tags: ["github", "pull-requests", "code-review", "conventional-commits", "squash-merge"]
---

# Pull Request Architecture, Review Standards, and Squash Merge Hygiene

## Purpose
Provide AI agents with standards for creating reviewable, atomic pull requests, establishing structured PR templates, and maintaining a clean, descriptive Git history via Conventional Commit squash merges.

## When to Use
Use when opening pull requests, reviewing code contributions, designing team PR guidelines, or standardizing Git commit histories.

## Inputs / Context
Feature changes, branch diffs, related issue tickets, testing evidence, and review checklist.

## Instructions
1. Atomic Pull Request Sizing:
   - Keep pull requests small and focused: ideal PR size is under 250-400 lines of changed code. Large PRs (> 800 lines) receive superficial reviews and harbor hidden bugs.
   - Separate architectural refactorings into independent PRs distinct from feature or bug-fix PRs.
2. Author Comprehensive `PULL_REQUEST_TEMPLATE.md`:
   - Description & Motivation: What does this PR do and why?
   - Issue Linkage: Explicitly link issues to auto-close on merge (`Closes #123`, `Fixes #456`).
   - Type of Change: Bug fix, new feature, breaking change, documentation.
   - Testing Evidence: Detailed steps to test manually, plus automated test additions. Include screenshots/GIFs for UI changes.
   - Verification Checklist: Tests pass, documentation updated, no secrets committed.
3. Conventional Commit Squash-and-Merge Hygiene:
   - Enforce Squash Merging on repository settings to condense messy 'wip', 'typo', and 'fix review' commits into a single atomic commit on `main`.
   - Format the final squash commit title following Conventional Commits:
     `<type>(<scope>): <concise description> (#PR)`
     (e.g., `feat(auth): implement passkey registration and login (#142)`).
   - In the commit body, include a concise bullet list of what changed and reference closing issues.
4. Constructive Code Review Etiquette:
   - Prefix review comments with intent tags: `[blocking]`, `[suggestion]`, `[question]`, `[nitpick]`.
   - Explain the 'why' behind feedback, referencing authoritative documentation or design principles.

## Constraints / Rules
- Never merge PRs with unresolved blocking review comments.
- Avoid mixing formatting/linting sweeps with functional business logic changes in the same PR.
- Never use vague squash commit messages like 'Update file.js' or 'Merge pull request #5'.

## Workflow
1. Create feature branch named `feature/issue-slug` or `fix/issue-slug`.
2. Author changes and ensure tests pass locally.
3. Open PR populated via `PULL_REQUEST_TEMPLATE.md`.
4. Address reviewer comments with additional commits on the branch.
5. Squash and merge using Conventional Commit message format.

## Expected Output
Production `.github/PULL_REQUEST_TEMPLATE.md` file along with guidelines for atomic PR sizing and Conventional Commit squash formatting.

## Validation Checklist
- [ ] Is PR linked to target issues using `Closes #...`?
- [ ] Are manual and automated testing instructions documented?
- [ ] Are UI changes accompanied by visual screenshots/videos?
- [ ] Is the PR sized under 400 lines of functional change?
- [ ] Is the final squash commit formatted with Conventional Commits?

## Common Mistakes & Antipatterns
- Submitting a 3,000-line PR that combines an entire database migration, three new pages, and a massive ESLint refactor, overwhelming reviewers.
- Merging with a default squash commit message that dumps 45 messy commit messages (`wip`, `fix`, `asdf`) into the git log on `main`.
- Leaving PR descriptions completely blank, forcing reviewers to guess the motivation behind the change.

## Concrete Real-World Example
Scenario: A software team's git history is polluted with hundreds of commits named 'fix typo', 'test 2', and 'oops', making `git bisect` impossible to use.
Prompt: Standardize the team's pull request process using a structured template and Conventional Commit squash merge rules.
Application: The AI crafts `.github/PULL_REQUEST_TEMPLATE.md` with structured sections for context, testing verification, and screenshots, and establishes repository squash guidelines requiring `type(scope): description` format, cleaning up the commit log.
