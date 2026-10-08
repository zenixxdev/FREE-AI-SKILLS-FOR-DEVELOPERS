---
name: "wcag-contrast-and-focus"
description: "Engineering accessible web and mobile interfaces complying with WCAG 2.2 Level AA requirements for color contrast, visible focus indicators, and complete keyboard operability."
category: "ux"
subcategory: "accessibility"
language: "css"
framework: "none"
technology: "a11y-wcag"
difficulty: "intermediate"
tags: ["accessibility", "a11y", "wcag", "contrast", "keyboard-navigation", "focus"]
---

# WCAG 2.2 AA Contrast, Focus, and Keyboard Navigation

## Purpose
Provide developers and AI agents with precise engineering rules for meeting WCAG 2.2 Level AA compliance across visual styling, interactive focus states, and keyboard traps.

## When to Use
Use during UI design token creation, component implementation, design system development, and accessibility audits.

## Inputs / Context
Component DOM structure, color pairings, interactive elements, custom widgets (dialogs, dropdowns, tabs).

## Instructions
1. Ensure all standard text (< 18pt regular or < 14pt bold) satisfies a minimum contrast ratio of 4.5:1 against its background.
2. Ensure large text (>= 18pt regular or >= 14pt bold) and essential graphical UI components (borders of form inputs, icons) satisfy a minimum contrast ratio of 3.0:1.
3. Never remove CSS focus outlines (`outline: none` or `outline: 0`) without providing an equally prominent custom focus indicator (`:focus-visible`).
4. Ensure focus indicators have a contrast ratio of at least 3.0:1 against adjacent colors and a minimum perimeter thickness of 2px.
5. All interactive elements must be focusable and operable using the keyboard alone (Tab, Shift+Tab, Enter, Space, Escape, and Arrow keys).
6. Implement focus traps inside modal dialogs and slide-out drawers, returning focus to the triggering element upon closure.
7. Provide a 'Skip to main content' link as the first focusable element on web pages.
8. Maintain a logical tab order matching visual reading flow (avoid positive `tabindex`).

## Constraints / Rules
- Never use `tabindex` greater than 0 (`tabindex="1"` is prohibited).
- Never convey information using color alone (e.g., error fields must have text descriptions and icons in addition to red borders).
- Avoid trapping keyboard focus in any widget without a standard escape mechanism (`Escape` key).

## Workflow
1. Calculate color contrast ratios for all text, icon, and border pairings using the relative luminance formula.
2. Audit all interactive elements to verify they use native HTML elements (`<button>`, `<a>`, `<input>`) or correct ARIA roles and keyboard handlers.
3. Add global `:focus-visible` styles with high-contrast outlines and offsets (`outline-offset: 2px`).
4. Test keyboard-only navigation through the entire user flow: verify focus is always visually evident and never lost.
5. Verify modal dialogs capture focus on open and restore focus to trigger on close.

## Expected Output
Accessible CSS styles and HTML/ARIA component markup that fully passes automated Axe/Lighthouse accessibility audits with zero focus or contrast violations.

## Validation Checklist
- [ ] Do all standard text elements meet >= 4.5:1 contrast ratio?
- [ ] Is `:focus-visible` clearly styled with >= 2px high-contrast outline?
- [ ] Can all interactive components be operated using keyboard alone?
- [ ] Is keyboard focus trapped inside open modals and returned to trigger on close?
- [ ] Is there an accessible 'Skip to content' link at the top of the page?

## Common Mistakes & Antipatterns
- Stripping focus rings with `* { outline: none; }` to satisfy aesthetic preferences.
- Using light gray text (`#94a3b8`) on white backgrounds (`#ffffff`), failing the 4.5:1 threshold (yields 2.6:1).
- Building custom `<div>` buttons without `role="button"`, `tabindex="0"`, and `onKeyDown` listeners for Space and Enter.

## Concrete Real-World Example
Scenario: A custom dropdown menu styled with `div` tags that cannot be focused with Tab and uses light gray text.
Prompt: Make this custom dropdown component fully WCAG 2.2 AA compliant for keyboard navigation and contrast.
Application: The AI converts the container into a `<button>` with `aria-haspopup="listbox"` and `aria-expanded`, sets focus rings using `:focus-visible { outline: 2px solid #2563eb; outline-offset: 2px; }`, elevates text contrast from 2.8:1 to 5.4:1, and implements ArrowDown/ArrowUp keyboard navigation.
