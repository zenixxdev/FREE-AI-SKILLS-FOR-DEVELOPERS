---
name: "async-event-loop-patterns"
description: "Mastering asynchronous JavaScript execution, event loop mechanics, microtask scheduling, concurrency control, and cancellation via AbortController."
category: "frontend"
subcategory: "javascript"
language: "javascript"
framework: "none"
technology: "vanilla-js"
difficulty: "advanced"
tags: ["frontend", "javascript", "async", "event-loop", "abortcontroller", "concurrency", "promises"]
---

# Asynchronous JavaScript and Event Loop Resilience

## Purpose
Guide AI in writing production-grade asynchronous JavaScript that manages race conditions, controls concurrency, handles errors exhaustively, and avoids main-thread starvation.

## When to Use
Use when implementing API clients, background data sync, debounced search auto-completes, batched queue processors, or complex DOM interaction sequences.

## Inputs / Context
Asynchronous task specifications, rate limit constraints, network latency parameters, and cancelation requirements.

## Instructions
1. Always utilize `AbortController` and `AbortSignal` for cancellable asynchronous operations (fetch requests, timeouts, long-running event listeners).
2. Distinguish between macrotask (`setTimeout`, `setInterval`, I/O) and microtask (`Promise.then`, `queueMicrotask`, `MutationObserver`) scheduling queues to avoid unexpected state execution order.
3. Prevent memory leaks and unhandled rejections by wrapping async workflows in structured `try/catch/finally` blocks and pairing event listeners with cleanup handlers.
4. Implement concurrency limiters (e.g., `p-limit` pattern) when executing parallel promises via `Promise.all` or `Promise.allSettled` to prevent overwhelming network sockets or thread pools.
5. Use `Promise.allSettled()` instead of `Promise.all()` when individual subtask failures should not abort the entire batch.
6. Avoid blocking the browser main thread: offload computationally intensive loops (> 50ms) to Web Workers or yield control using `scheduler.yield()` / `setTimeout(..., 0)`.
7. Debounce and throttle high-frequency events (`scroll`, `resize`, `input`) with trailing and leading edge configuration options.

## Constraints / Rules
- Never write unbounded `Promise.all()` over arbitrary-length user-supplied arrays.
- Never swallow errors silently in Promise catch handlers without logging or telemetry.
- Avoid the `async` executor antipattern in `new Promise(async (resolve, reject) => ...)`; handle asynchronous resolution strictly inside normal promise chains.

## Workflow
1. Define the asynchronous operation lifecycle: trigger, in-flight, success, error, cancellation.
2. Initialize an `AbortController` instance and pass its signal to all underlying fetch calls or timers.
3. Structure concurrency limits and retry strategies with jittered exponential backoff.
4. Provide immediate cancellation upon component unmount or subsequent query entry.
5. Verify event loop non-blocking behavior under heavy payload processing.

## Expected Output
Robust, modern asynchronous JavaScript modules with explicit abort handling, bounded concurrency, and defensive error propagation.

## Validation Checklist
- [ ] Are all in-flight network requests cancelled when superseded or unmounted?
- [ ] Is concurrency bounded when executing batches of async tasks?
- [ ] Is `Promise.allSettled` utilized where partial batch success is acceptable?
- [ ] Does heavy computation yield to the browser event loop to preserve 60fps responsiveness?
- [ ] Are all promise rejections handled without crashing the runtime?

## Common Mistakes & Antipatterns
- Failing to abort previous search requests in typeahead autocomplete inputs, leading to race conditions where older requests overwrite newer results.
- Unhandled promise rejection when an aborted fetch throws `AbortError`; code must explicitly check `error.name === 'AbortError'`.
- Running CPU-bound data parsing on the main UI thread causing page freezes.

## Concrete Real-World Example
Scenario: An autocomplete search box sends requests on every keystroke, resulting in race conditions where stale network responses overwrite recent queries.
Prompt: Fix this search autocomplete function to prevent race conditions and excessive API calls.
Application: The AI implements a debounce wrapper, instantiates an `AbortController` on each keystroke to abort prior pending HTTP requests, ignores `AbortError` in the catch clause, and handles UI loading states deterministically.
