---
name: "declarative-ui-state"
description: "Architecting performant Android UIs with Jetpack Compose using unidirectional data flow (UDF), stable types, recomposition optimization, and derivedStateOf."
category: "mobile"
subcategory: "android/jetpack-compose"
language: "kotlin"
framework: "jetpack-compose"
technology: "android-compose"
difficulty: "advanced"
tags: ["mobile", "android", "jetpack-compose", "recomposition", "udf", "stable-types"]
---

# Jetpack Compose Declarative UI Architecture and Recomposition

## Purpose
Instruct AI agents to author idiomatic Jetpack Compose user interfaces that adhere to Unidirectional Data Flow, avoid unnecessary recompositions, and deliver 60/120 FPS performance.

## When to Use
Use when creating Android screen layouts, design system components, interactive animations, or refactoring XML layouts to Jetpack Compose.

## Inputs / Context
Screen state model, user interaction events, design tokens, and Compose theme configuration.

## Instructions
1. Adhere to Unidirectional Data Flow (UDF):
   - State flows DOWN: Pass immutable data models into composable functions.
   - Events flow UP: Pass lambda event handlers (`onItemClicked: (Id) -> Unit`) up to the ViewModel; composables should not mutate state directly.
2. Hoist State Cleanly:
   - Make composables stateless whenever possible by hoisting state to the caller or ViewModel to maximize reusability and testability.
3. Optimize Recomposition Performance:
   - Use `remember` with keys to cache expensive calculations across recompositions.
   - Use `derivedStateOf` when reading high-frequency state (e.g., scroll position) to only trigger recomposition when a calculated threshold changes.
   - Annotate domain models with `@Immutable` or `@Stable` when passing external types to ensure the Compose compiler treats them as stable.
4. Pass Lambdas without Unnecessary Recomposition:
   - Avoid creating new lambda allocations inside parameter lists during recomposition; pass method references or remember lambdas.
5. Lazy Lists Optimization:
   - Always provide a stable, unique `key` parameter to items in `LazyColumn` and `LazyRow` (e.g., `items(list, key = { it.id })`).
   - Use `contentType` to help Compose reuse view compositions across similar items.
6. Support Material 3 Theming and Dynamic Color:
   - Consume values through `MaterialTheme.colorScheme` and `MaterialTheme.typography`.

## Constraints / Rules
- Never write side-effects (like logging, network requests, or database writes) directly in the body of a composable; wrap them in `LaunchedEffect` or `SideEffect`.
- Never mutate state variables directly without Compose state holders (`mutableStateOf`).
- Do not pass unstable collections (like raw `List<T>`) into composables without `@Immutable` wrappers if avoiding recomposition is critical.

## Workflow
1. Define immutable UI State sealed class.
2. Structure screen composable consuming `StateFlow` via `collectAsStateWithLifecycle()`.
3. Create stateless child composables receiving data and event lambdas.
4. Provide unique keys on `LazyColumn` items.
5. Audit recomposition counts using the Android Studio Layout Inspector.

## Expected Output
Clean Jetpack Compose UI code with unidirectional state hoisting, stable types, `derivedStateOf` optimizations, and zero side-effect leakage.

## Validation Checklist
- [ ] Does the UI follow Unidirectional Data Flow (state down, events up)?
- [ ] Are unique keys provided for all `LazyColumn` and `LazyRow` items?
- [ ] Are high-frequency scroll states wrapped in `derivedStateOf`?
- [ ] Are side effects encapsulated inside `LaunchedEffect`?
- [ ] Does Layout Inspector verify that unaffected composables skip recomposition?

## Common Mistakes & Antipatterns
- Reading scroll position directly in a top-level composable without `derivedStateOf`, causing the entire screen to recompose on every single pixel of scrolling.
- Omitting `key` in `LazyColumn`, causing Compose to recreate all list items when an item is inserted or deleted.
- Triggering an API call directly in the composable body, causing an infinite loop of network calls on every recomposition.

## Concrete Real-World Example
Scenario: A social media feed in Jetpack Compose stutters during scrolling because the entire feed recomposes every time the user scrolls 1 pixel to check if the 'Scroll to Top' button should appear.
Prompt: Optimize this Jetpack Compose feed layout to eliminate unnecessary recompositions.
Application: The AI wraps the scroll calculation in `val showButton by remember { derivedStateOf { listState.firstVisibleItemIndex > 0 } }`, assigns unique keys to `LazyColumn` items, and isolates the button rendering, eliminating 99% of recompositions during scroll.
