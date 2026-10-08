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
