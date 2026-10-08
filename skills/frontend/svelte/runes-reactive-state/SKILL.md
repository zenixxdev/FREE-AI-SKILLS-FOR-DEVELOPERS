---
name: "runes-reactive-state"
description: "Building Svelte 5 web applications leveraging modern Runes ($state, $derived, $effect), typed component props, and reusable snippet blocks."
category: "frontend"
subcategory: "svelte"
language: "typescript"
framework: "svelte"
technology: "svelte5"
difficulty: "intermediate"
tags: ["frontend", "svelte", "svelte5", "runes", "snippets", "reactivity"]
---

# Svelte 5 Architecture with Runes and Snippets

## Purpose
Instruct AI agents in authoring clean, idiomatic Svelte 5 applications utilizing explicit universal reactivity with Runes instead of legacy Svelte 3/4 syntax.

## When to Use
Use when creating Svelte 5 components, refactoring legacy `let` and `$:` reactive declarations, or building flexible snippet-based UI components.

## Inputs / Context
Component mockups, reactive state requirements, prop types, and event bindings.

## Instructions
1. Declare reactive state using the `$state()` rune instead of legacy `let` declarations.
2. Declare derived values using the `$derived()` and `$derived.by()` runes instead of legacy `$:` reactive declarations.
3. Manage side-effects using the `$effect()` rune, ensuring cleanup functions are returned where needed.
4. Define component props and defaults using the `$props()` rune with strict TypeScript interfaces.
5. Use Svelte 5 `{#snippet name(params)}...{/snippet}` and `{@render name(args)}` blocks for reusable template slots and composition.
6. Manage deeply nested reactive objects or fine-grained arrays using `$state()` with automatic deep proxy tracking.
7. Use `$bindable()` inside `$props()` when two-way property binding (`bind:value`) is explicitly required by parent consumers.
8. Encapsulate shared cross-component state inside plain TypeScript `.svelte.ts` files using universal Runes.

## Constraints / Rules
- Do not use legacy Svelte 3/4 syntax (`$: double = count * 2`, `export let count`) in Svelte 5 codebases.
- Avoid performing side-effects inside `$derived()` computations.
- Never call `$effect()` during server-side rendering (SSR); `$effect` runs strictly in browser environments.

## Workflow
1. Define component prop interface and destructure using `$props()`.
2. Initialize internal state variables with `$state()`.
3. Compute derived state with `$derived()`.
4. Compose UI blocks using snippets and render tags.
5. Add browser side-effects in `$effect()` with teardown logic.

## Expected Output
Clean Svelte 5 component (`.svelte`) utilizing runes, snippet composition, and complete TypeScript typing.

## Validation Checklist
- [ ] Are all reactive variables declared with `$state()`?
- [ ] Are derived values computed using `$derived()`?
- [ ] Are props declared via `let { ... } = $props<Props>()`?
- [ ] Are reusable template fragments modeled with `{#snippet}` and `{@render}`?
- [ ] Is cross-file reactive state placed in `.svelte.ts` files?

## Common Mistakes & Antipatterns
- Mixing legacy `$:` reactivity syntax with Svelte 5 runes, causing compiler errors.
- Forgetting that `$state()` proxies deep mutations, attempting to create unnecessary shallow copies.
- Using `$effect` for state transformations that could be declared purely via `$derived`.

## Concrete Real-World Example
Scenario: Refactoring a Svelte 4 shopping cart component that uses multiple `$:` statements and `<slot>` projections into Svelte 5.
Prompt: Convert this Svelte 4 cart component to Svelte 5 Runes and Snippets.
Application: The AI rewrites `export let items` into `let { items = $bindable([]) } = $props<CartProps>()`, replaces `$:` calculations with `$derived(items.reduce(...))`, and replaces legacy `<slot name="item">` with a typed snippet rendered via `{@render itemSnippet(item)}`.
