---
name: "component-architecture"
description: "Building modular, high-performance React components utilizing Compound Components, custom hooks, proper state collocation, and clean dependency management."
category: "frontend"
subcategory: "react"
language: "typescript"
framework: "react"
technology: "react"
difficulty: "intermediate"
tags: ["frontend", "react", "hooks", "compound-components", "state-collocation", "architecture"]
---

# React Component Architecture and Clean State Composition

## Purpose
Provide concrete guidelines for authoring reusable, maintainable React components that avoid prop drilling, unnecessary re-renders, and brittle lifecycle synchronization.

## When to Use
Use when creating reusable design system components (selects, accordions, dialogs), building complex interactive forms, or modularizing bloated monolith components.

## Inputs / Context
Component specification, visual design, user interaction requirements, and shared application context.

## Instructions
1. Structure complex interactive UI using the Compound Component pattern (e.g., `<Select>`, `<Select.Trigger>`, `<Select.List>`, `<Select.Option>`) sharing state via Context.
2. Collocate state: keep state as close as possible to the components that consume it. Do not hoist state to parent components unless multiple siblings require synchronization.
3. Extract reusable stateful logic into focused custom hooks (e.g., `useControllableState`, `useMediaQuery`, `useDebounce`).
4. Support both controlled and uncontrolled operation modes for form components via a unified value/defaultValue API.
5. Memoize callbacks (`useCallback`) and expensive calculations (`useMemo`) only when passing them to memoized children (`React.memo`) or as hook dependencies; avoid premature memoization of trivial operations.
6. Strictly separate container/logic hooks from presentational markup components.
7. Always clean up subscriptions, event listeners, and timers in `useEffect` return functions.
8. Treat props as immutable; never mutate arrays or objects directly when updating component state.

## Constraints / Rules
- Never use `useEffect` for data transformation that can be computed synchronously during render (`const fullName = firstName + ' ' + lastName`).
- Avoid prop drilling through more than two intermediate component layers; use Context or Component Composition (`children` prop).
- Do not suppress the `react-hooks/exhaustive-deps` ESLint rule without documented justification.

## Workflow
1. Determine component boundary and public API interface.
2. Implement internal Context for compound component coordination.
3. Extract interaction logic into a custom hook.
4. Build child subcomponents and assign them as static properties.
5. Verify keyboard navigation, accessibility attributes, and unmount cleanup.

## Expected Output
Clean TypeScript React component implementation supporting composition, custom styling, full accessibility, and zero redundant re-renders.

## Validation Checklist
- [ ] Can the component be composed flexibly using child compound components?
- [ ] Is state collocated to prevent unnecessary tree re-renders?
- [ ] Are all `useEffect` dependencies exhaustively declared?
- [ ] Is cleanup handled properly on component unmount?
- [ ] Does the component support both controlled and uncontrolled states?

## Common Mistakes & Antipatterns
- Using `useEffect` to synchronize state between props and internal state, causing double renders and race conditions.
- Hoisting all state into a global store (Redux/Zustand) when only a single component sub-tree requires it.
- Wrapping every single inline function in `useCallback` even when passing to standard DOM elements like `<button onClick={...}>`.

## Concrete Real-World Example
Scenario: A monolithic 800-line `<Modal>` component with 25 props that handles header, footer, body, confirmation steps, and styling variants in a rigid template.
Prompt: Refactor this monolithic modal component into a flexible Compound Component architecture.
Application: The AI defines `<Dialog>`, `<Dialog.Trigger>`, `<Dialog.Content>`, `<Dialog.Header>`, and `<Dialog.Close>`, coordinates open state and keyboard traps via `DialogContext`, and provides clean slot-based composition.
