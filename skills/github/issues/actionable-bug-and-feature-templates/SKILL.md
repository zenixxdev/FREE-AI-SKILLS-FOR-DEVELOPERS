---
name: "actionable-bug-and-feature-templates"
description: "Designing structured, actionable GitHub Issue Forms (.github/ISSUE_TEMPLATE/*.yml) for bug reports, feature requests, and security disclosures."
category: "github"
subcategory: "issues"
language: "yaml"
framework: "github"
technology: "github-issues"
difficulty: "beginner"
tags: ["github", "issues", "issue-templates", "bug-reports", "open-source", "maintainability"]
---

# Actionable GitHub Issue Forms and Bug Report Templates

## Purpose
Instruct AI agents to author structured GitHub Issue Forms using YAML syntax that compel issue reporters to provide complete diagnostic information, reproduction steps, and environment context.

## When to Use
Use when setting up open-source repositories, standardizing bug reporting for developer teams, or eliminating vague 'it doesn't work' tickets.

## Inputs / Context
Project technologies, required diagnostic details (OS, version, logs), and issue classification categories.

## Instructions
1. Standardize on Modern GitHub Issue Forms (YAML):
   - Use `.github/ISSUE_TEMPLATE/*.yml` rather than legacy markdown templates; YAML issue forms provide structured web input controls (dropdowns, checkboxes, code inputs, required fields).
2. Bug Report Form Structure (`bug-report.yml`):
   - Summary / Description (Textarea).
   - Minimal Reproduction Steps (Numbered list, required).
   - Expected vs Actual Behavior.
   - Code Sample or Reproduction Repository URL.
   - Environment Details (Dropdowns for OS, Node/Python version, Browser, Package version).
   - Stack Traces & Diagnostic Logs (Code textarea with markdown syntax highlighting).
   - Pre-submission Checklist (Confirming they searched existing open issues).
3. Feature Request Form Structure (`feature-request.yml`):
   - Problem Statement: What problem does this solve?
   - Proposed Solution: How should it work?
   - Alternatives Considered: What workarounds were explored?
   - Additional Context.
4. Configure Issue Form Configuration (`config.yml`):
   - Disable blank issues: `blank_issues_enabled: false`.
   - Provide external links for security vulnerabilities or community chat: `contact_links: [...]`.

## Constraints / Rules
- Never leave `blank_issues_enabled: true` in high-traffic open-source repositories.
- Avoid making forms so long and burdensome that users give up reporting legitimate bugs.
- Do not use issue forms for reporting security vulnerabilities; direct users to private security advisories or SECURITY.md.

## Workflow
1. Create `.github/ISSUE_TEMPLATE/` directory.
2. Author `bug-report.yml` with required fields and dropdowns.
3. Author `feature-request.yml` focusing on problem definition.
4. Author `config.yml` disabling blank issues and linking to security policy.
5. Validate YAML syntax against GitHub schema.

## Expected Output
Set of clean, valid GitHub Issue Forms (`bug-report.yml`, `feature-request.yml`, `config.yml`) enforcing complete reproduction context.

## Validation Checklist
- [ ] Are issue templates authored in GitHub YAML Issue Form syntax?
- [ ] Are reproduction steps marked as `required: true`?
- [ ] Are blank issues disabled via `config.yml`?
- [ ] Is security reporting routed away from public issues to private disclosures?
- [ ] Are environment dropdowns updated to reflect current supported versions?

## Common Mistakes & Antipatterns
- Leaving a generic markdown issue template that users completely delete to write 'It crashed please help', leaving zero diagnostic data.
- Forgetting to specify `render: shell` or `render: text` on log input fields, resulting in unformatted walls of text.
- Allowing users to file public bug reports for zero-day security vulnerabilities instead of private vulnerability reporting.

## Concrete Real-World Example
Scenario: An open-source library receives 20 issues a week saying 'Module fails to load' with no OS, no version, and no stack trace, wasting hours of maintainer time.
Prompt: Author a structured GitHub Issue Form in YAML to compel reporters to submit complete environment context and minimal reproductions.
Application: The AI creates `.github/ISSUE_TEMPLATE/bug-report.yml` with mandatory fields for reproduction steps, environment dropdowns (OS, Node version), a syntax-highlighted code block for stack traces, and a `config.yml` disabling unstructured blank issues.
