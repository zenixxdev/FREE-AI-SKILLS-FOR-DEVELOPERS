---
name: "deterministic-flow-testing"
description: "Architecting stable, flake-free End-to-End (E2E) tests covering critical user journeys, deterministic test data provisioning, and resilient assertion strategies."
category: "testing"
subcategory: "e2e"
language: "typescript"
framework: "none"
technology: "e2e-testing"
difficulty: "intermediate"
tags: ["testing", "e2e", "flaky-tests", "test-data", "user-journeys", "automation"]
---

# Deterministic End-to-End (E2E) Workflow Testing

## Purpose
Provide AI agents with standards for authoring End-to-End tests that verify critical end-user journeys without suffering from timing flakiness or brittle selectors.

## When to Use
Use when testing critical revenue paths: user registration, onboarding, subscription purchase, checkout, and account settings.

## Inputs / Context
User flow specification, web application URL, authentication mechanism, external service mock requirements, and test environment configuration.

## Instructions
1. Restrict E2E testing to Critical User Journeys (the 5-10 workflows that must never break in production); do not attempt 100% test coverage with E2E tests alone.
2. Provision Deterministic Test Data:
   - Create fresh, isolated test users and organizations via API calls or database seeds before launching the browser test; never rely on shared, static test accounts.
   - Append unique timestamps or UUIDs to generated test usernames and emails.
3. Decouple from External Third Parties:
   - Stub or mock third-party payment gateways (Stripe), SMS providers (Twilio), and email delivery services at the network layer during E2E runs.
4. Eliminate Arbitrary Sleep Delays:
   - Never write `sleep(3000)` or wait for fixed durations; always wait for explicit UI state changes (element visible, text matching, network response resolved).
5. Prefer User-Facing Selectors:
   - Locate elements by accessible role and accessible name (e.g., `getByRole('button', { name: 'Submit' })`) or dedicated test IDs (`data-testid`); avoid styling classes or brittle XPath expressions.
6. Ensure Complete Teardown:
   - Clean up created test accounts and database records in after-all hooks or via automated ephemeral test environment teardown.

## Constraints / Rules
- Never use hardcoded arbitrary sleep statements (`await sleep(5000)`).
- Avoid selecting elements by CSS class names (`.btn-primary-blue-active`) or deep DOM hierarchies (`div > span > button`).
- Never run E2E test suites against production databases.

## Workflow
1. Define critical user journey steps and exit criteria.
2. Provision test user credentials via backend API.
3. Navigate browser and interact using accessible role selectors.
4. Assert on visible DOM state changes and completed network calls.
5. Clean up provisioned data on completion.

## Expected Output
Clean, resilient E2E test scripts utilizing semantic selectors, dynamic data provisioning, and zero arbitrary sleep statements.

## Validation Checklist
- [ ] Are elements selected via accessible roles or `data-testid`?
- [ ] Are all fixed sleep calls replaced with auto-waiting assertions?
- [ ] Is test data generated uniquely per test run?
- [ ] Are third-party payment and messaging APIs mocked/stubbed?
- [ ] Does the test verify the complete user journey from start to finish?

## Common Mistakes & Antipatterns
- Using `page.waitForTimeout(5000)` to wait for a modal, which still fails intermittently when CI runners experience CPU throttling.
- Targeting `.css-1x8g9z` styled-components hash classes that change with every build.
- Using a single hardcoded test user (`testuser@example.com`) across parallel test workers, causing simultaneous tests to log each other out.

## Concrete Real-World Example
Scenario: An e-commerce checkout E2E test fails randomly 30% of the time in GitHub Actions due to timing issues and payment gateway latency.
Prompt: Refactor this flaky checkout E2E test to be completely deterministic and resilient.
Application: The AI creates a unique test customer via API, stubs Stripe API network calls with deterministic mock tokens, replaces CSS class selectors with `getByRole`, and replaces `waitForTimeout(4000)` with `toBeVisible()` assertions on the order confirmation card.
