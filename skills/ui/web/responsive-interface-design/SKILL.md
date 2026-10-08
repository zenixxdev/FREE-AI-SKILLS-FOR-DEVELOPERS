---
name: "responsive-interface-design"
description: "Systematic design and implementation of fluid, responsive web interfaces using modern CSS layouts, fluid typography, and viewport-aware container queries."
category: "ui"
subcategory: "web"
language: "css"
framework: "none"
technology: "css-grid-flexbox"
difficulty: "intermediate"
tags: ["ui", "css", "responsive", "container-queries", "fluid-design", "mobile-first"]
---

# Responsive Interface Design

## Purpose
Provide concrete, deterministic instructions for generating responsive, accessible layouts that adapt smoothly across arbitrary device viewports without layout shifts or horizontal overflows.

## When to Use
Apply whenever implementing or refactoring layout components, dashboards, cards, or page shells that must support mobile, tablet, desktop, and ultra-wide displays.

## Inputs / Context
Existing wireframes, component design specifications, design tokens (breakpoints, spacing scale), and target viewport range (e.g., 320px to 2560px).

## Instructions
1. Adopt a strict mobile-first breakpoint strategy using `min-width` media queries (e.g., 640px, 768px, 1024px, 1280px, 1536px).
2. Use CSS Container Queries (`@container`) for self-contained components whose layout depends on parent container width rather than root viewport width.
3. Implement fluid typography and spacing scales using CSS `clamp()` (e.g., `font-size: clamp(1rem, 0.8rem + 1vw, 1.5rem)`).
4. Prevent horizontal layout overflow by ensuring all root containers maintain `max-width: 100%`, `overflow-wrap: break-word`, and `box-sizing: border-box`.
5. Use CSS Grid for two-dimensional page structure and Flexbox for one-dimensional content alignment and wrapping.
6. Verify touch targets on mobile viewports are at least 44x44 CSS pixels with sufficient touch padding.
7. Support modern user agent features including safe-area insets (`env(safe-area-inset-top)`) and dynamic viewport units (`dvh`, `svh`, `lvh`).

## Constraints / Rules
- Never use fixed pixel widths on container elements (e.g., `width: 1200px`); use `max-width` with percentage margins or auto-margins instead.
- Avoid using `!important` to override responsive styles across breakpoints.
- Do not disable viewport pinch-to-zoom (`user-scalable=no` is strictly prohibited).
- Avoid relying on device-specific media queries (e.g., specific iPhone screen dimensions); design for fluid breakpoint ranges.

## Workflow
1. Inspect component hierarchy and identify intrinsic versus extrinsic sizing constraints.
2. Define base styles for the smallest viewport (320px) without any media queries.
3. Identify layout stress points and introduce progressive `min-width` or container query breakpoints.
4. Replace rigid pixel dimensions with fluid CSS units (`ch`, `rem`, `%`, `clamp()`).
5. Validate against standard viewport widths (360px, 768px, 1024px, 1440px) and extreme edge cases (folded screens, rotated devices).

## Expected Output
Clean, self-contained CSS or component code with mobile-first media queries, container query wrappers, fluid typography formulas, and zero horizontal scroll behavior.

## Validation Checklist
- [ ] Does the layout render cleanly at 320px width without horizontal scrollbars?
- [ ] Are container queries used for modular, context-independent components?
- [ ] Are touch targets at least 44x44px on touch viewports?
- [ ] Are font sizes and padding fluidly scaled using `clamp()` where appropriate?
- [ ] Are safe-area environment variables respected for notched and mobile devices?

## Common Mistakes & Antipatterns
- Designing desktop-first and overriding properties with cascading `max-width` queries, leading to specificity conflicts.
- Hardcoding `height: 100vh` on mobile browsers, causing UI elements to be obscured by dynamic browser address bars; use `100dvh` instead.
- Forgetting `overflow-wrap: anywhere` or `word-break: break-word` on dynamic user text, causing container blowout on narrow screens.

## Concrete Real-World Example
Scenario: Refactoring a multi-column analytics card grid that breaks and scrolls horizontally on mobile devices.
Prompt: Refactor this rigid 3-column analytics card layout to be fluid and mobile-first, using CSS Grid with auto-fit and container queries.
Application: The AI replaces `width: 33.33%` with `grid-template-columns: repeat(auto-fit, minmax(min(100%, 280px), 1fr))`, attaches `@container (min-width: 400px)` for card internal rearrangements, and replaces fixed padding with `clamp(1rem, 2vw, 2rem)`.
