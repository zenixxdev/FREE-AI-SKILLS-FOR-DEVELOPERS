---
name: "bloc-architecture-and-rendering"
description: "Architecting scalable Flutter apps using the Business Logic Component (BLoC) pattern, Equatable immutability, fine-grained BlocBuilder rebuilds, and const constructors."
category: "mobile"
subcategory: "flutter"
language: "dart"
framework: "flutter"
technology: "flutter-bloc"
difficulty: "advanced"
tags: ["mobile", "flutter", "dart", "bloc", "state-management", "performance", "const"]
---

# Flutter BLoC Architecture, Immutability, and Render Optimization

## Purpose
Instruct AI agents to author high-performance, testable Flutter applications using the BLoC pattern, eliminating unnecessary widget rebuilds and maintaining strict state immutability.

## When to Use
Use when architecting enterprise Flutter applications, managing complex state lifecycles, or optimizing laggy Flutter widget trees.

## Inputs / Context
Feature requirements, domain state model, BLoC events, API service dependencies, and widget hierarchy.

## Instructions
1. Structure State Management using BLoC (Business Logic Component):
   - Events (Inputs): Dispatched by the UI to request state changes (e.g., `LoadFeedEvent`).
   - States (Outputs): Emitted by the BLoC to represent UI state (e.g., `FeedLoadedState`).
   - BLoC: Pure business component mapping `(Event) -> Stream<State>`.
2. Ensure Complete State Immutability with `Equatable`:
   - All State and Event classes must extend `Equatable` and implement `props` to enable value-based equality checking.
   - Never mutate state objects in place; emit new copies using `.copyWith()`.
3. Granular Widget Rebuilding:
   - Use `BlocBuilder` with `buildWhen: (previous, current) => previous.attribute != current.attribute` to prevent rebuilding entire screens when only a single property changes.
   - Use `BlocListener` with `listenWhen` for one-time side-effects (displaying SnackBar, navigating, showing dialogs); never perform navigation inside a `BlocBuilder`.
4. Maximize Use of `const` Constructors:
   - Add `const` to all static widgets and subtrees; Flutter skips re-allocating and rebuilding `const` widgets entirely during build passes.
5. Provide BLoCs Scoped via `BlocProvider`:
   - Scope BLoC instances only to the widget subtrees that require them; close/dispose BLoC streams automatically via `BlocProvider`.
6. Repaint Boundaries for Heavy Animations:
   - Wrap frequently repainting widgets in `RepaintBoundary` to isolate canvas repainting from the rest of the screen.

## Constraints / Rules
- Never execute navigation or display SnackBars inside `BlocBuilder`; use `BlocListener`.
- Avoid calling `setState()` inside large StatefulWidget trees when BLoC is managing state.
- Do not omit `const` constructors on immutable widget declarations.

## Workflow
1. Define BLoC Events and States extending `Equatable`.
2. Implement BLoC class with event handlers (`on<Event>((event, emit) => ...)`).
3. Inject BLoC via `BlocProvider`.
4. Build UI with scoped `BlocBuilder` and `buildWhen` filters.
5. Author unit tests using `bloc_test` verifying emitted state streams.

## Expected Output
Clean Flutter BLoC implementation with Equatable states, granular `BlocBuilder` rebuild scoping, and `bloc_test` unit coverage.

## Validation Checklist
- [ ] Do all state and event classes extend `Equatable`?
- [ ] Is `buildWhen` configured on `BlocBuilder` to prevent full-screen rebuilds?
- [ ] Are one-off side effects handled via `BlocListener`?
- [ ] Are `const` constructors applied to all immutable widgets?
- [ ] Are BLoCs unit-tested using the `bloc_test` library?

## Common Mistakes & Antipatterns
- Navigating to a new route inside `BlocBuilder`, causing navigation to trigger multiple times whenever the widget tree rebuilds.
- Forgetting to extend `Equatable` in States, causing BLoC to emit states that Flutter considers identical by reference, failing to trigger UI updates.
- Wrapping the entire `Scaffold` in a single `BlocBuilder`, causing the entire screen including app bars and tabs to redraw on minor state changes.

## Concrete Real-World Example
Scenario: A Flutter crypto portfolio app lags during scrolling because real-time price updates cause the entire screen, including navigation drawers and headers, to rebuild 10 times per second.
Prompt: Optimize this Flutter portfolio screen using BLoC fine-grained rebuilds and const constructors.
Application: The AI splits the monolithic screen into modular child widgets, isolates price tickers inside localized `BlocBuilder<CryptoBloc, CryptoState>(buildWhen: ...)`, adds `const` to headers and scaffold elements, and routes alert dialogs through a `BlocListener`, restoring 60 FPS scrolling.
