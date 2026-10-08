---
name: "fast-esm-test-suites"
description: "Architecting high-performance ESM-native unit and integration test suites using Vitest, thread pool configuration, in-source testing, and Vite plugin sharing."
category: "testing"
subcategory: "vitest"
language: "typescript"
framework: "vitest"
technology: "vitest-esm"
difficulty: "intermediate"
tags: ["testing", "vitest", "esm", "vite", "in-source-testing", "fast-tests"]
---

# Vitest High-Speed ESM Test Suites and In-Source Testing

## Purpose
Instruct AI agents to configure and author lightning-fast ESM-native test suites with Vitest, leveraging shared Vite build configurations and concurrent test execution.

## When to Use
Use when testing modern Vite-based web applications, ESM libraries, Node.js microservices, or replacing slow Jest test setups.

## Inputs / Context
Vite configuration, TypeScript project setup, test target files, and concurrency requirements.

## Instructions
1. Leverage Native ESM: Vitest runs on native ES modules without requiring complex Babel or ts-jest transformation pipelines.
2. Share Configuration with Vite: Configure tests inside `vite.config.ts` using the `test` property, inheriting all path aliases, plugins, and environment definitions.
3. Configure Optimal Concurrency:
   - Use `test.concurrent` for independent, I/O-bound tests to execute them in parallel within the same file.
   - Configure thread pools in `vitest.config.ts`: choose `pool: 'threads'` for multi-threaded CPU-heavy suites or `pool: 'forks'` when native C++ modules or isolated process state is required.
4. In-Source Testing for Pure Utilities:
   - For algorithmic helpers and math functions, embed tests directly alongside implementation code inside `if (import.meta.vitest) { ... }`, enabling instant feedback and automated tree-shaking in production builds.
5. Use Vitest Vi Spies and Mocks:
   - Use `vi.fn()`, `vi.spyOn()`, `vi.mock()`, and `vi.useFakeTimers()`.
   - Restore mocks automatically using `restoreMocks: true` in config.
6. Snapshot Testing with File Previews:
   - Use `toMatchInlineSnapshot()` or file snapshots with clear visual formatting.

## Constraints / Rules
- Never import production code with commonjs `require()` in Vitest ESM files.
- Do not use `test.concurrent` on tests that mutate shared database or global state.
- Ensure in-source testing blocks are purged from production bundles by configuring `define: { 'import.meta.vitest': 'undefined' }` in Vite.

## Workflow
1. Define test configuration in `vitest.config.ts` with pool strategy and path aliases.
2. Author test files matching `*.test.ts` or `*.spec.ts`.
3. Apply `test.concurrent` to parallelizable test blocks.
4. Use `vi.spyOn()` for external boundary mocking.
5. Run in watch mode (`vitest`) during development or single-run in CI (`vitest run`).

## Expected Output
High-speed Vitest test suite running natively in ESM, with shared Vite aliases, concurrent execution, and in-source testing.

## Validation Checklist
- [ ] Are path aliases shared between Vite and Vitest?
- [ ] Is `test.concurrent` used on isolated tests for maximum throughput?
- [ ] Are in-source tests tree-shaken from production builds?
- [ ] Are mocks restored automatically between test runs?
- [ ] Does CI execute with `vitest run` in under a few seconds?

## Common Mistakes & Antipatterns
- Re-implementing path aliases separately in Jest and Vite configs, causing tests to pass while the build fails or vice-versa.
- Running state-mutating integration tests concurrently, causing race conditions in database assertions.
- Leaving `import.meta.vitest` blocks un-shaken in production web bundles.

## Concrete Real-World Example
Scenario: A large TypeScript web app takes 90 seconds to run unit tests in Jest due to ts-jest transpilation overhead.
Prompt: Migrate this test suite from Jest to Vitest and optimize execution speed.
Application: The AI creates a unified `vitest.config.ts` sharing Vite plugins, replaces `jest.` APIs with `vi.`, flags independent mathematical unit tests with `test.concurrent`, and reduces full test suite execution time from 90 seconds to 4.2 seconds.
