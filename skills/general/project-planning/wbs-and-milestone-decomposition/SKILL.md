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
