---
name: "memory-leak-and-heap-dump-investigation"
description: "Diagnosing memory leaks, analyzing V8/JVM heap dumps, tracing retainers trees, and eliminating uncollected object references."
category: "debugging"
subcategory: "crashes"
language: "agnostic"
framework: "none"
technology: "memory-management"
difficulty: "advanced"
tags: ["debugging", "memory-leaks", "heap-dumps", "garbage-collection", "v8", "jvm", "crashes"]
---

# Memory Leak Investigation and Heap Dump Analysis

## Purpose
Provide AI agents with concrete techniques for analyzing heap dumps, identifying memory leaks, tracing object retainers to GC roots, and resolving Out-Of-Memory (OOM) crashes.

## When to Use
Use when services experience creeping memory growth over time, frequent Garbage Collection thrashing, or fatal Out-Of-Memory (`kill -9`, SIGKILL) termination.

## Inputs / Context
Heap snapshots (`.heapsnapshot`, `.hprof`), memory timeline graphs, process restart logs, and source code.

## Instructions
1. Differentiate Natural Memory Growth from Real Memory Leaks:
   - Normal Growth: Memory rises, but drops back down after major Garbage Collection (sawtooth pattern).
   - Memory Leak: The baseline memory floor continually rises after each GC cycle, eventually exhausting heap limits.
2. Capture Heap Snapshots:
   - Capture Snapshot 1: Baseline immediately after application initialization and warmup.
   - Capture Snapshot 2: Under active workload.
   - Capture Snapshot 3: After workload has ceased and system is idle.
3. Compare Snapshots (The 3-Snapshot Technique):
   - Compare Snapshot 3 against Snapshot 1. Any objects allocated between Snapshot 1 and 2 that still exist in Snapshot 3 are leaked objects.
4. Inspect the Retainers Tree:
   - Identify the leaked object constructor with the highest Retained Size (amount of memory freed if this object were deleted).
   - Trace the Retainer Path upward to the Garbage Collection (GC) Root to discover why the garbage collector is unable to reclaim it.
5. Common Leak Vectors:
   - Global Caches: Unbounded Maps or objects used as in-memory caches without size caps or LRU eviction.
   - Forgotten Event Listeners: Registering listeners on long-lived objects (e.g., `process.on`, `window.addEventListener`) without removing them on component unmount.
   - Closures: Outer function variables captured unintentionally by long-lived inner callback functions.
   - Timers: `setInterval` running forever referencing out-of-scope variables.
6. Apply the Fix: Sever the retainer reference (e.g., clear intervals, remove listeners, use `WeakMap`/`WeakSet`).

## Constraints / Rules
- Never guess where memory is leaking without comparing heap snapshots.
- Do not invoke manual garbage collection (`global.gc()`) in production application code.
- Avoid using unbounded global collections for caching.

## Workflow
1. Monitor process memory RSS and Heap Used over a 24-hour cycle.
2. Trigger heap snapshots at baseline and post-load states.
3. Load snapshots into Chrome DevTools Memory tab or Eclipse MAT.
4. Filter by objects allocated between Snapshots 1 and 2.
5. Trace the retainer chain to the GC root.
6. Refactor code to sever references and verify memory stability in post-fix snapshot.

## Expected Output
Memory leak diagnostic report identifying the retaining GC root, retained byte size, and code refactor eliminating the leak.

## Validation Checklist
- [ ] Is creeping memory growth verified over multiple GC cycles?
- [ ] Are before-and-after heap snapshots compared?
- [ ] Is the retaining path traced all the way to a GC root?
- [ ] Are unbounded caches replaced with bounded LRU caches or WeakMaps?
- [ ] Does memory return to baseline after workload completion in the patched build?

## Common Mistakes & Antipatterns
- Confusing Shallow Size (memory held by the object itself) with Retained Size (total memory kept alive by the object's reference tree).
- Increasing container memory limits (e.g., doubling Kubernetes pod RAM) instead of fixing the leak, which merely delays the inevitable OOM crash by a few hours.
- Creating a cache using a plain JavaScript `new Map()` without a max size limit or eviction policy.

## Concrete Real-World Example
Scenario: A Node.js websocket gateway crashes with `JavaScript heap out of memory` every 3 days.
Prompt: Inspect this heap snapshot and find the memory leak.
Application: The AI compares baseline and 48-hour heap dumps, discovers 300,000 `EventEmitter` listener closures retained by a global `telemetryService` instance, identifies that sockets failed to call `removeListener('message')` upon disconnect, and fixes the disconnect cleanup hook, stabilizing heap memory at 45MB.
