---
name: "resilient-page-object-testing"
description: "Architecting scalable browser test suites in Playwright using the Page Object Model (POM), locator auto-waiting, visual regression, and network route interception."
category: "testing"
subcategory: "playwright"
language: "typescript"
framework: "playwright"
technology: "playwright"
difficulty: "advanced"
tags: ["testing", "playwright", "page-object-model", "locators", "network-mocking", "e2e"]
---

# Playwright Architecture with Page Object Models and Network Mocking

## Purpose
Instruct AI agents to author enterprise-grade Playwright test suites utilizing maintainable Page Object Models, auto-waiting locators, and deterministic network route mocks.

## When to Use
Use when implementing automated browser testing with Playwright, creating cross-browser test suites, or testing complex client-side applications.

## Inputs / Context
Application URL, page templates, interactive elements, user workflows, and API mocks.

## Instructions
1. Structure test suites using the Page Object Model (POM):
   - Encapsulate page locators and user interactions inside dedicated class files (e.g., `LoginPage.ts`, `DashboardPage.ts`).
   - Keep assertions inside test files (`*.spec.ts`), using Page Objects purely to perform actions and expose locators.
2. Leverage Playwright's Built-in Auto-Waiting Locators:
   - Use `page.getByRole()`, `page.getByText()`, `page.getByLabel()`, and `page.getByTestId()`.
   - Never call `page.waitForSelector()` or `page.waitForTimeout()`; Playwright locators automatically wait for actionable conditions (attached, visible, stable, enabled) before clicking or filling.
3. Use Web-First Assertions:
   - Always use `await expect(locator).toBeVisible()`, `await expect(locator).toHaveText()`, or `await expect(locator).toBeEnabled()`.
   - Web-first assertions poll automatically until conditions are satisfied or timeout occurs.
4. Intercept and Mock Network Requests using `page.route()`:
   - Mock slow or non-deterministic third-party APIs: `await page.route('**/api/v1/quotes', route => route.fulfill({ json: mockQuotes }))`.
   - Test network error handling: simulate HTTP 500 or offline conditions using `route.abort()`.
5. Capture Artifacts on Failure:
   - Configure `playwright.config.ts` to capture screenshots, video, and execution trace files (`trace: 'retain-on-failure'`) for fast post-mortem debugging.
6. Reusable Authentication State:
   - Authenticate once in a global setup step and save storage state (`storageState: 'auth.json'`) to avoid logging in via UI in every single test.

## Constraints / Rules
- Never write `page.waitForTimeout()` in Playwright tests.
- Never place assertions inside Page Object classes; keep Page Objects focused on actions and locators.
- Avoid broad XPath selectors (`//div[2]/span[3]/button`).

## Workflow
1. Create Page Object classes defining locators and action methods.
2. Configure `playwright.config.ts` with cross-browser matrix (Chromium, Firefox, WebKit) and trace recording.
3. Write test specifications importing Page Objects.
4. Apply network route intercepts for external APIs.
5. Run tests via `npx playwright test` and inspect traces via `npx playwright show-trace`.

## Expected Output
Modular Playwright test suite featuring Page Object Models, web-first assertions, route mocking, and failure trace capture.

## Validation Checklist
- [ ] Are Page Object Models used to encapsulate UI selectors and interactions?
- [ ] Are web-first assertions (`expect(locator).toBeVisible()`) used exclusively?
- [ ] Are arbitrary timeouts completely eliminated?
- [ ] Is authentication state reused across tests to optimize execution speed?
- [ ] Is trace capture configured on test failure?

## Common Mistakes & Antipatterns
- Using `expect(await locator.isVisible()).toBe(true)`, which checks visibility once synchronously without auto-waiting, causing flaky race conditions.
- Putting `expect()` statements inside Page Object methods, coupling page structure to specific test assertions.
- Re-executing the full UI login form in every single test file instead of reusing Playwright `storageState`.

## Concrete Real-World Example
Scenario: An analytics dashboard test suite takes 15 minutes to run and fails randomly when the backend data warehouse query takes longer than 2 seconds.
Prompt: Optimize this Playwright test suite using Page Object Models and network route mocking.
Application: The AI creates `AnalyticsPage` with `getByRole` locators, intercepts `/api/analytics` via `page.route` to return instant mocked metrics, saves 5 seconds per test by reusing authenticated storage state, and reduces suite execution time to 45 seconds with 100% stability.
