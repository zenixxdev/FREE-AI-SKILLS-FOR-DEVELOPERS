---
name: "signals-standalone-components"
description: "Architecting enterprise Angular applications using Standalone Components, reactive Signals, inject-based dependency injection, and OnPush change detection."
category: "frontend"
subcategory: "angular"
language: "typescript"
framework: "angular"
technology: "angular"
difficulty: "advanced"
tags: ["frontend", "angular", "signals", "standalone-components", "inject", "onpush"]
---

# Modern Angular Architecture with Standalone Components and Signals

## Purpose
Instruct AI agents to author modern, performant Angular applications (v16+) leveraging fine-grained reactivity with Signals and eliminating unnecessary NgModules.

## When to Use
Use when creating new Angular features, modernizing legacy NgModule architectures, or optimizing change detection performance.

## Inputs / Context
Feature specifications, routing needs, state model, and API service dependencies.

## Instructions
1. Declare all components, directives, and pipes as standalone (`standalone: true`); eliminate `NgModule` dependencies.
2. Manage reactive state using Angular Signals (`signal()`, `computed()`, and `effect()`) for fine-grained, glitch-free reactivity.
3. Configure change detection strategy to `ChangeDetectionStrategy.OnPush` on all components.
4. Use the functional `inject(Service)` function for dependency injection in constructors and field initializers instead of bloated constructor parameter lists.
5. Utilize the new control flow syntax (`@if`, `@for`, `@switch`) in templates, replacing legacy structural directives (`*ngIf`, `*ngFor`).
6. Always supply a unique `track` expression in `@for` loops (e.g., `@for (item of items(); track item.id)`).
7. Interoperate between RxJS observables and Signals using `toSignal()` and `toObservable()` from `@angular/core/rxjs-interop`.
8. Enforce strong input and output typing using `input()` and `output()` signal-based APIs.

## Constraints / Rules
- Never leave components on `ChangeDetectionStrategy.Default` in enterprise applications.
- Never write side-effects or state mutations inside `computed()` signals; computations must remain pure.
- Avoid manual RxJS `.subscribe()` calls in components; use `toSignal()` or the `async` pipe.

## Workflow
1. Define component as `standalone: true` with required imports listed directly.
2. Set `changeDetection: ChangeDetectionStrategy.OnPush`.
3. Declare reactive state using `signal()` and derived values via `computed()`.
4. Inject services using `inject()`.
5. Author templates using built-in control flow (`@if`, `@for`).

## Expected Output
Modern, standalone Angular component implementation with signal-based reactivity, inject() DI, and zero NgModule boilerplate.

## Validation Checklist
- [ ] Is `standalone: true` set on all components and pipes?
- [ ] Is `ChangeDetectionStrategy.OnPush` configured?
- [ ] Are templates using modern `@if` and `@for` control flow with tracking?
- [ ] Are services injected via `inject()` rather than constructor parameters?
- [ ] Are RxJS observables converted to signals with automatic unsubscription?

## Common Mistakes & Antipatterns
- Mutating signal objects directly: `mySignal().push(item)` instead of calling `mySignal.update(items => [...items, item])`.
- Omitting the `track` expression in `@for` loops, degrading list rendering performance.
- Subscribing to observables manually in `ngOnInit` and forgetting to unsubscribe in `ngOnDestroy`.

## Concrete Real-World Example
Scenario: An old Angular component using complex `ChangeDetectorRef.markForCheck()`, `*ngFor`, and multiple manual RxJS subscriptions causing memory leaks.
Prompt: Modernize this Angular product list component using Standalone Components and Angular Signals.
Application: The AI converts the component to standalone, replaces constructor DI with `inject(ProductService)`, converts RxJS streams to signals using `toSignal()`, migrates templates to `@for (product of products(); track product.id)`, and removes manual subscriptions.
