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
