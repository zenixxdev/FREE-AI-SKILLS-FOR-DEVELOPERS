---
name: "thread-safe-concurrency-models"
description: "Building stable, leak-free Android applications in Java utilizing java.util.concurrent ExecutorServices, Looper/Handler main-thread dispatch, and WeakReference memory management."
category: "mobile"
subcategory: "android/java"
language: "java"
framework: "android"
technology: "android-java"
difficulty: "advanced"
tags: ["mobile", "android", "java", "concurrency", "executors", "weakreference", "memory-leaks"]
---

# Android Java Thread Safety, ExecutorServices, and WeakReference

## Purpose
Provide concrete guidelines for maintaining and writing high-reliability Android applications in Java, eliminating Activity memory leaks and race conditions.

## When to Use
Use when maintaining enterprise Android Java codebases, writing native SDKs, or managing background threads without Kotlin coroutines.

## Inputs / Context
Java Activity/Fragment, background tasks, thread pools, and UI callback handlers.

## Instructions
1. Eliminate Activity Context Leaks using `WeakReference`:
   - Never pass a direct reference of an `Activity` or `Context` into background threads, async tasks, or static singletons.
   - Wrap Context references in `WeakReference<Context>` and verify `reference.get() != null` before invoking UI callbacks.
2. Manage Background Thread Pools with `ExecutorService`:
   - Replace deprecated `AsyncTask` with bounded thread pools: `Executors.newFixedThreadPool(n)` or custom `ThreadPoolExecutor`.
   - Shut down executors properly when the application terminates.
3. Dispatch to the Main Thread via `Handler`:
   - Use `new Handler(Looper.getMainLooper())` to post UI updates from background worker threads safely.
   - Use static inner classes for Handlers paired with `WeakReference` to avoid capturing implicit outer class references.
4. Ensure Thread Safety on Shared State:
   - Use `AtomicInteger`, `AtomicBoolean`, or `ConcurrentHashMap` for thread-safe counters and dictionaries.
   - Guard multi-step atomic operations with `synchronized` blocks or `ReentrantLock`.
5. Cancel Background Tasks on Lifecycle Teardown:
   - Cancel in-flight `Future<?>` handles in `onDestroy()` (`future.cancel(true)`).

## Constraints / Rules
- Never use the deprecated `AsyncTask` in modern Android code.
- Never hold strong references to `Activity` instances in background worker runnables.
- Avoid performing disk or network I/O on the Android Main Looper thread.

## Workflow
1. Define background executor service with bounded thread pool.
2. Implement background runnable using `WeakReference` to caller callbacks.
3. Post results to UI via `Handler(Looper.getMainLooper())`.
4. Cancel pending tasks in `onDestroy()`.
5. Verify zero memory leaks using LeakCanary.

## Expected Output
Thread-safe Android Java service and Activity code featuring ExecutorService, static handlers, WeakReference callbacks, and clean lifecycle cancellation.

## Validation Checklist
- [ ] Are Activity references wrapped in `WeakReference`?
- [ ] Are Handlers declared as static inner classes to prevent memory leaks?
- [ ] Are UI updates posted to `Looper.getMainLooper()`?
- [ ] Are in-flight futures cancelled during `onDestroy()`?
- [ ] Does LeakCanary report 0 retained Activity instances?

## Common Mistakes & Antipatterns
- Creating an anonymous `new Thread(new Runnable() { ... }).start()` inside an Activity, keeping the entire Activity and all its View bitmaps alive in memory forever if the thread runs long.
- Modifying UI Views directly from a background thread, throwing `CalledFromWrongThreadException`.
- Using unbounded thread executors, creating hundreds of threads and crashing the process with `OutOfMemoryError: pthread_create failed`.

## Concrete Real-World Example
Scenario: An enterprise Android Java barcode scanner leaks 50MB of memory on every device rotation because a background thread holds a strong reference to the destroyed Activity.
Prompt: Fix this Activity context memory leak in Java using WeakReference and modern Executors.
Application: The AI replaces the raw thread with a managed `ExecutorService`, converts the callback listener to a `WeakReference<ScanCallback>`, posts results through a static `Handler(Looper.getMainLooper())`, and cancels pending futures in `onDestroy()`, resolving all memory leaks.
