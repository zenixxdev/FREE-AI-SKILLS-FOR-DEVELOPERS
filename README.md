# FREE AI SKILLS FOR DEVELOPERS

> **A curated, production-grade, model-agnostic library of structured AI developer skills designed to transform AI coding assistants into reliable, deterministic software engineering partners.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Status: Phase 1](https://img.shields.io/badge/Phase-1_Foundation-green.svg)](ROADMAP.md)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/FREE-AI-SKILLS-FOR-DEVELOPERS)

---

## Table of Contents

- [The Core Problem](#the-core-problem)
- [What is an AI Skill?](#what-is-an-ai-skill)
- [Why Skills Beat Random Prompts](#why-skills-beat-random-prompts)
- [Repository Architecture](#repository-architecture)
- [Phase 1 Scope](#phase-1-scope)
- [How to Use Skills](#how-to-use-skills)
  - [1. Copy into Chat / Prompt Context](#1-copy-into-chat--prompt-context)
  - [2. System Prompts & Repository Rules (.cursorrules, Copilot, Claude Projects)](#2-system-prompts--repository-rules)
  - [3. Autonomous Agent Loops](#3-autonomous-agent-loops)
- [Practical Walkthrough: Real-World Example](#practical-walkthrough-real-world-example)
- [The Canonical Skill Specification](#the-canonical-skill-specification)
- [Skill Quality Philosophy](#skill-quality-philosophy)
- [Model-Agnostic Philosophy](#model-agnostic-philosophy)
- [Roadmap & Future Phases](#roadmap--future-phases)
- [Contributing](#contributing)
- [Security](#security)
- [License](#license)

---

## The Core Problem

Modern Large Language Models (LLMs) possess vast knowledge across languages, frameworks, and tools. However, when developers interact with models using generic prompts—such as *"Build an auth flow"* or *"Make this fast"*—the output is frequently plagued by:

1. **Vague Generalities**: Hallucinated APIs, boilerplate templates with `stub` comments, and simplistic happy paths.
2. **Security Vulnerabilities**: Lack of input validation, unparameterized database queries, token exposure, and flawed authorization checks.
3. **Architectural Drift**: Inconsistent patterns, premature abstractions, breaking changes, and coupling domain logic to frameworks.
4. **Lack of Verifiability**: No built-in verification criteria, leaving developers to manually test edge cases.

Most prompt collections treat AI as a toy: a grab-bag of one-line prompts producing shallow snippets. Software engineering demands repeatability, edge-case coverage, security rigor, and architectural discipline.

---

## What is an AI Skill?

An **AI Skill** is a structured, version-controlled Markdown specification (`SKILL.md`) that instructs an AI coding assistant on:

- **When to activate**: Explicit triggering scenarios and prerequisites.
- **What context to inspect**: Dependencies, environmental factors, and project conventions to verify before generating code.
- **Step-by-step instructions**: Precise, technology-aware implementation workflows.
- **Hard constraints**: Strict negative rules preventing known security flaws, antipatterns, and breaking changes.
- **Validation checklists**: Verifiable criteria the AI must test before finalizing output.
- **Realistic examples**: Concrete developer scenarios demonstrating real-world execution.

Skills act as **executable engineering guidelines** for AI agents, transforming probabilistic text generation into disciplined software craftsmanship.

---

## Why Skills Beat Random Prompts

| Dimension | Random Generic Prompts | Structured AI Skills |
| :--- | :--- | :--- |
| **Consistency** | Highly variable; changes across turns | Deterministic and repeatable |
| **Context Awareness** | Ignorant of existing repo conventions | Requires pre-inspection of surrounding code |
| **Error Handling** | Frequently omits error paths | Mandates exhaustive failure mode modeling |
| **Security** | Leaves security as an afterthought | Enforces defensive defaults (OWASP, least privilege) |
| **Completeness** | Leaves `stub` placeholders | Requires complete, runnable implementations |
| **Verification** | No built-in validation criteria | Includes concrete, testable validation checklists |

---

## Repository Architecture

The repository is organized into **24 canonical top-level engineering domains**, containing technology groupings and specialized skill directories:

```text
skills/
├── ui/                 # Web, mobile, and design token styling
├── ux/                 # User flows, empty/error UX, accessibility
├── frontend/           # HTML, CSS, JS, TS, React, Next.js, Vue, Angular, Svelte
├── backend/            # Python, JS, TS, Java, Go, Rust, PHP, General
├── logic/              # Problem solving, algorithms, FSMs, validation, error taxonomies
├── database/           # SQL, PostgreSQL, MySQL, MongoDB, SQLite, Supabase, Firebase, Redis
├── api/                # REST, GraphQL, WebSocket, gRPC, Webhooks
├── authentication/     # OAuth PKCE, JWT rotation, Sessions, Passkeys, Magic links, RBAC
├── security/           # OWASP Top 10, brute-force defense, IDOR prevention, CVE remediation
├── testing/            # Unit, integration, E2E, Playwright, Jest, Vitest, Pytest
├── debugging/          # Stack trace analysis, profiling, heap dumps, distributed tracing
├── performance/        # Core Web Vitals, backend latency, slow queries, mobile FPS
├── devops/             # Docker, Linux systemd, Nginx, CI/CD, GitHub Actions, Deployments
├── mobile/             # Android (Kotlin, Java, Compose, XML), Flutter, React Native, iOS
├── game-development/   # Unity, Unreal Engine, Godot, Three.js, Canvas, Game Design
├── ai/                 # Prompting, LLM integration, RAG, embeddings, tools, evaluation
├── agents/             # ReWOO planning, tool guardrails, memory, DAGs, multi-agent
├── automation/         # Python, JS, POSIX Shell, GitHub CLI, Headless Browsers
├── cloud/              # AWS, Azure, Google Cloud, Multi-region DR
├── github/             # Repositories, Issue forms, PR reviews, Actions, SemVer releases
├── git/                # Trunk-based branching, Fast-forward merges, Interactive rebase
├── architecture/       # System design, Clean/Onion architecture, Microservices, Sharding
├── documentation/      # README architecture, OpenAPI 3.1, Intent comments, ADRs
└── general/            # Checklist code reviews, Strangler Fig refactoring, Pragmatic SOLID
```

---

## Phase 1 Scope

Phase 1 establishes a curated foundation of **132 deep, production-grade skills** covering every subcategory in the repository hierarchy. Each skill provides:

- Standardized YAML frontmatter metadata.
- Clear Purpose & Triggering Conditions.
- Required Inputs and Context.
- Actionable, authoritative instructions.
- Strict architectural constraints and guardrails.
- Step-by-step workflow protocols.
- Concrete validation checklists.
- Documented antipatterns and common mistakes.
- Realistic developer scenarios and execution examples.

---

## How to Use Skills

### 1. Copy into Chat / Prompt Context
When working with any AI assistant (ChatGPT, Claude, Gemini, Copilot Chat):
1. Navigate to the relevant skill file (e.g., `skills/api/rest/idempotent-endpoint-design/SKILL.md`).
2. Copy the contents of the `SKILL.md` file.
3. Paste it at the top of your prompt followed by your specific task:

```text
[Paste SKILL.md contents here]

TASK:
I have an Express.js checkout route (`POST /api/orders`) that needs to be
idempotent. Apply the instructions and constraints above to implement
Idempotency-Key header support backed by Redis.
```

### 2. System Prompts & Repository Rules
Incorporate skills directly into your IDE assistant rules:
- **Cursor (`.cursorrules`)**: Append the content of relevant skills into your project's `.cursorrules` file.
- **GitHub Copilot (`.github/copilot-instructions.md`)**: Point Copilot to key skills for architectural adherence.
- **Claude Projects**: Upload relevant skill files as project knowledge files.

### 3. Autonomous Agent Loops
If you are developing or running coding agents (AutoGPT, SWE-bench agents, Claude Computer Use, LangGraph):
- Mount the `skills/` directory into your agent's workspace.
- Allow the agent to dynamically inspect and load skills via file reading tools when executing domain-specific tasks.

---

## Practical Walkthrough: Real-World Example

### Scenario: Eliminating N+1 Queries in a GraphQL API
**Problem**: An existing GraphQL API fetches blog posts and their authors. When a query requests 50 posts, the server executes 51 SQL queries (1 for posts, 50 for authors), causing severe database lock contention.

**Applying the Skill**:
The developer references `skills/api/graphql/schema-design-and-dataloaders/SKILL.md`.

**What the AI does under this skill**:
1. **Context Inspection**: Checks existing schema definitions and database connection handles.
2. **Execution**:
   - Refuses to write inline database queries inside the `author` field resolver.
   - Instantiates a request-scoped `DataLoader` factory in the GraphQL context.
   - Implements a batch loader function querying `WHERE id IN (?)` preserving exact key ordering.
   - Resolves the author field via `context.loaders.authorLoader.load(post.authorId)`.
3. **Validation**: Verifies database query logs confirm exactly 2 SQL queries execute instead of 51.

---

## The Canonical Skill Specification

Every skill follows the canonical specification defined in `templates/SKILL.md`:

```yaml
---
name: kebab-case-name
description: Clear, 1-2 sentence summary of what this skill does and when to use it.
category: category-name
subcategory: subcategory-name
language: target-language (or agnostic)
framework: target-framework (or none)
technology: primary-technology
difficulty: beginner | intermediate | advanced
tags: [tag1, tag2, tag3]
---
```

Followed by structured sections:
- `## Purpose`: Core objective and problem statement.
- `## When to Use`: Explicit activation triggers and scenarios.
- `## Inputs / Context`: Prerequisite data and environmental factors.
- `## Instructions`: Step-by-step imperative guidance.
- `## Constraints / Rules`: Hard negative guardrails.
- `## Workflow`: Execution lifecycle phases.
- `## Expected Output`: Definition of deliverable code/artifacts.
- `## Validation Checklist`: Binary pass/fail verification points.
- `## Common Mistakes & Antipatterns`: What to avoid.
- `## Concrete Real-World Example`: Real developer prompt and solution.

---

## Skill Quality Philosophy

We prioritize **Quality over Quantity**, **Usefulness over Filling Folders**, and **Engineering Rigor over Generic AI Prompts**.

- **No Generic Filler**: A skill that says *"Write clean code and use error handling"* is rejected. Skills must provide concrete technical procedures.
- **Defensive Engineering**: Every skill enforces security guardrails (least privilege, input sanitization, safe error propagation).
- **Zero Placeholders**: All code examples in skills must be complete and runnable.

---

## Model-Agnostic Philosophy

Phase 1 is intentionally **100% model-agnostic**. The skill specifications rely on universal Markdown structures, standard YAML frontmatter, and universal software engineering principles. They work identically across:
- Anthropic Claude (3.5 Sonnet, 3 Opus)
- OpenAI GPT-4, GPT-4o, o1
- Google Gemini (1.5 Pro, 2.0)
- Meta Llama 3/3.1
- Mistral Large & Codestral
- Qwen 2.5 Coder & DeepSeek V3/R1

---

## Roadmap & Future Phases

- **Phase 1 (Current)**: Foundational library of 132 curated, universal developer skills across 24 categories.
- **Phase 2 (Tooling & Validation)**: CLI tool (`skills-cli`), automated linting for `SKILL.md` files, and JSON Schema validation.
- **Phase 3 (Ecosystem & Registry)**: Package manager distribution, VS Code extension, and searchable web portal.
- **Phase 4 (Agent Integration)**: Native adapters for popular agent frameworks (LangGraph, CrewAI, AutoGen).

---

## Contributing

We welcome contributions from engineers across all technical specializations! Please review:
- [CONTRIBUTING.md](CONTRIBUTING.md) for pull request workflows.
- [docs/skill-format.md](docs/skill-format.md) for the skill format specification.
- [docs/contribution-guide.md](docs/contribution-guide.md) for writing and testing skills.

---

## Security

Please review [SECURITY.md](SECURITY.md) for vulnerability reporting guidelines and our security disclosure policy.

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.
