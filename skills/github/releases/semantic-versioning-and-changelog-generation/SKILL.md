---
name: "semantic-versioning-and-changelog-generation"
description: "Automating semantic version releases (MAJOR.MINOR.PATCH) using Conventional Commits, release-please or semantic-release, and generating Keep-a-Changelog notes."
category: "github"
subcategory: "releases"
language: "yaml"
framework: "github-actions"
technology: "semantic-versioning"
difficulty: "intermediate"
tags: ["github", "releases", "semver", "changelog", "release-please", "conventional-commits"]
---

# Semantic Versioning (SemVer) and Automated Release Changelogs

## Purpose
Provide AI agents with standards for automating software releases based on Semantic Versioning specifications, Conventional Commits, and automated changelog publishing.

## When to Use
Use when setting up automated package publishing (npm, PyPI, Crates.io), managing software releases, or automating CHANGELOG.md generation.

## Inputs / Context
Commit history, package manifest (`package.json`, `pyproject.toml`), target release branch, and GitHub API credentials.

## Instructions
1. Adhere Strictly to Semantic Versioning 2.0.0 (`MAJOR.MINOR.PATCH`):
   - `MAJOR` version: Incompatible API changes / breaking changes.
   - `MINOR` version: New functionality added in a backward-compatible manner.
   - `PATCH` version: Backward-compatible bug fixes.
2. Automate Version Bumping via Conventional Commits:
   - `fix:` bumps PATCH (e.g., 1.0.0 -> 1.0.1).
   - `feat:` bumps MINOR (e.g., 1.0.0 -> 1.1.0).
   - `feat!:`, `fix!:`, or commit body with `BREAKING CHANGE:` bumps MAJOR (e.g., 1.0.0 -> 2.0.0).
   - `chore:`, `docs:`, `style:`, `refactor:`, `test:` trigger NO release.
3. Automate Releases with Release Please or Semantic Release:
   - Use Google's `release-please-action` to automatically maintain a running Release Pull Request that updates version numbers in manifests and appends notes to `CHANGELOG.md`.
   - When the Release PR is merged, the action automatically tags the commit (`vX.Y.Z`), creates a GitHub Release, and triggers publishing workflows.
4. Follow Keep a Changelog Format in `CHANGELOG.md`:
   - Categorize entries into standard subheadings: `Added`, `Changed`, `Deprecated`, `Removed`, `Fixed`, `Security`.
   - Include comparison links at the bottom: `[1.1.0]: https://github.com/org/repo/compare/v1.0.0...v1.1.0`.
5. Publish Artifacts to Registries Post-Release:
   - Trigger npm, PyPI, or Docker image publishing strictly upon GitHub Release creation (`on: release: { types: [published] }`).

## Constraints / Rules
- Never manually edit version numbers or changelog files when automated release tooling is active.
- Never publish a breaking change under a MINOR or PATCH version bump.
- Avoid publishing releases from unverified or dirty local developer machines.

## Workflow
1. Enforce Conventional Commit messages on PR merges.
2. Run `release-please-action` on pushes to `main`.
3. Release PR is created/updated automatically with version bump and changelog.
4. Maintainer merges Release PR.
5. Action creates Git tag, GitHub Release, and dispatches package publish.

## Expected Output
Automated release workflow configuration (`release-please.yml`) and `CHANGELOG.md` template conforming to SemVer 2.0 and Keep a Changelog standards.

## Validation Checklist
- [ ] Does commit message syntax dictate SemVer version bumps?
- [ ] Is `CHANGELOG.md` updated automatically following Keep a Changelog?
- [ ] Are breaking changes signaled with `!` or `BREAKING CHANGE:`?
- [ ] Are releases triggered strictly from the protected default branch?
- [ ] Are comparison diff links included for every release tag?

## Common Mistakes & Antipatterns
- Introducing a breaking API change in a `feat:` commit without `!` or `BREAKING CHANGE:`, bumping only the MINOR version and breaking all downstream consumers.
- Manually editing `package.json` to change the version, causing merge conflicts with the automated release bot.
- Publishing packages directly from a developer's laptop rather than an audited, reproducible CI pipeline.

## Concrete Real-World Example
Scenario: A team spends 2 hours every release manually writing changelogs, bumping versions across 3 files, and tagging Git releases.
Prompt: Automate the entire semantic versioning and changelog publishing pipeline using Conventional Commits and Release Please.
Application: The AI configures `.github/workflows/release.yml` with `googleapis/release-please-action`, enforces Conventional Commits on PR squash merges, and connects the release hook to publish the package to npm automatically on tag creation.
