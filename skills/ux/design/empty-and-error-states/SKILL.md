---
name: "empty-and-error-states"
description: "Design and implementation guidelines for informative empty states, graceful error boundaries, resilient recovery actions, and skeleton loading states."
category: "ux"
subcategory: "design"
language: "agnostic"
framework: "none"
technology: "ux-patterns"
difficulty: "beginner"
tags: ["ux", "empty-states", "error-handling", "skeletons", "recovery"]
---

# Comprehensive Empty, Loading, and Error State UX

## Purpose
Ensure software interfaces provide clear, empathetic, and actionable guidance during non-ideal application states (no data, pending requests, server failures, and partial outages).

## When to Use
Use when building data-driven views, list tables, search result pages, dashboard widgets, or network-dependent views.

## Inputs / Context
Target component or view, possible data states (first-time empty, search empty, filtered empty, network error, permission denied, partial data).

## Instructions
1. Differentiate between First-Time Empty (user has not created items yet) and Cleared/Filtered Empty (filters returned 0 results).
2. For First-Time Empty states, provide:
   - Clear contextual illustration or icon.
   - Explanatory heading and value proposition description.
   - Primary Call to Action (CTA) button directly launching creation.
3. For Filtered/Search Empty states, provide an immediate one-click 'Clear All Filters' action.
4. Replace blank loading screens and full-page spinners with structural skeleton loaders mirroring the expected content layout.
5. Error messages must follow the 3-part rule:
   - What happened (plain language, no unformatted stack traces or raw HTTP status codes).
   - Why it happened (contextual reason if known).
   - How to recover (retry button, alternative action, or support contact).
6. Implement optimistic UI updates with automatic rollback and non-blocking toast notifications on failure.

## Constraints / Rules
- Never show an empty, blank screen or an endless spinner with no timeout.
- Never display raw database errors, SQL queries, or internal stack traces to end-users in production.
- Do not disable user navigation when a sub-component encounters an error.

## Workflow
1. Identify all asynchronous boundaries within the component.
2. Define UI templates for: Initial Loading, Refreshing, No Data, No Search Matches, Network Error, and Authorization Error.
3. Implement localized Error Boundaries so an error in one card does not crash the entire application.
4. Add deterministic retry mechanisms with exponential backoff for transient failures.
5. Test behavior under simulated offline mode and 3G network conditions.

## Expected Output
Complete UI component specification or code implementing stateful branching for Loading, Empty, Error, and Populated states with action callbacks.

## Validation Checklist
- [ ] Is there an actionable CTA in first-time empty states?
- [ ] Can users reset filters with a single click on search empty states?
- [ ] Do error states clearly explain what went wrong and how to recover?
- [ ] Are skeleton loaders proportional to actual rendered content?
- [ ] Are errors contained within local boundaries without crashing parent views?

## Common Mistakes & Antipatterns
- Showing 'No items found' without giving the user a way to create an item.
- Displaying 'Something went wrong. Error 500' without a retry button or contact path.
- Using generic full-screen spinners that cause severe layout shift when content resolves.

## Concrete Real-World Example
Scenario: A customer dashboard project table crashes into a blank white screen when an API call times out.
Prompt: Refactor this project list view to handle loading, empty, and network error states gracefully.
Application: The AI implements a skeleton table with 5 animated placeholder rows during fetch, an empty illustration with a 'Create First Project' primary button when length is 0, and an inline error card with an exponential backoff 'Retry' button when HTTP 504 occurs.
