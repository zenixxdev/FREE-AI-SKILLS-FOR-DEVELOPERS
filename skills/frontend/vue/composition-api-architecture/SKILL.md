---
name: "composition-api-architecture"
description: "Developing robust Vue 3 applications utilizing `<script setup>`, TypeScript, composables, provide/inject dependency injection, and Pinia store modules."
category: "frontend"
subcategory: "vue"
language: "typescript"
framework: "vue"
technology: "vue3"
difficulty: "intermediate"
tags: ["frontend", "vue", "vue3", "composition-api", "pinia", "composables"]
---

# Vue 3 Composition API and Pinia Store Architecture

## Purpose
Provide standard guidelines for engineering scalable Vue 3 applications using single-file components with script setup, modular composables, and type-safe state stores.

## When to Use
Use when developing Vue 3 enterprise applications, refactoring Vue 2 Options API code, or building reusable composables.

## Inputs / Context
Component wireframe, state requirements, reactivity dependencies, and API integration specifications.

## Instructions
1. Standardize on Single File Components (SFC) with `<script setup lang="ts">`.
2. Define typed props and emits using `defineProps<Props>()` and `defineEmits<Emits>()` compiler macros.
3. Structure shared stateful logic into focused composables (e.g., `useFetch`, `useWindowScroll`) named with the `use` prefix, returning explicit reactive refs and functions.
4. Use `ref()` for primitive values and arrays; use `reactive()` only when grouping cohesive object properties that are never destructured directly.
5. Use `toRefs()` or `toRef()` when destructuring reactive objects or props to maintain reactivity.
6. Manage global application state using Pinia setup stores (`defineStore('id', () => { ... })`) rather than legacy Options API stores.
7. Use `watchEffect()` for reactive side effects and `watch()` with explicit source getters (`() => state.property`) for granular change detection.
8. Avoid deep component prop drilling by utilizing Vue's typed `provide` and `inject` with `InjectionKey<T>` symbols.

## Constraints / Rules
- Never destructure props directly inside `<script setup>` without `toRefs` or the reactivity transform compiler macro, as this loses reactivity.
- Avoid mutating props directly inside child components; always emit events to parent owners.
- Do not mix legacy Options API (`data`, `methods`, `computed`) with Composition API in the same component.

## Workflow
1. Declare component interface with typed props, emits, and slots.
2. Implement reactive local state using `ref` and `computed`.
3. Extract reusable state logic into external composable functions.
4. Connect shared domain state via Pinia setup stores.
5. Verify template reactivity and lifecycle cleanup (`onUnmounted`).

## Expected Output
Clean Vue 3 SFC with `<script setup lang="ts">`, typed compiler macros, extracted composables, and strict Pinia store integration.

## Validation Checklist
- [ ] Are props and emits typed using TypeScript interfaces in `defineProps` and `defineEmits`?
- [ ] Is reactivity preserved when destructuring reactive objects?
- [ ] Are global stores implemented using Pinia setup store syntax?
- [ ] Are event listeners and timers cleaned up inside `onUnmounted`?
- [ ] Are provide/inject keys typed using `InjectionKey<T>`?

## Common Mistakes & Antipatterns
- Destructuring props: `const { count } = defineProps<{ count: number }>()`, breaking Vue's reactive tracking.
- Mutating Pinia store state directly in components without calling store actions for complex business transitions.
- Using `ref` where `computed` is appropriate, resulting in manual synchronization bugs.

## Concrete Real-World Example
Scenario: A large Vue 2 Options API user profile editor with scattered `watch` and `methods` declarations that is hard to test and maintain.
Prompt: Refactor this Options API profile component into Vue 3 `<script setup lang="ts">` with a custom `useProfileForm` composable.
Application: The AI creates a type-safe composable handling validation, change tracking, and API sync, rewrites the component using `<script setup>`, and declares typed props and emits.
