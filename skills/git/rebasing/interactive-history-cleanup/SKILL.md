---
name: "interactive-history-cleanup"
description: "Mastering Git interactive rebase (git rebase -i), fixup and autosquash workflows, squashing commits, editing commit messages, and safely rewriting local branch history."
category: "git"
subcategory: "rebasing"
language: "bash"
framework: "none"
technology: "git"
difficulty: "advanced"
tags: ["git", "rebase", "interactive-rebase", "autosquash", "history-rewriting", "fixup"]
---

# Git Interactive Rebasing, History Rewriting, and Autosquash

## Purpose
Instruct AI agents to use interactive rebase to clean up messy local development histories, reorder commits, squash related changes, and prepare pristine commits for code review.

## When to Use
Use before opening a pull request, splitting a monolithic commit into logical units, reordering commits, or amending historical commit messages on private branches.

## Inputs / Context
Current branch, base branch or commit hash (`HEAD~N`, `main`), and desired commit reorganization.

## Instructions
1. Execute Interactive Rebase:
   - Launch interactive rebase: `git rebase -i origin/main` or `git rebase -i HEAD~N`.
   - Command directives:
     * `pick` (p): Keep commit as-is.
     * `reword` (r): Keep commit content, but edit commit message.
     * `edit` (e): Stop at this commit to amend files or split into multiple commits.
     * `squash` (s): Melt commit into previous commit, concatenating commit messages.
     * `fixup` (f): Melt commit into previous commit, completely discarding this commit's message.
     * `drop` (d): Completely delete the commit.
2. The Fixup and Autosquash Workflow:
   - While working on review feedback, create targeted fixup commits: `git commit --fixup <commit-hash>`.
   - Rebase with automatic squashing: `git rebase -i --autosquash origin/main`. Git automatically pairs and squashes each fixup commit into its corresponding parent commit without manual intervention.
3. Split a Commit into Multiple Commits:
   - Mark commit with `edit` in rebase todo list.
   - Reset changes while keeping files staged: `git reset HEAD~1`.
   - Selectively stage and commit atomic changes using `git add -p` and `git commit`.
   - Resume rebase: `git rebase --continue`.
4. Recover from Mistakes using `git reflog`:
   - If an interactive rebase goes wrong, never panic: every previous HEAD state is recorded in `git reflog`.
   - Restore exact pre-rebase state: `git reset --hard ORIG_HEAD` or `git reset --hard HEAD@{n}`.
5. Push Safely using `--force-with-lease`:
   - Never use blind `git push -f`; always use `git push --force-with-lease` to ensure you do not overwrite commits pushed by collaborators.

## Constraints / Rules
- Never rewrite history (rebase) on public, shared branches like `main`.
- Never use raw `git push --force`; always use `git push --force-with-lease`.
- Do not rebase without ensuring local uncommitted changes are stashed or committed first.

## Workflow
1. Ensure working tree is clean (`git status`).
2. Mark commits for fixup using `git commit --fixup <hash>`.
3. Run `git rebase -i --autosquash origin/main`.
4. Review and save the rebase instruction list.
5. Verify tests pass on cleaned history.
6. Push with `git push --force-with-lease`.

## Expected Output
Clean, logical sequence of atomic Git commits ready for peer review, with descriptive Conventional Commit messages.

## Validation Checklist
- [ ] Are fixup commits folded into parents using `--autosquash`?
- [ ] Are all commit messages descriptive and clear?
- [ ] Are pushes executed using `--force-with-lease`?
- [ ] Is public shared branch history preserved untouched?
- [ ] Does `git log --oneline` show a clean, logical progression?

## Common Mistakes & Antipatterns
- Rebasing commits that have already been pushed to `main` and pulled by other team members, causing widespread Git history corruption.
- Using `git push --force`, accidentally wiping out a colleague's commits that were pushed while you were rebasing.
- Panicking during a rebase conflict and deleting files manually instead of using `git rebase --abort`.

## Concrete Real-World Example
Scenario: A developer has 6 commits on their feature branch: 3 implement the feature, 2 fix typos, and 1 adjusts a test. They want to submit 2 clean, atomic commits for review.
Prompt: Guide an interactive rebase to squash typo and test fixes into the main feature commits.
Application: The AI configures `git rebase -i HEAD~6`, changes the action of the typo and test commits from `pick` to `fixup`, groups them under the primary feature commits, saves the plan, verifies tests pass, and pushes with `--force-with-lease`.
