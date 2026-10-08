---
name: "touch-target-layout"
description: "Ergonomic mobile UI layout design focused on one-handed thumb reachability, minimum touch target dimensions, and interactive element spacing."
category: "ui"
subcategory: "mobile"
language: "agnostic"
framework: "none"
technology: "mobile-ui"
difficulty: "intermediate"
tags: ["mobile", "touch", "ergonomics", "ui", "accessibility", "a11y"]
---

# Mobile Touch Target and Ergonomic Layout

## Purpose
Guide AI in structuring mobile application layouts and responsive mobile views that maximize physical usability, prevent accidental activations, and satisfy WCAG 2.5.5 and 2.5.8 target size criteria.

## When to Use
Use when creating mobile screens, floating navigation bars, bottom sheets, form controls, or touch-first web applications.

## Inputs / Context
Screen specifications, user persona ergonomic expectations, list of interactive actions and their relative priority.

## Instructions
1. Place primary action buttons and navigation in the natural thumb zone (bottom 35% of the mobile viewport).
2. Ensure every interactive element has a minimum touch target area of 48x48 CSS pixels / dp, even if the visible icon is smaller (e.g., 24px icon inside a 48px hit area).
3. Maintain at least 8dp / 8px of clear separation between adjacent interactive touch targets to prevent accidental triggers.
4. Implement sticky bottom action bars or floating action buttons for primary workflow completions rather than top-anchored headers.
5. Provide immediate visual touch feedback (active/pressed states, ripple, or opacity shift) within 16ms of touch initiation.
6. Support edge swipe gestures without conflicting with system navigation gestures (Android back gesture and iOS home bar).

## Constraints / Rules
- Never place destructive actions (e.g., 'Delete Project') immediately adjacent to high-frequency confirmation actions without distinct visual friction or confirmation.
- Do not rely on hover states (`:hover`) for revealing necessary mobile interactive options.
- Avoid placing critical interactive controls in the extreme top corners of large mobile screens.

## Workflow
1. Map all interactive controls on the target screen and categorize by frequency of use.
2. Establish visual bounding boxes and transparent touch target extensions (`hitSlop` or CSS `padding`/`::after` pseudo-elements).
3. Position high-frequency controls in the lower half of the screen; place contextual navigation or back actions in the top app bar.
4. Verify spacing between grouped icons (e.g., table row actions or toolbar items).
5. Test hit target responsiveness on both standard (375-430px) and compact (320px) screens.

## Expected Output
Mobile layout code (CSS, Jetpack Compose, React Native, or Flutter) with explicit 48dp hit targets, ergonomic positioning, and zero accidental touch overlaps.

## Validation Checklist
- [ ] Are all touch targets >= 48x48 dp/px?
- [ ] Is there >= 8px separation between touch targets?
- [ ] Are primary actions situated within easy thumb reach?
- [ ] Is visual feedback provided immediately on touch?
- [ ] Are system gesture insets respected?

## Common Mistakes & Antipatterns
- Sizing an icon button strictly to the SVG dimensions (e.g., 18x18px), making it nearly impossible for users to tap accurately.
- Placing primary confirmation buttons at the top right of mobile screens on 6.7+ inch displays.
- Neglecting keyboard activation behavior: failing to adjust layout when the software keyboard appears.

## Concrete Real-World Example
Scenario: An e-commerce checkout page with a tiny 'Apply Coupon' button placed directly beside a 'Remove Item' icon.
Prompt: Optimize this mobile cart screen for touch ergonomics and accessibility.
Application: The AI expands both buttons to 48dp hit areas, separates them by 16dp, moves the 'Proceed to Checkout' button to a fixed bottom drawer with safe area padding, and styles the remove action with a confirmation dialog.
