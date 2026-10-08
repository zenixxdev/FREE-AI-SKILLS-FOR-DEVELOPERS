---
name: "pipeline-caching-and-failfast"
description: "Designing high-speed, cost-effective CI/CD pipelines utilizing granular cache keys, parallel job matrixes, fail-fast order, and artifact management."
category: "devops"
subcategory: "ci-cd"
language: "yaml"
framework: "none"
technology: "ci-cd"
difficulty: "intermediate"
tags: ["devops", "ci-cd", "caching", "fail-fast", "automation", "testing"]
---

# CI/CD Pipeline Optimization, Caching, and Fail-Fast Strategies

## Purpose
Guide AI in designing high-efficiency continuous integration and deployment pipelines that cut build times by 70%, eliminate redundant job runs, and fail fast on early defects.

## When to Use
Use when designing CI pipelines (GitHub Actions, GitLab CI, CircleCI), speeding up slow test suites, or reducing CI runner compute costs.

## Inputs / Context
Project build tools, test suites, deployment stages, dependency lockfiles, and target environments.

## Instructions
1. Order Jobs by Speed and Failure Likelihood (Fail-Fast Hierarchy):
   - Step 1: Linters, Static Type Checks, and Format Verification (< 1 minute).
   - Step 2: Fast Unit Tests (< 2 minutes).
   - Step 3: Integration Tests and Security Scans (< 5 minutes).
   - Step 4: Heavy E2E Browser Tests and Docker Builds.
   - Fail early: Stop pipeline execution immediately upon the first failure to conserve runner minutes.
2. Implement Deterministic Dependency Caching:
   - Cache dependencies based on cryptographic lockfile hashes: `key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}`.
   - Use fallback restore-keys: `${{ runner.os }}-node-` to allow partial cache hits when lockfiles change.
3. Parallelize Workloads using Build Matrices:
   - Split large test suites into parallel shards (e.g., matrix of 4 shards running `vitest --shard=1/4`, `2/4`, etc.).
   - Test across multiple OS or language runtime versions concurrently.
4. Build Once, Deploy Everywhere:
   - Compile code and build container images exactly once in the build stage.
   - Save build artifacts or push image with immutable commit SHA tag; deploy the identical artifact across Staging and Production.
5. Concurrency Control and Cancellation:
   - Cancel outdated in-flight builds when new commits are pushed to the same pull request branch (`concurrency: { group: ..., cancel-in-progress: true }`).

## Constraints / Rules
- Never rebuild application source code separately in staging and production deployment steps.
- Avoid caching build directories without checking lockfile hashes.
- Do not run slow E2E tests before verifying basic syntax and unit test correctness.

## Workflow
1. Define pipeline trigger filters (branch paths, PR events).
2. Configure concurrency cancellation for PRs.
3. Set up dependency cache with lockfile hashing.
4. Execute lint and unit test stages in parallel.
5. Build and archive production artifacts.
6. Execute integration and deployment stages conditionally.

## Expected Output
High-efficiency CI/CD pipeline definition with deterministic dependency caching, fail-fast staging, and parallelized test matrices.

## Validation Checklist
- [ ] Are jobs sequenced from fastest to slowest?
- [ ] Is dependency caching keyed to lockfile hash?
- [ ] Are redundant pending builds cancelled automatically on new pushes?
- [ ] Is application code built once and promoted across environments?
- [ ] Is the pipeline execution time under 5-10 minutes?

## Common Mistakes & Antipatterns
- Downloading all dependencies from the internet from scratch on every commit without caching, wasting 5 minutes per build.
- Running full 20-minute E2E tests on a commit that failed the basic TypeScript linter in the first 10 seconds.
- Re-running CI on the master branch when only a `.md` documentation file was updated.

## Concrete Real-World Example
Scenario: A team's CI pipeline takes 25 minutes per pull request because it installs dependencies from scratch, runs sequential tests, and doesn't cancel superseded commits.
Prompt: Optimize this GitHub Actions CI pipeline for speed and cost efficiency.
Application: The AI adds `concurrency: { cancel-in-progress: true }`, keys npm caching to `package-lock.json`, parallelizes linting and unit tests, shards E2E tests across 3 matrix runners, cutting total CI run time from 25 minutes down to 4 minutes.
