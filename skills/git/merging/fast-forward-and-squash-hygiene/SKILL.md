---
name: "fast-forward-and-squash-hygiene"
description: "Mastering Git merge strategies (Fast-Forward, Non-Fast-Forward, Squash, Rebase) and maintaining a pristine, bisectable linear commit history."
category: "git"
subcategory: "merging"
language: "bash"
framework: "none"
technology: "git"
difficulty: "intermediate"
tags: ["git", "merging", "fast-forward", "squash", "rebase", "git-history", "bisect"]
---

# Git Fast-Forward, Rebase, and Squash Merge Hygiene

## Purpose
Instruct AI agents to select and execute optimal Git merge strategies, eliminating redundant merge bubbles and preserving a clean linear history for `git bisect` debugging.

## When to Use
Use when merging branches, configuring repository merge options, cleaning up feature histories, or preparing release commits.

## Inputs / Context
Current branch, target branch, commit count, and repository merge policy.

## Instructions
1. Understand the Merge Strategies:
   - Fast-Forward (`git merge --ff-only`): If target branch has not diverged, simply advances the branch pointer forward. Leaves zero merge commits. Pristine linear history.
   - Non-Fast-Forward (`git merge --no-ff`): Always creates a merge commit, even if fast-forward was possible. Documents that a group of commits belonged together.
   - Squash Merge (`git merge --squash`): Condenses all commits from the source branch into a single new commit on the target branch. Best for feature PRs with noisy interim commits.
   - Rebase Merge (`git rebase` followed by `--ff-only`): Replays commits individually on top of target branch, preserving individual commits without merge nodes.
2. Select Strategy by Context:
   - For Pull Requests into `main`: Prefer Squash Merge with Conventional Commit titles to preserve a clean, bisectable linear history.
   - For Local Branch Synchronization: Always use `git pull --rebase` to avoid creating useless 'Merge branch main into feat' bubble commits.
3. Configure Safe Defaults in Git Config:
   - `git config --global pull.rebase true`: Guarantees local pulls never create merge commits.
   - `git config --global merge.ff only`: Prevents accidental non-fast-forward merges during local branch integrations.
4. Maintain `git bisect` Viability:
   - Every single commit on `main` must compile and pass automated tests; squash merging ensures `main` never contains intermediate broken commits that thwart automated binary bug hunting with `git bisect`.

## Constraints / Rules
- Never push local 'Merge branch main into my-branch' commits to shared remote branches.
- Never use squash merge if individual commits on the branch represent distinct, independent releases that need separate rollback capabilities.
- Avoid rebase merges if individual commits on the branch are broken or do not compile.

## Workflow
1. Fetch latest changes: `git fetch origin`.
2. Rebase local branch onto target: `git rebase origin/main`.
3. Verify test suite passes on the rebased state.
4. Execute fast-forward or squash merge into target branch.
5. Delete merged local and remote feature branches.

## Expected Output
Clean Git merge commands and configuration directives delivering a linear, bisectable Git commit log.

## Validation Checklist
- [ ] Is `pull.rebase true` configured to prevent accidental merge bubbles?
- [ ] Does `main` maintain a linear, easily readable commit log?
- [ ] Does every commit on `main` represent a working, testable state?
- [ ] Are messy WIP commits squashed before integrating into trunk?
- [ ] Can `git bisect` navigate history without encountering non-compiling commits?

## Common Mistakes & Antipatterns
- Running `git pull` without `--rebase`, creating hundreds of empty 'Merge branch main into ...' commits that clutter the commit graph.
- Merging a feature branch with 30 broken intermediate commits into `main`, making it impossible to use `git bisect` to locate when a regression was introduced.
- Force-pushing to a shared public branch that other developers are actively basing work upon.

## Concrete Real-World Example
Scenario: A developer's feature branch has 14 commits with messages like 'wip', 'fixed typo', 'test again', and two merge commits pulling `main`.
Prompt: Clean up this feature branch and integrate it into `main` with a clean linear history.
Application: The AI rebases the branch onto `origin/main` to drop the merge commits, squashes the 14 commits into a single atomic Conventional Commit `feat(search): implement fuzzy filtering on product list`, and fast-forward merges it into `main`.
