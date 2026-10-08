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
