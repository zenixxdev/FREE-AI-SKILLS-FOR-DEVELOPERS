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
