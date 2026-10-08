---
name: "design-token-system"
description: "Architecting a multi-tier design token hierarchy (global, semantic, component-level) supporting dark mode, high contrast, and design system scalability."
category: "ui"
subcategory: "general"
language: "css"
framework: "none"
technology: "design-tokens"
difficulty: "intermediate"
tags: ["design-tokens", "css-variables", "theming", "design-systems", "ui"]
---

# Design Token Architecture and Theming

## Purpose
Establish a robust, maintainable design token pipeline that translates raw brand values into semantic tokens and component variables across web and mobile platforms.

## When to Use
Use when establishing a new frontend architecture, refactoring hardcoded CSS hex colors and magic numbers, or implementing multi-theme support.

## Inputs / Context
Brand color palette, typography scale, spacing unit (e.g., 4px/8px grid), elevation/shadow scales, and theme requirements.

## Instructions
1. Define a three-tier token hierarchy:
   - Tier 1 (Global/Primitive): Raw values (e.g., `--color-blue-500: #3b82f6`).
   - Tier 2 (Semantic): Contextual intent (e.g., `--color-action-primary: var(--color-blue-500)`).
   - Tier 3 (Component): Scoped usage (e.g., `--button-primary-bg: var(--color-action-primary)`).
2. Store primitive tokens in a root configuration file or `:root` pseudo-class.
3. Define theme variations (e.g., `[data-theme='dark']`, `@media (prefers-color-scheme: dark)`) by reassigning Tier 2 semantic tokens only; primitives remain immutable.
4. Establish an 8pt spatial grid scale for layout margins, paddings, and component sizes (4px, 8px, 12px, 16px, 24px, 32px, 48px, 64px).
5. Document contrast ratios for all foreground/background semantic pairs to guarantee WCAG AA (>= 4.5:1) compliance.
6. Provide fallbacks in CSS custom property usage where legacy browser compatibility is required.

## Constraints / Rules
- Never reference primitive tokens directly inside component style rules; always route through semantic tokens.
- Never hardcode hexadecimal or RGB color strings inside individual component styling files.
- Avoid introducing arbitrary pixel values that break the spatial grid scale.

## Workflow
1. Audit existing stylesheets for duplicate hex colors, arbitrary margins, and font sizes.
2. Group extracted primitives into color, typography, spacing, radius, and elevation tokens.
3. Map primitives into semantic roles: surface, on-surface, action, feedback (success, warning, error, info).
4. Build the light and dark semantic token maps.
5. Migrate component styles to consume semantic tokens and verify seamless theme transitions.

## Expected Output
Structured CSS custom properties or token JSON definitions partitioned into Primitive and Semantic layers, with complete light/dark theme parity.

## Validation Checklist
- [ ] Are all component styles consuming semantic tokens instead of primitives?
- [ ] Do semantic tokens support both light and dark themes without editing component CSS?
- [ ] Are spatial values aligned to an 8pt or 4pt scale?
- [ ] Does every text/background token combination meet WCAG AA contrast standards?
- [ ] Is there zero hardcoded color leakage in component stylesheets?

## Common Mistakes & Antipatterns
- Creating semantic tokens that specify visual appearance rather than semantic intent (e.g., `--color-dark-gray` instead of `--color-surface-subtle`).
- Over-tokenizing single-use values that do not belong to the design system.
- Inverting primitive values directly in dark mode instead of redefining semantic mappings.

## Concrete Real-World Example
Scenario: A web app where dark mode was hacked with `filter: invert(1)` causing images and colors to distort.
Prompt: Re-architect the application styling into a 3-tier CSS custom property token system supporting clean light and dark modes.
Application: The AI creates primitive variables (`--blue-600`, `--slate-900`, etc.), semantic variables (`--bg-surface`, `--text-primary`, `--border-default`), maps them under `:root` and `[data-theme='dark']`, and rewrites the card component to use `var(--bg-surface)` and `var(--text-primary)`.
