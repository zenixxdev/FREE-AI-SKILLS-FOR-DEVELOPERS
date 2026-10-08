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
