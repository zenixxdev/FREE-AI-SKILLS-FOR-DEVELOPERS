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
