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
