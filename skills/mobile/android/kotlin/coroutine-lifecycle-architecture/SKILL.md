---
name: "coroutine-lifecycle-architecture"
description: "Architecting modern Android apps in Kotlin using structured concurrency, viewModelScope, StateFlow, lifecycle-aware collection with repeatOnLifecycle, and safe dispatchers."
category: "mobile"
subcategory: "android/kotlin"
language: "kotlin"
framework: "android"
technology: "kotlin-coroutines"
difficulty: "advanced"
tags: ["mobile", "android", "kotlin", "coroutines", "stateflow", "lifecycle", "architecture"]
---

# Android Kotlin Coroutines, StateFlow, and Lifecycle Scopes

## Purpose
Instruct AI agents to author leak-free, lifecycle-aware Android applications in Kotlin leveraging structured concurrency and reactive StateFlow.

## When to Use
Use when building modern Android applications, asynchronous data loaders, network clients, Room database queries, or UI state management.

## Inputs / Context
UI state model, asynchronous repository calls, Android ViewModel, Activity/Fragment lifecycle, and error boundaries.

## Instructions
1. Practice Structured Concurrency:
   - Always launch coroutines inside appropriate lifecycle scopes: use `viewModelScope` inside ViewModels; never use `GlobalScope`.
   - Ensure child coroutine cancellations propagate cleanly without leaking background operations.
2. Expose UI State via `StateFlow`:
   - Keep mutable state private within the ViewModel (`private val _uiState = MutableStateFlow<UiState>(UiState.Initial)`).
   - Expose read-only state to the UI layer (`val uiState: StateFlow<UiState> = _uiState.asStateFlow()`).
3. Safe Lifecycle-Aware Flow Collection in UI:
   - In Activities/Fragments, always collect flows using `lifecycleScope.launch { repeatOnLifecycle(Lifecycle.State.STARTED) { uiState.collect { ... } } }`.
   - In Jetpack Compose, use `collectAsStateWithLifecycle()` to safely pause collection when the app is in the background.
4. Select the Right Dispatcher:
   - `Dispatchers.Main`: UI updates, small quick operations.
   - `Dispatchers.IO`: Disk reads/writes, network requests, database transactions.
   - `Dispatchers.Default`: CPU-intensive computations (JSON parsing, sorting, image processing).
   - Use `withContext(Dispatchers.IO)` inside repository methods to ensure suspend functions are main-safe.
5. Handle Exceptions with `CoroutineExceptionHandler` and `runCatching`:
   - Catch domain exceptions gracefully and emit error UI states rather than crashing the process.

## Constraints / Rules
- Never use `GlobalScope.launch` in Android applications.
- Never collect flows in the UI using standard `lifecycleScope.launch` without `repeatOnLifecycle`, as this keeps collecting in the background and drains battery.
- Never perform blocking I/O calls on `Dispatchers.Main`.

## Workflow
1. Define sealed interface representing UI State (`Loading`, `Success`, `Error`).
2. Implement ViewModel with `MutableStateFlow` and `asStateFlow()`.
3. Launch repository calls within `viewModelScope` with `withContext(Dispatchers.IO)`.
4. Collect state in UI using `repeatOnLifecycle(Lifecycle.State.STARTED)`.
5. Write unit tests using `runTest` and `StandardTestDispatcher`.

## Expected Output
Clean Kotlin ViewModel and UI integration code featuring StateFlow, main-safe suspend functions, and lifecycle-aware collection.

## Validation Checklist
- [ ] Is `viewModelScope` utilized for launching ViewModel coroutines?
- [ ] Is UI state exposed as read-only `StateFlow`?
- [ ] Is `repeatOnLifecycle` or `collectAsStateWithLifecycle` used for UI collection?
- [ ] Are suspend functions main-safe via `withContext(Dispatchers.IO)`?
- [ ] Are coroutines tested using `runTest`?

## Common Mistakes & Antipatterns
- Using `GlobalScope.launch`, causing network requests to continue running even after the user has permanently closed the Activity.
- Collecting flows with a raw `lifecycleScope.launch`, causing UI updates and database queries to run silently while the phone is locked.
- Executing database queries directly on `Dispatchers.Main`, triggering Android Application Not Responding (ANR) dialogs.

## Concrete Real-World Example
Scenario: An Android weather app continues querying GPS and downloading data in the background after the user presses the home button, wasting battery and crashing on UI updates.
Prompt: Refactor this weather screen coroutine collection to be lifecycle-safe using StateFlow and repeatOnLifecycle.
Application: The AI converts LiveData to `StateFlow` in the `WeatherViewModel`, launches repository calls on `viewModelScope`, and collects state in the Activity inside `repeatOnLifecycle(Lifecycle.State.STARTED)`, automatically pausing collection when the screen is hidden.
