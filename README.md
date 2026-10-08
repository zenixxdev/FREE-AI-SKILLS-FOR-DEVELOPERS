FREE AI SKILLS FOR DEVELOPERS

«A curated open-source library of structured AI skills for practical software development workflows.»

""License: MIT" (https://img.shields.io/badge/License-MIT-blue.svg)" (LICENSE)
""Skills" (https://img.shields.io/badge/Skills-132-blueviolet.svg)" (skills/)
""PRs Welcome" (https://img.shields.io/badge/PRs-Welcome-brightgreen.svg)" (CONTRIBUTING.md)
""GitHub" (https://img.shields.io/badge/GitHub-zenixxdev-black.svg)" (https://github.com/zenixxdev/FREE-AI-SKILLS-FOR-DEVELOPERS)

FREE AI SKILLS FOR DEVELOPERS is a collection of reusable "SKILL.md" files that give AI coding assistants structured instructions for common software engineering tasks.

Instead of relying on vague, one-line prompts, each skill provides context, workflow guidance, constraints, expected outcomes, and validation criteria.

---

Table of Contents

- "Why This Exists" (#why-this-exists)
- "What Is an AI Skill?" (#what-is-an-ai-skill)
- "Why Structured Skills?" (#why-structured-skills)
- "Repository Structure" (#repository-structure)
- "How to Use a Skill" (#how-to-use-a-skill)
- "Real-World Example" (#real-world-example)
- "Skill Specification" (#skill-specification)
- "Skill Quality Standards" (#skill-quality-standards)
- "Contributing" (#contributing)
- "Security" (#security)
- "License" (#license)

---

Why This Exists

AI coding assistants can generate code quickly, but the quality of the result depends heavily on the context and instructions they receive.

A request such as:

«"Build an authentication system."»

does not define important engineering considerations such as:

- existing project architecture
- security requirements
- validation rules
- error handling
- edge cases
- testing expectations
- deployment constraints
- compatibility with the existing codebase

This repository aims to provide reusable instructions that make those expectations explicit.

The goal is simple:

Give developers better building blocks for AI-assisted software engineering.

---

What Is an AI Skill?

An AI Skill is a structured Markdown document that provides an AI assistant with a repeatable procedure for handling a specific development task.

A good skill can define:

- when the skill should be used
- what context should be inspected
- what information is required
- what steps should be followed
- what constraints must be respected
- what mistakes should be avoided
- what the expected result should look like
- how the result should be validated

Skills are stored as:

SKILL.md

This makes them easy to read, copy, review, version, share, and integrate into different AI-assisted development workflows.

---

Why Structured Skills?

Area| Generic Prompt| Structured Skill
Context| Often unspecified| Explicit context requirements
Workflow| Usually minimal| Step-by-step guidance
Constraints| Easy to overlook| Clearly defined guardrails
Edge Cases| Often missed| Deliberately considered
Validation| Usually absent| Built into the skill
Reusability| Often rewritten| Version-controlled and reusable
Collaboration| Difficult to standardize| Consistent format for contributors

The purpose is not to replace developer judgment.

The purpose is to provide AI systems with better engineering instructions to work from.

---

Repository Structure

The repository is organized into technical domains, with technology-specific groupings and concrete skills underneath them.

skills/
├── ui/
├── ux/
├── frontend/
├── backend/
├── logic/
├── database/
├── api/
├── authentication/
├── security/
├── testing/
├── debugging/
├── performance/
├── devops/
├── mobile/
├── game-development/
├── ai/
├── agents/
├── automation/
├── cloud/
├── github/
├── git/
├── architecture/
├── documentation/
└── general/

A typical skill follows this pattern:

skills/
└── frontend/
    └── react/
        └── component-architecture/
            └── SKILL.md

Technology groupings keep the repository organized, while individual skill directories contain the actual reusable instructions.

---

How to Use a Skill

1. Find a Relevant Skill

Browse the "skills/" directory and select the skill that matches your task.

For example:

skills/api/rest/idempotent-endpoint-design/SKILL.md

2. Read or Copy the Skill

Open the "SKILL.md" file and provide its contents to your AI coding assistant along with your project-specific request.

Example:

[Paste the contents of SKILL.md here]

TASK:

I have an Express.js checkout endpoint:

POST /api/orders

Implement idempotency using an Idempotency-Key header
with Redis while preserving the existing API contract.

3. Provide Project Context

Skills work best when the AI can inspect the actual project.

Depending on the tool you use, provide access to:

- source files
- package configuration
- database schema
- API definitions
- existing components
- tests
- project conventions
- relevant documentation

The skill provides the workflow; your project provides the context.

4. Validate the Result

Do not treat generated code as automatically correct.

Run the appropriate:

- tests
- type checks
- linters
- builds
- security checks
- integration checks

and verify the result against the skill's validation criteria.

---

Real-World Example

Scenario: Avoiding N+1 Queries in GraphQL

Imagine an existing GraphQL API that returns blog posts and their authors.

A request for 50 posts causes:

1 query  → fetch posts
50 queries → fetch each author
------------------------------
51 queries total

The relevant skill is:

skills/api/graphql/schema-design-and-dataloaders/SKILL.md

A structured skill can guide the AI to:

1. Inspect the existing GraphQL schema and resolver architecture.
2. Identify where repeated database access occurs.
3. Introduce request-scoped batching.
4. Keep author resolution separate from direct database logic.
5. Preserve key-to-result ordering.
6. Add or update tests for batched resolution.
7. Verify the resulting query behavior.

The important difference is that the skill describes an engineering workflow, not merely a desired end result.

---

Skill Specification

Every skill follows the structure defined in:

templates/SKILL.md

Metadata

A typical skill begins with YAML frontmatter:

---
name: component-architecture
description: Define a reusable component architecture for a frontend application.
category: frontend
subcategory: react
language: typescript
framework: react
technology: react
difficulty: intermediate
tags:
  - react
  - architecture
  - components
---

Core Sections

Skills should normally contain:

## Purpose

## When to Use

## Inputs / Context

## Instructions

## Constraints / Rules

## Workflow

## Expected Output

## Validation Checklist

## Common Mistakes & Antipatterns

## Concrete Real-World Example

Not every skill needs identical wording or identical depth, but the structure should remain predictable and useful.

---

Skill Quality Standards

The repository prioritizes practical value and technical quality.

Useful Skills

A useful skill should provide actionable instructions.

Weak:

Write clean code.
Use best practices.
Handle errors properly.

Strong:

Inspect the existing error-handling conventions first.
Identify all expected failure states.
Preserve the project's existing error response format.
Handle validation, dependency failures, timeouts, and unexpected exceptions separately.
Add tests for each meaningful failure path.

Context Before Changes

Skills should encourage AI assistants to inspect the existing project before modifying it.

That can include:

- architecture
- dependencies
- naming conventions
- existing abstractions
- APIs
- tests
- configuration
- database schema

Defensive Engineering

Where applicable, skills should explicitly account for:

- input validation
- authentication
- authorization
- secure secret handling
- safe database access
- dependency safety
- error handling
- least-privilege principles

Validation

Important skills should include concrete validation criteria.

Examples:

- [ ] Existing behavior remains intact
- [ ] Error paths are covered
- [ ] Tests pass
- [ ] Types compile successfully
- [ ] No secrets are exposed
- [ ] Unnecessary dependencies were avoided

No Filler

Skills should not exist simply to increase the file count.

Avoid:

- generic advice
- repetitive skills
- meaningless names
- copied boilerplate
- unsupported technical claims
- incomplete examples
- placeholder implementations

Every skill should provide a clear reason to exist.

---

Contributing

Contributions are welcome.

Before submitting a new skill, review:

- "CONTRIBUTING.md" (CONTRIBUTING.md)
- "docs/skill-format.md" (docs/skill-format.md)
- "docs/naming-conventions.md" (docs/naming-conventions.md)
- "docs/contribution-guide.md" (docs/contribution-guide.md)

A good contribution should be:

- focused on a real developer task
- technically accurate
- independently useful
- clearly organized
- validated against realistic scenarios
- consistent with the repository structure

---

Security

Security-related skills are intended for defensive engineering, secure development, testing, and remediation.

Please review "SECURITY.md" (SECURITY.md) for security reporting guidance.

Never commit:

- passwords
- API keys
- access tokens
- private credentials
- production secrets
- sensitive user data

---

License

This project is licensed under the MIT License.

See "LICENSE" (LICENSE) for the complete license text.
