---
name: "branch-protection-and-rulesets"
description: "Configuring enterprise GitHub repository security, modern Repository Rulesets, signed commits, linear history, and required status checks."
category: "github"
subcategory: "repositories"
language: "json"
framework: "github"
technology: "github-administration"
difficulty: "intermediate"
tags: ["github", "branch-protection", "rulesets", "security", "code-owners", "ci-cd"]
---

# GitHub Repository Security, Rulesets, and Branch Protection

## Purpose
Provide AI agents with standards for locking down GitHub repositories against accidental overrides, unreviewed commits, unverified code, and unauthorized branch deletions.

## When to Use
Use when creating new repositories, onboarding teams, hardening open-source projects, or preparing for SOC 2 / ISO 27001 compliance audits.

## Inputs / Context
Repository target, primary branch (`main`), required CI status checks, CODEOWNERS rules, and bypass actor lists.

## Instructions
1. Modernize with GitHub Repository Rulesets:
   - Use Repository Rulesets instead of legacy branch protection rules for unified, enforceable guardrails across multiple branches and tags.
2. Core Protection Directives for Default Branch (`main` / `master`):
   - Restrict Deletions: Prevent accidental deletion of production branches.
   - Restrict Force Pushes: Block `git push --force` completely for all users, including administrators.
   - Require Linear History: Prevent merge commits; enforce clean rebase or squash-and-merge histories.
   - Require Signed Commits: Enforce GPG, SSH, or S/MIME cryptographic commit signatures (`Require signed commits = true`) to prevent author spoofing.
3. Pull Request Requirements:
   - Require a pull request before merging.
   - Require minimum 1-2 approving reviews from collaborators.
   - Dismiss stale pull request approvals when new commits are pushed.
   - Require review from Code Owners (`CODEOWNERS` file).
   - Prevent the PR author from approving their own pull request.
4. Require Strict Status Checks:
   - Require status checks to pass before merging (e.g., CI test suite, linter, security scan).
   - Enable 'Require branches to be up to date before merging': ensures the PR is tested against the absolute latest code on `main` before merging.
5. Enable Automated Security Features:
   - Secret Scanning and Push Protection: Block commits containing API keys, AWS credentials, or private tokens before they ever reach the repository.
   - Dependabot alerts and security updates: Automatically open PRs for vulnerable dependencies.

## Constraints / Rules
- Never allow force-pushing to the default production branch.
- Never disable push protection for secrets scanning.
- Avoid exempting administrators from status checks and PR review requirements.

## Workflow
1. Create branch ruleset targeting `refs/heads/main`.
2. Configure PR requirements (approvals, code owners, dismiss stale).
3. Add required CI status checks matching workflow job names.
4. Enable Secret Scanning Push Protection in repository security settings.
5. Add `.github/CODEOWNERS` file mapping critical directories to team leads.

## Expected Output
Exported GitHub Ruleset JSON configuration and `.github/CODEOWNERS` file implementing strict branch safety and secret push protection.

## Validation Checklist
- [ ] Are force-pushes and branch deletions disabled?
- [ ] Are pull requests mandatory with at least 1 approval?
- [ ] Are stale reviews dismissed upon new commit pushes?
- [ ] Are required CI checks enforced on up-to-date branches?
- [ ] Is Secret Scanning Push Protection enabled?

## Common Mistakes & Antipatterns
- Enabling status checks without checking 'Require branches to be up to date', allowing PR 1 and PR 2 to pass CI independently, but break production when both are merged back-to-back.
- Allowing administrators to bypass branch rules, resulting in an admin accidentally running `git push -f origin main` and deleting months of commits.
- Leaving Secret Scanning disabled, resulting in leaked database passwords that are permanently indexed in Git history.

## Concrete Real-World Example
Scenario: A developer accidentally force-pushes an experimental rebase to `main`, overwriting 15 commits from colleagues and breaking the production deployment.
Prompt: Configure GitHub Repository Rulesets to permanently prevent force pushes and require CI checks and reviews on `main`.
Application: The AI writes a GitHub Ruleset configuration enforcing `non_fast_forward: true`, `deletion: true`, requiring 1 peer approval with stale approval dismissal, enforcing linear history, and requiring the `test-suite` CI check before merge.
