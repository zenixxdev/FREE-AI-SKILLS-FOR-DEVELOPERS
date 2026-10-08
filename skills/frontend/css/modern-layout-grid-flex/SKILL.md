---
name: "modern-layout-grid-flex"
description: "Architecting resilient, responsive layouts leveraging modern CSS features including CSS Grid, Flexbox, subgrid, aspect-ratio, and logical properties."
category: "frontend"
subcategory: "css"
language: "css"
framework: "none"
technology: "css"
difficulty: "intermediate"
tags: ["frontend", "css", "grid", "flexbox", "subgrid", "logical-properties", "layout"]
---

# Modern CSS Layout Architecture with Grid and Flexbox

## Purpose
Provide deterministic design patterns for implementing clean, responsive multi-column layouts, nested card grids, and navigation rails without layout hacks or external CSS frameworks.

## When to Use
Use when designing application dashboards, data grids, magazine-style layouts, card decks, or responsive app shells.

## Inputs / Context
Layout wireframe, visual rhythm requirements, dynamic content constraints, and multi-language/RTL requirements.

## Instructions
1. Use CSS Grid for two-dimensional layouts (both rows and columns simultaneously) and Flexbox for one-dimensional layouts (row or column).
2. Utilize `repeat(auto-fit, minmax(min(100%, 300px), 1fr))` for intrinsically responsive card grids that automatically wrap without media queries.
3. Leverage CSS `subgrid` on nested grid items to inherit row/column track alignments from the parent grid, aligning card headers, bodies, and footers across rows.
4. Replace physical properties (`left`, `right`, `top`, `bottom`) with CSS Logical Properties (`inline-start`, `inline-end`, `block-start`, `block-end`, `margin-inline`, `padding-block`) to support bidirectional and RTL languages.
5. Use the modern `aspect-ratio` property to prevent Cumulative Layout Shift (CLS) on dynamic image and video containers.
6. Manage spacing consistently using CSS Grid/Flexbox `gap` rather than cascading child margins.
7. Use `min-width: 0` or `min-height: 0` on flex/grid items to prevent flex/grid item overflow caused by long strings or code snippets.

## Constraints / Rules
- Never use float-based layouts or table-based layout hacks.
- Avoid setting rigid fixed heights on text-containing elements; allow intrinsic content expansion.
- Do not mix CSS Grid and Flexbox haphazardly on the same container element.

## Workflow
1. Decompose the viewport into major structural regions (sidebar, header, content, ancillary panel).
2. Define the outer page grid with `grid-template-areas` or track definitions.
3. Implement component internal layouts using Flexbox or nested subgrids.
4. Apply logical margins, paddings, and alignment properties (`justify-content`, `align-items`).
5. Validate rendering across extreme content variations (empty content, 500-character usernames, high-resolution media).

## Expected Output
Clean, modular CSS rules using CSS Grid, subgrid, flexbox gap, and logical properties, free of media-query clutter and layout hacks.

## Validation Checklist
- [ ] Does the grid wrap dynamically across viewports without horizontal scrolling?
- [ ] Are card footers and headers aligned using `subgrid` or flex column push?
- [ ] Are logical properties used for margins, paddings, and borders?
- [ ] Is `aspect-ratio` applied to media containers to prevent CLS?
- [ ] Do flex/grid items include `min-width: 0` to prevent text blowout?

## Common Mistakes & Antipatterns
- Using `margin-right` instead of `margin-inline-end`, breaking layouts when switched to Arabic or Hebrew (RTL).
- Attempting to force Flexbox into a 2D grid using brittle percentage widths and negative margins.
- Forgetting `min-width: 0` on flex children, resulting in uncontainable horizontal scrolling when displaying code blocks or URLs.

## Concrete Real-World Example
Scenario: A dashboard card grid where varying description lengths cause action buttons at the bottom of cards to be misaligned.
Prompt: Align the buttons across cards in this multi-column grid without fixing card heights.
Application: The AI configures the card grid with `display: grid; grid-template-rows: subgrid; grid-row: span 3;` allowing the header, body, and button footer of every card to lock to shared row tracks across the entire grid.
