---
name: "secrets-scanning-and-matrix-builds"
description: "Constructing high-throughput GitHub Actions workflows with cross-platform matrix testing, fail-fast tuning, TruffleHog secret scanning, and artifact upload/download."
category: "github"
subcategory: "actions"
language: "yaml"
framework: "github-actions"
technology: "github-actions-ci"
difficulty: "intermediate"
tags: ["github", "github-actions", "matrix-builds", "secret-scanning", "trufflehog", "artifacts"]
---

# GitHub Actions Matrix Builds and Secret Scanning Automation

## Purpose
Instruct AI agents to configure GitHub Actions workflows that execute multi-platform test matrices and proactively scan git histories and pull requests for exposed secrets and tokens.

## When to Use
Use when building open-source libraries that must run across multiple operating systems and runtimes, or enforcing credential protection in CI.

## Inputs / Context
Target OS platforms (ubuntu, macos, windows), runtime versions (e.g., Node 18, 20, 22), test commands, and secret scanner configs.

## Instructions
1. Cross-Platform Matrix Build Strategies:
   - Configure multi-dimensional test matrices:
     `strategy: { matrix: { os: [ubuntu-latest, macos-latest, windows-latest], node-version: [18, 20, 22] } }`
   - Use `fail-fast: false` when you want all matrix jobs to complete so you can see every failing combination, or `fail-fast: true` to abort immediately on the first failure to save runner minutes.
   - Use `include` and `exclude` directives to add or omit specific matrix combinations (e.g., exclude Windows on Node 18).
2. Automate Secret Scanning with TruffleHog:
   - Add an automated secret scanning job to all PR and push events using TruffleHog OSS action.
   - Scan git commit history for verified high-entropy secrets (private keys, AWS keys, Stripe tokens):
     `uses: trufflesecurity/trufflehog@main with: { extra_args: "--only-verified" }`
   - Block PR merges if a verified secret is discovered.
3. Seamless Artifact Sharing Between Jobs:
   - Use `actions/upload-artifact@v4` in the build job to upload compiled binaries or frontend assets.
   - Use `actions/download-artifact@v4` in deployment or test jobs to download pre-built assets, eliminating redundant compilation steps.
4. Matrix Runner Concurrency and Resource Limits:
   - Be mindful of macOS runner costs (macOS runners cost 10x more than Linux runners); run full macOS matrices only on release branches or PRs modifying native mobile/desktop bindings.

## Constraints / Rules
- Never print secret values to the GitHub Actions workflow console log (`core.setSecret` must be used if dealing with dynamic credentials).
- Avoid running heavy multi-OS matrix builds on every minor doc commit.
- Do not use unpinned actions in security scanning jobs.

## Workflow
1. Define workflow triggered on `pull_request` and `push`.
2. Add secret scanning job with TruffleHog.
3. Configure build matrix testing across specified OS and runtime combinations.
4. Archive build artifacts.
5. Upload test coverage reports.

## Expected Output
Production GitHub Actions YAML workflow featuring multi-OS matrix testing, automated TruffleHog secret scanning, and artifact upload/download pipelines.

## Validation Checklist
- [ ] Is a multi-OS/runtime matrix configured?
- [ ] Is automated secret scanning active on all pull requests?
- [ ] Are compiled artifacts uploaded and shared between jobs without rebuilds?
- [ ] Are macOS runner minutes conserved prudently?
- [ ] Are secrets properly masked in logs?

## Common Mistakes & Antipatterns
- Running a 9-job matrix (3 OS x 3 Node versions) on every typo commit in a markdown file, exhausting the organization's monthly GitHub Actions free minutes in 3 days.
- Logging raw HTTP request headers in CI, exposing the `Authorization: Bearer <token>` in public workflow logs.
- Failing to verify that all matrix jobs passed before triggering deployment.

## Concrete Real-World Example
Scenario: An open-source TypeScript SDK needs to verify compatibility across Ubuntu, macOS, Windows on Node 18, 20, and 22, while ensuring no developer accidentally commits an API key.
Prompt: Author a GitHub Actions workflow with matrix testing and TruffleHog secret scanning.
Application: The AI creates a workflow with a `security-scan` job running TruffleHog with `--only-verified`, followed by a `test-matrix` job running across the 3x3 OS/Node matrix with dependency caching and artifact archiving.
