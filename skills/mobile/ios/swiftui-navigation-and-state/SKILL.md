---
name: "swiftui-navigation-and-state"
description: "Architecting modern iOS applications using SwiftUI, the Swift 5.9+ `@Observable` macro, type-safe `NavigationStack`, and actor-isolated Swift concurrency."
category: "mobile"
subcategory: "ios"
language: "swift"
framework: "swiftui"
technology: "ios-swift"
difficulty: "advanced"
tags: ["mobile", "ios", "swift", "swiftui", "navigationstack", "observable", "actors"]
---

# SwiftUI NavigationStack Architecture and Observation Framework

## Purpose
Instruct AI agents to author clean, modern iOS applications in SwiftUI leveraging the `@Observable` macro, type-safe programmatic navigation, and structured Swift concurrency.

## When to Use
Use when building modern iOS applications (iOS 16/17+), designing SwiftUI views, managing app navigation, or integrating Swift Concurrency (`async/await`, `actor`).

## Inputs / Context
View mockups, state models, navigation route graph, and async network repositories.

## Instructions
1. Manage State using the Modern `@Observable` Macro (Swift 5.9 / iOS 17+):
   - Replace legacy `ObservableObject` and `@Published` with the `@Observable` macro on model classes.
   - In Views, declare models using `@State var model = Model()` (for owned instances) or pass directly via environment (`@Environment(Model.self)`).
   - `@Observable` performs fine-grained tracking: views only invalidate and redraw when the specific properties they access actually change.
2. Implement Type-Safe Programmatic Navigation using `NavigationStack`:
   - Replace deprecated `NavigationLink(destination:)` with `NavigationStack(path: $navPath)`.
   - Model all application destinations as a Hashable enum (`enum AppRoute: Hashable`).
   - Use `.navigationDestination(for: AppRoute.self) { route in ... }` to decouple link triggers from destination views.
3. Swift Concurrency and Actor Isolation:
   - Mark UI-bound ViewModels with `@MainActor` to guarantee state mutations occur on the main thread.
   - Use `.task { await loadData() }` on views to launch asynchronous work automatically tied to the view's lifecycle (auto-cancelled on view disappearance).
   - Isolate shared mutable data in background tasks using `actor` types.
4. Support Dynamic Type and Accessibility:
   - Use semantic typography (`.font(.headline)`, `.font(.body)`) so text scales with the user's system Dynamic Type preferences.
   - Add `.accessibilityElement(children: .combine)` and accessibility labels.

## Constraints / Rules
- Never use the deprecated `NavigationView` in iOS 16+ codebases; always use `NavigationStack`.
- Never execute background network calls without `@MainActor` boundary synchronization when updating UI state.
- Avoid passing massive objects via `@Binding`; use `@Observable` models.

## Workflow
1. Define `@Observable` ViewModel with `@MainActor` isolation.
2. Define `AppRoute` enum conforming to `Hashable`.
3. Construct `NavigationStack(path: $path)` with `.navigationDestination`.
4. Fetch data using the `.task` view modifier.
5. Verify Dynamic Type scaling and dark mode theme transitions.

## Expected Output
Idiomatic SwiftUI code featuring the `@Observable` macro, type-safe `NavigationStack`, `@MainActor` concurrency, and complete accessibility support.

## Validation Checklist
- [ ] Is `@Observable` used instead of legacy `ObservableObject`?
- [ ] Is navigation handled programmatically via `NavigationStack` and Hashable routes?
- [ ] Are ViewModels annotated with `@MainActor`?
- [ ] Is asynchronous work launched via `.task` with auto-cancellation?
- [ ] Does text scale dynamically with iOS system font size settings?

## Common Mistakes & Antipatterns
- Using deprecated `NavigationLink(destination: DetailView())` which initializes the destination view immediately on parent render, causing premature data fetching.
- Updating UI state from background threads without `@MainActor`, triggering Xcode runtime concurrency warnings.
- Using `DispatchQueue.main.async` in modern Swift instead of idiomatic `async/await` and `@MainActor`.

## Concrete Real-World Example
Scenario: An iOS app crashes and experiences memory leaks due to legacy `NavigationView` nested links and manual background thread dispatches.
Prompt: Modernize this iOS settings screen to use SwiftUI NavigationStack and the Swift 5.9 `@Observable` macro.
Application: The AI creates an `@Observable @MainActor class SettingsViewModel`, models routes via `enum SettingsRoute: Hashable`, constructs a `NavigationStack(path: $path)` with decoupled `.navigationDestination`, loads preferences in `.task`, and binds controls to observable properties.
