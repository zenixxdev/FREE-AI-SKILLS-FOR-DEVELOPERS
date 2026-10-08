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
