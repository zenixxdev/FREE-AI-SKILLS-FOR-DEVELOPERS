---
name: "pytest-fixtures-and-parameterization"
description: "Architecting clean, modular Python test suites using Pytest fixtures, hierarchical scopes, yield teardowns, parameterization, and property-based testing."
category: "testing"
subcategory: "pytest"
language: "python"
framework: "pytest"
technology: "pytest"
difficulty: "intermediate"
tags: ["testing", "python", "pytest", "fixtures", "parameterize", "test-architecture"]
---

# Pytest Fixture Architecture, Scopes, and Parameterization

## Purpose
Provide AI agents with standards for writing clean, modular Python test suites utilizing Pytest fixture dependency injection, scoped resources, and exhaustive table-driven parameterization.

## When to Use
Use when testing Python microservices, data processing pipelines, machine learning models, or Django/FastAPI applications.

## Inputs / Context
Python functions, classes, database connections, test data permutations, and teardown requirements.

## Instructions
1. Structure test fixtures hierarchically using `conftest.py` files placed at appropriate directory levels:
   - Root `conftest.py`: Global fixtures (database engine, mock servers, environment variables).
   - Subdirectory `conftest.py`: Feature-specific fixtures (scoped models, authenticated user sessions).
2. Configure Fixture Scopes appropriately to maximize performance:
   - `scope="function"` (default): Fresh instance per test for stateful, mutable objects.
   - `scope="module"` or `scope="session"`: Shared instance for expensive, read-only resources (e.g., containerized database connection pools, ML model weights).
3. Use Yield Fixtures for safe teardown:
   - Code before `yield`: Setup phase.
   - `yield resource`: Injected into the test.
   - Code after `yield`: Teardown phase (guaranteed to execute even if the test fails).
4. Exhaustive Parameterization via `@pytest.mark.parametrize`:
   - Replace repetitive test functions with a single parameterized test function testing multiple input/output tuples.
   - Provide descriptive IDs using the `ids` parameter or custom ID generators for readable test reports.
5. Use `tmp_path` fixture for temporary file operations (automatically cleaned up by Pytest).
6. Use `monkeypatch` fixture for safe environment variable and configuration overrides without permanent state pollution.
7. Mark slow tests (`@pytest.mark.slow`) and integration tests (`@pytest.mark.integration`) to support fast unit test runs (`pytest -m "not slow"`).

## Constraints / Rules
- Never use Python's built-in `unittest.TestCase` class hierarchy in new Pytest codebases; use plain functions and fixtures.
- Never write setup/teardown code in `try...finally` inside tests; use yield fixtures.
- Avoid mutating session-scoped fixtures within individual tests.

## Workflow
1. Define shared fixtures in `conftest.py` with yield teardown blocks.
2. Group test cases by domain feature.
3. Apply `@pytest.mark.parametrize` for boundary value testing.
4. Execute tests via `pytest -v --durations=10` to identify slow tests.
5. Verify clean state resets across tests.

## Expected Output
Clean Pytest test suite featuring conftest fixture architecture, yield teardowns, parameterization tables, and marker tags.

## Validation Checklist
- [ ] Are fixtures organized logically in `conftest.py` files?
- [ ] Are teardowns implemented reliably using yield fixtures?
- [ ] Are parameterization tables used to test multiple input/output pairs?
- [ ] Are expensive resources scoped to `session` or `module`?
- [ ] Does `monkeypatch` manage environment variable overrides?

## Common Mistakes & Antipatterns
- Re-initializing an expensive database connection pool in every single test function instead of using a `session`-scoped fixture.
- Mutating a `session`-scoped fixture in test 1, causing test 2 to fail due to corrupted shared state.
- Writing 10 nearly identical test functions instead of a single `@pytest.mark.parametrize` table.

## Concrete Real-World Example
Scenario: A Python data validation module has 20 copy-pasted test functions testing various valid and invalid phone number formats, making test maintenance tedious.
Prompt: Refactor these repetitive phone validation tests into an idiomatic, parameterized Pytest suite.
Application: The AI creates a single test function decorated with `@pytest.mark.parametrize("phone, expected_valid, error_code", [...])` covering all 20 cases with clear test IDs, reducing lines of code by 80% while improving test reporting clarity.
