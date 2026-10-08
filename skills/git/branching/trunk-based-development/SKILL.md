---
name: "trunk-based-development"
description: "Implementing Trunk-Based Development (TBD), short-lived feature branches, feature flags, and continuous integration to eliminate merge debt and drift."
category: "git"
subcategory: "branching"
language: "agnostic"
framework: "none"
technology: "git-workflow"
difficulty: "intermediate"
tags: ["git", "trunk-based-development", "branching", "feature-flags", "ci-cd", "merge-debt"]
---

# Trunk-Based Development and Short-Lived Feature Branches

## Purpose
Provide AI agents with standards for executing Trunk-Based Development, deprecating long-lived feature branches (Gitflow), and integrating code continuously to eliminate merge conflicts.

## When to Use
Use when establishing team Git workflows, transitioning away from painful multi-month Gitflow branch merges, or accelerating delivery speed.

## Inputs / Context
Feature scope, development velocity, feature flagging system, and release cadence.

## Instructions
1. Core Tenet of Trunk-Based Development (TBD):
   - All developers commit to a single shared branch ('trunk', usually `main`) frequently (at least daily).
   - Feature branches must be Short-Lived: lifetime should be under 1-2 days (maximum 3 days).
2. Decouple Deployment from Release using Feature Flags:
   - Merge incomplete or in-progress features into the trunk behind Feature Flags (toggles).
   - Code is continuously deployed to production dark (inactive), verified with internal users, and enabled for customers dynamically without code deployments.
3. Eliminate Gitflow Bottlenecks:
   - Deprecate long-lived branches (`develop`, `feature-xyz` lasting 3 weeks, `release-1.2`).
   - Long-lived branches accumulate 'merge debt': the longer a branch diverges from `main`, the higher the risk of catastrophic merge conflicts and integration regressions.
4. Continuous Rebase against Trunk:
   - Developers should rebase their short-lived branch onto `origin/main` daily: `git fetch origin && git rebase origin/main`.
5. Fast Automated CI Gates:
   - Comprehensive automated test suite must run and pass in under 5-10 minutes on every pull request to maintain high trunk integration velocity.

## Constraints / Rules
- Never allow feature branches to live longer than a few days without merging to trunk.
- Avoid deploying unfinished user-facing features without feature flag gating.
- Do not maintain parallel persistent `develop` and `main` branches.

## Workflow
1. Pull latest trunk: `git checkout main && git pull`.
2. Create short-lived branch: `git checkout -b feat/task-slug`.
3. Wrap new code paths in feature flag check.
4. Push small PR (under 300 lines) within 24-48 hours.
5. Rebase onto latest `origin/main`.
6. Merge to trunk upon CI pass and delete branch.

## Expected Output
Trunk-based workflow specification and feature flag integration pattern supporting rapid continuous integration and zero merge debt.

## Validation Checklist
- [ ] Are feature branches merged into trunk within 1-2 days?
- [ ] Are incomplete features protected behind runtime feature flags?
- [ ] Is code rebased onto latest trunk before merge?
- [ ] Is CI execution time optimized to <= 10 minutes?
- [ ] Are merged feature branches deleted immediately?

## Common Mistakes & Antipatterns
- Keeping a feature branch open for 6 weeks, resulting in 400 conflicting files when attempting to merge back into `main`.
- Merging incomplete features directly into production without feature flags, exposing broken half-finished UI to customers.
- Using Gitflow in a modern continuous delivery environment, adding manual ceremony and delay without quality benefits.

## Concrete Real-World Example
Scenario: A software team struggles with 'merge hell' every two weeks where merging long-lived feature branches into `develop` takes 3 days and breaks existing features.
Prompt: Transition this engineering team from Gitflow to Trunk-Based Development with feature flags.
Application: The AI designs a migration plan eliminating the `develop` branch, institutes a 2-day maximum branch lifespan policy, implements a lightweight feature flag wrapper in application code, and configures automated branch deletion upon merge.
