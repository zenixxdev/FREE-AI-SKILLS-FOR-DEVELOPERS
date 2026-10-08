---
name: "app-router-server-components"
description: "Architecting Next.js applications using App Router conventions, React Server Components (RSC), Client Component boundaries, Server Actions, and granular streaming."
category: "frontend"
subcategory: "nextjs"
language: "typescript"
framework: "nextjs"
technology: "react-server-components"
difficulty: "advanced"
tags: ["frontend", "nextjs", "app-router", "rsc", "server-actions", "streaming", "ssr"]
---

# Next.js App Router and Server Component Boundaries

## Purpose
Instruct AI agents to properly partition Next.js App Router applications between Server Components and Client Components, optimizing bundle size, performance, and data security.

## When to Use
Use when architecting Next.js 14+ or 15+ applications, building data-heavy dashboard routes, handling form submissions via Server Actions, or optimizing Core Web Vitals.

## Inputs / Context
Page requirements, data fetching dependencies, interactive elements (event handlers, state), and cache revalidation strategies.

## Instructions
1. Default all components to React Server Components (RSC); introduce `'use client'` only at the leaves of the component tree where interactivity (hooks, event listeners) is required.
2. Fetch data directly inside Server Components using async/await without `useEffect` or client-side fetch libraries.
3. Pass Server Components as `children` or props to Client Components to avoid forcing server-side subtrees into client bundles.
4. Implement mutations using Server Actions (`'use server'`) with input validation via Zod and optimistic updates via `useOptimistic`.
5. Revalidate cached data deterministically using `revalidatePath()` or `revalidateTag()`.
6. Wrap slow data-fetching Server Components in `<Suspense fallback={<Skeleton />}>` to enable streaming server rendering (PPR/SSR).
7. Guard sensitive server-only code (database queries, secret keys) using the `server-only` package to prevent accidental client leakage.
8. Use Next.js route handlers (`app/api/.../route.ts`) exclusively for external webhooks and public third-party APIs; use Server Actions for internal UI mutations.

## Constraints / Rules
- Never mark an entire page or layout with `'use client'` simply to use a single interactive button or input.
- Never pass sensitive credentials or private server entities directly as props to Client Components.
- Do not import database clients or server secrets into files marked with `'use client'`.

## Workflow
1. Analyze the route UI and map data requirements vs interactive client requirements.
2. Create the layout and page as async Server Components fetching data in parallel.
3. Identify interactive boundaries (like a search input or favorite button) and isolate them into dedicated `'use client'` files.
4. Wrap async data components in `<Suspense>` boundaries with skeleton placeholders.
5. Create Server Actions for state mutations with schema validation and cache revalidation.

## Expected Output
High-performance Next.js App Router structure with clean client/server separation, minimal client JavaScript bundles, and streaming suspense fallbacks.

## Validation Checklist
- [ ] Are Server Components utilized by default across all layouts and pages?
- [ ] Is `'use client'` pushed to the absolute leaves of the component tree?
- [ ] Are async boundaries wrapped in `<Suspense>` with responsive fallbacks?
- [ ] Are Server Actions validated using a runtime schema validator (Zod)?
- [ ] Is sensitive backend code protected with `import 'server-only'`?

## Common Mistakes & Antipatterns
- Adding `'use client'` at the top of a page file to handle a single button click, unnecessarily bundling all child components into client JS.
- Passing full database entity models (including hashed passwords or internal metadata) as props to Client Components.
- Fetching data in client components using `useEffect` instead of leveraging async Server Components.

## Concrete Real-World Example
Scenario: A slow Next.js dashboard route takes 3 seconds to load because it waits for multiple sequential database queries before rendering anything.
Prompt: Optimize this Next.js dashboard using App Router streaming and Server Component boundaries.
Application: The AI converts the page into an async Server Component, triggers independent database queries in parallel wrapped in separate `<Suspense>` boundaries with skeleton loaders, extracts the interactive filter dropdown into a leaf `'use client'` component, and implements instant initial HTML delivery.
