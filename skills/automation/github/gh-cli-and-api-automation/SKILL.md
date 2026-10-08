---
name: "gh-cli-and-api-automation"
description: "Automating GitHub administration, issue triaging, release generation, and PR workflows using the official GitHub CLI (gh) and GraphQL API."
category: "automation"
subcategory: "github"
language: "bash"
framework: "github-cli"
technology: "github-api"
difficulty: "intermediate"
tags: ["automation", "github", "gh-cli", "graphql", "api", "release-automation", "devops"]
---

# GitHub CLI (gh) Automation, REST/GraphQL API Scripting

## Purpose
Instruct AI agents to script and automate complex GitHub repository management tasks, PR reviews, release publishing, and label synchronization using the `gh` CLI.

## When to Use
Use when automating GitHub workflows, orchestrating release cutovers, batch updating repository settings, or migrating issues across repositories.

## Inputs / Context
Repository target (`owner/repo`), GitHub authentication token, release notes/tags, and API payload specifications.

## Instructions
1. Leverage Official GitHub CLI (`gh`):
   - Use `gh` CLI commands rather than writing raw `curl` calls with manual Authorization headers; `gh` handles authentication, paging, and error formatting automatically.
2. Query Data Efficiently with JSON and jq Integration:
   - Use `--json` flag to specify exact fields needed: `gh pr list --json number,title,author,headRefName`.
   - Use `--jq` flag to filter and format JSON output directly on the CLI without external pipes:
     `gh issue list --label "bug" --json number --jq '.[].number'`
3. Execute Complex Queries via GraphQL:
   - Use `gh api graphql` for bulk operations, nested issue project card queries, or operations not exposed via standard REST commands.
   - Use `-F` flags to pass parameterized variables safely into GraphQL query strings.
4. Automate Release Creation with Artifacts and Generated Notes:
   - Use `gh release create <tag> [files...] --generate-notes --title "Release vX.Y.Z"` to automatically generate changelogs from merged PRs and attach compiled binaries in a single step.
5. Batch Process Across Repositories:
   - Iterate through repository lists using `gh repo list <org> --json nameWithOwner --jq '.[].nameWithOwner'`.
   - Apply changes idempotently (e.g., verifying a label exists before attempting creation to avoid conflict errors).
6. Non-Interactive CI Mode:
   - Set `export GH_NO_PROMPT=1` or pass explicit confirmation flags (`--yes`, `--confirm`) to prevent scripts from hanging waiting for interactive user terminal prompts in automated CI environments.

## Constraints / Rules
- Never write scripts that hang awaiting interactive input in CI (`GH_NO_PROMPT=1` is mandatory).
- Avoid parsing human-readable table outputs; always request structured output via `--json`.
- Do not expose `GITHUB_TOKEN` values in script logs.

## Workflow
1. Set `GH_NO_PROMPT=1`.
2. Verify authentication status: `gh auth status`.
3. Query resources using `gh ... --json ... --jq ...`.
4. Process updates or create releases with attached artifacts.
5. Verify resulting GitHub state.

## Expected Output
Clean Bash automation script leveraging GitHub CLI `gh` with structured JSON filtering, release creation, and zero interactive prompts.

## Validation Checklist
- [ ] Is `GH_NO_PROMPT=1` set for headless execution?
- [ ] Are commands querying structured data with `--json` and `--jq`?
- [ ] Are releases created with `--generate-notes` and attached artifacts?
- [ ] Are GraphQL queries parameterized safely with `-F` flags?
- [ ] Is error handling verified for missing or unauthorized repos?

## Common Mistakes & Antipatterns
- Parsing raw column output from `gh pr list` using `awk` or `cut`, which breaks whenever a PR title contains spaces or tabs (always use `--json`!).
- Running `gh release create` in a GitHub Actions runner without `--title` or notes, causing the CLI to attempt to open an interactive `vim` editor and hanging the build.
- Forgetting that `gh api` paginates results, missing data after the first 30 items without `--paginate`.

## Concrete Real-World Example
Scenario: A release manager manually tags releases, drafts changelogs, and uploads 4 binary assets across 12 microservice repositories every Friday.
Prompt: Author a script using GitHub CLI to automate tagging, changelog generation, and asset uploads for a repository.
Application: The AI creates a Bash script accepting version and binary paths, verifies clean git state, creates a Git tag, runs `gh release create "$TAG" ./dist/* --title "Release $TAG" --generate-notes`, and notifies the team, cutting release time from 40 minutes to 30 seconds.
