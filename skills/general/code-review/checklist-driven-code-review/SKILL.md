---
name: "checklist-driven-code-review"
description: "Conducting rigorous, structured code reviews utilizing defensive engineering checklists, security verification, performance checks, and constructive feedback standards."
category: "general"
subcategory: "code-review"
language: "agnostic"
framework: "none"
technology: "engineering-practices"
difficulty: "intermediate"
tags: ["general", "code-review", "quality", "defensive-programming", "best-practices"]
---

# Checklist-Driven Code Review and Defensive Verification

## Purpose
Equip AI agents with a comprehensive, checklist-driven code review framework to audit pull requests for correctness, security vulnerabilities, edge-case coverage, and architectural health.

## When to Use
Use when reviewing pull requests, evaluating AI-generated code, conducting pre-merge audits, or mentoring developers.

## Inputs / Context
Git diff or pull request code, PR description, target architecture standards, and test results.

## Instructions
1. The 5-Pillar Code Review Checklist:
   - Pillar 1: Correctness & Logic
     * Does the code solve the intended problem?
     * Are edge cases (null, empty, negative, boundary conditions) handled?
     * Are asynchronous race conditions or concurrency deadlocks possible?
   - Pillar 2: Security & Defense
     * Is all external input strictly validated and sanitized?
     * Are database queries parameterized (SQL injection safe)?
     * Are authorization checks enforced at the resource level (IDOR safe)?
     * Are secrets or sensitive PII leaked in logs or error messages?
   - Pillar 3: Performance & Scalability
     * Are there N+1 query patterns or unbounded database loops?
     * Are memory-intensive operations streamed rather than buffered?
     * Are expensive calculations memoized or indexed?
   - Pillar 4: Maintainability & Design
     * Does the code adhere to existing project architectural patterns?
     * Are functions small and focused on a single responsibility?
     * Are variable and function names self-describing?
   - Pillar 5: Test Coverage & Verification
     * Are unit and integration tests included for both happy and failure paths?
     * Do tests verify behavior rather than implementation details?
2. Constructive Feedback Framing:
   - Differentiate Blocking issues from Non-blocking suggestions using tags: `[Blocking]`, `[Suggestion]`, `[Question]`, `[Nit]`.
   - Always explain the concrete technical risk behind a requested change.

## Constraints / Rules
- Never approve code with unparameterized database queries or unauthenticated mutation routes.
- Avoid bike-shedding on personal stylistic preferences that can be enforced automatically via Prettier or ESLint.
- Do not approve PRs that disable existing tests without written justification.

## Workflow
1. Read PR description and understand business intent.
2. Systematically evaluate diff across all 5 pillars.
3. Test edge cases mentally or via automated test suites.
4. Formulate actionable review comments with clear rationale.
5. Provide a summary verdict (Approve, Request Changes, Comment).

## Expected Output
Structured code review feedback report categorized by severity (Blocking vs Suggestion) across correctness, security, performance, and testability.

## Validation Checklist
- [ ] Are security vulnerabilities (SQLi, IDOR, XSS) checked?
- [ ] Are boundary conditions and error states verified?
- [ ] Are N+1 queries and performance bottlenecks flagged?
- [ ] Are feedback items categorized as [Blocking] or [Suggestion]?
- [ ] Is feedback constructive with clear rationale?

## Common Mistakes & Antipatterns
- Spending 80% of review time commenting on missing spaces or variable casing (which linters should catch) while missing an unauthenticated database deletion endpoint.
- Writing vague review comments like 'This looks wrong' without explaining why or suggesting a correct alternative.
- Approving a 1,000-line PR after glancing at it for 30 seconds (Rubber-stamping).

## Concrete Real-World Example
Scenario: A pull request adds a new user search endpoint by concatenating the search query directly into a SQL statement and omitting pagination limits.
Prompt: Conduct a rigorous code review on this pull request diff.
Application: The AI performs a 5-pillar review, raises a `[Blocking]` security alert for SQL injection with a parameterized query example, raises a `[Blocking]` performance issue for missing `LIMIT` pagination, offers a `[Suggestion]` for debouncing input, and outlines required unit test cases.
