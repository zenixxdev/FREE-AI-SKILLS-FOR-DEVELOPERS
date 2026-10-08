---
name: "isolated-unit-test-design"
description: "Designing fast, deterministic unit test suites following Arrange-Act-Assert (AAA), strict test isolation, state verification over interaction verification, and boundary edge testing."
category: "testing"
subcategory: "unit"
language: "agnostic"
framework: "none"
technology: "unit-testing"
difficulty: "intermediate"
tags: ["testing", "unit-testing", "aaa-pattern", "mocks", "isolation", "deterministic"]
---

# Isolated Unit Testing with Arrange-Act-Assert Discipline

## Purpose
Provide AI agents with rigorous standards for writing fast, maintainable unit tests that test behavior rather than implementation details and run in milliseconds.

## When to Use
Use when writing unit tests for functions, classes, reducers, domain entities, value objects, and business algorithms.

## Inputs / Context
Target function/module, expected domain behavior, boundary inputs (null, empty, negative, max values), and dependencies.

## Instructions
1. Structure every test using the Arrange-Act-Assert (AAA) pattern:
   - Arrange: Set up inputs, test data, and prerequisites.
   - Act: Execute the single method or function under test.
   - Assert: Verify the returned value, resulting state, or thrown error.
2. Ensure Complete Test Isolation: Tests must never depend on the execution order or shared state of other tests. Each test must set up its own isolated state.
3. Test Behavior, Not Implementation Details: Verify public outputs and state transitions; avoid asserting on private methods or internal variable values.
4. Prefer State Verification over Mock Interaction Verification: Verify that the system ended in the correct state rather than asserting that an internal helper function was called 3 times with specific parameters.
5. Test Boundary and Edge Conditions systematically:
   - Empty collections, empty strings, null/undefined inputs.
   - Zero, negative numbers, maximum/minimum integer bounds.
   - Leap years, timezone shifts, daylight saving transitions.
   - Unicode, emoji, and non-ASCII character handling.
6. Keep unit tests fast and deterministic: zero network calls, zero database writes, zero sleep timers.
7. Use descriptive test names following the 'Given_When_Then' or 'Should_When' convention (e.g., `calculateTotal_WhenCouponApplied_ShouldDeductDiscount`).

## Constraints / Rules
- Never write unit tests that require internet connectivity or live external services.
- Never write tests that sleep (`sleep(1000)`) to wait for asynchronous conditions.
- Avoid over-mocking: if an object can be instantiated as a lightweight real instance (like a value object), do not mock it.

## Workflow
1. Identify the public interface and state transitions of the target unit.
2. Outline test cases: Happy path, Invalid input, Boundary cases, Exception cases.
3. Write isolated test cases adhering strictly to AAA blocks.
4. Execute tests and ensure zero cross-test state leakage.
5. Verify coverage reports to ensure all logical decision branches are exercised.

## Expected Output
Deterministic, readable unit tests with clean AAA separation, descriptive names, and thorough boundary coverage.

## Validation Checklist
- [ ] Does every test follow Arrange-Act-Assert structure?
- [ ] Can tests be run in parallel in any arbitrary order without failure?
- [ ] Are boundary conditions (null, zero, empty, max) explicitly tested?
- [ ] Are external network and storage calls completely isolated?
- [ ] Do test names clearly describe the scenario and expected outcome?

## Common Mistakes & Antipatterns
- Asserting that a private internal method was called (`expect(obj._helper).toHaveBeenCalled()`), making tests brittle to harmless refactoring.
- Sharing mutable global objects between test cases, causing tests to pass when run together but fail when run in isolation.
- Writing tests with multiple unrelated assertions testing 10 different features in a single giant test function.

## Concrete Real-World Example
Scenario: A tax calculator function has flaky tests that occasionally fail depending on the developer's local timezone.
Prompt: Write robust, deterministic unit tests for this tax calculation module.
Application: The AI crafts unit tests freezing the timezone context, exercises edge cases ($0 subtotal, negative amounts, exempt tax codes, maximum currency limits), structures each test in AAA blocks, and verifies exact cents rounding without mocks.
