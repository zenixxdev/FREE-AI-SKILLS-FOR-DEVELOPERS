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
