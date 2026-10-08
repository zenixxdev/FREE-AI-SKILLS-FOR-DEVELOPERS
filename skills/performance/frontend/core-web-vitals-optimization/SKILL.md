---
name: "core-web-vitals-optimization"
description: "Systematic optimization of Google Core Web Vitals: Largest Contentful Paint (LCP < 2.5s), Interaction to Next Paint (INP < 200ms), and Cumulative Layout Shift (CLS < 0.1)."
category: "performance"
subcategory: "frontend"
language: "agnostic"
framework: "none"
technology: "web-vitals"
difficulty: "advanced"
tags: ["performance", "frontend", "core-web-vitals", "lcp", "inp", "cls", "lighthouse"]
---

# Core Web Vitals Optimization (LCP, INP, CLS)

## Purpose
Provide AI agents with concrete engineering techniques for optimizing frontend web applications to consistently achieve 'Good' thresholds across all three Google Core Web Vitals.

## When to Use
Use when optimizing page load speed, improving SEO rankings, eliminating layout jumping, or resolving unresponsive UI interactions.

## Inputs / Context
Lighthouse audit report, Web Vitals field telemetry, page DOM structure, network waterfalls, and CSS stylesheets.

## Instructions
1. LARGEST CONTENTFUL PAINT (LCP) Optimization (Target: <= 2.5s):
   - Identify the LCP element (usually a hero image, video poster, or large heading).
   - Ensure the LCP resource is discovered immediately in the raw HTML response: never lazy-load (`loading="lazy"`) the LCP image.
   - Preload the LCP image in `<head>`: `<link rel="preload" fetchpriority="high" as="image" href="..." type="image/webp">`.
   - Eliminate render-blocking CSS and JavaScript by inlining critical CSS and deferring non-essential scripts (`defer` or `type="module"`).
   - Use modern image formats (AVIF or WebP) with responsive `srcset` sizing.
2. INTERACTION TO NEXT PAINT (INP) Optimization (Target: <= 200ms):
   - Break up Long Tasks (> 50ms) that monopolize the main thread.
   - Yield to the main thread during heavy operations using `scheduler.yield()` or `setTimeout(..., 0)`.
   - Provide immediate visual feedback: update UI state optimistically within 16ms before launching heavy computations or network calls.
   - Debounce rapid inputs and offload heavy data filtering/sorting to Web Workers.
3. CUMULATIVE LAYOUT SHIFT (CLS) Optimization (Target: <= 0.1):
   - Always include explicit `width` and `height` attributes or CSS `aspect-ratio` on all `<img>`, `<video>`, and `<iframe>` elements to reserve layout space before download.
   - Reserve space for dynamic content (advertisements, banners, cookie notices) using minimum height containers (`min-height`).
   - Use `font-display: optional` or size-adjust font overrides to prevent layout shifts during custom web font swaps (FOUT/FOIT).
   - Never inject new content above existing content unless responding directly to a deliberate user interaction.

## Constraints / Rules
- Never apply `loading="lazy"` to the above-the-fold hero / LCP image.
- Avoid importing entire monolithic utility libraries (e.g., full lodash or moment.js) into client bundles.
- Do not animate layout-triggering properties (`width`, `height`, `top`, `margin`); animate composite-only properties (`transform`, `opacity`).

## Workflow
1. Run Lighthouse and Chrome DevTools Performance panel.
2. Identify LCP element, INP long-task triggers, and CLS shifting elements.
3. Apply preloading and fetchpriority to LCP image.
4. Add aspect-ratio dimensions to media and ad slots.
5. Break up JavaScript long tasks to achieve INP < 200ms.
6. Verify against Web Vitals extension and Lighthouse CI.

## Expected Output
Optimized HTML, CSS, and JavaScript code achieving Green Core Web Vitals scores (LCP <= 2.5s, INP <= 200ms, CLS <= 0.1).

## Validation Checklist
- [ ] Is LCP image preloaded with `fetchpriority="high"` and NOT lazy-loaded?
- [ ] Do all images and media containers have explicit aspect-ratio or dimensions?
- [ ] Are all long tasks (> 50ms) broken up with main-thread yielding?
- [ ] Is font swapping configured to prevent layout shifts?
- [ ] Does Lighthouse report 90+ performance with zero red vital metrics?

## Common Mistakes & Antipatterns
- Adding `loading="lazy"` to every `<img>` on the page including the hero banner, delaying LCP by several seconds.
- Dynamically inserting an alert banner at the top of the page after 2 seconds, pushing the entire page down and causing a massive 0.4 CLS penalty.
- Running a heavy synchronous data sort on an input change event, causing the browser to freeze and failing INP.

## Concrete Real-World Example
Scenario: An e-commerce product page scores 45 on Lighthouse with an LCP of 5.8s and a CLS of 0.35 due to unreserved ad banners and delayed hero images.
Prompt: Optimize this product page to achieve green Core Web Vitals.
Application: The AI removes `loading="lazy"` from the hero image, adds `<link rel="preload" fetchpriority="high">`, sets `aspect-ratio: 16/9` on all product gallery containers, wraps dynamic marketing slots in fixed-height placeholder containers, and defers tracking scripts, lowering LCP to 1.8s and CLS to 0.02.
