---
name: "frame-rate-and-battery-budgeting"
description: "Optimizing mobile application rendering to achieve consistent 60/120 FPS, eliminating UI thread jank, reducing overdraw, and conserving device battery life."
category: "performance"
subcategory: "mobile"
language: "agnostic"
framework: "none"
technology: "mobile-performance"
difficulty: "advanced"
tags: ["performance", "mobile", "fps", "jank", "battery", "overdraw", "profiling"]
---

# Mobile Frame Rate (60/120 FPS) and Battery Budget Optimization

## Purpose
Provide AI agents with concrete techniques for eliminating frame drops, eliminating main-thread jank, minimizing GPU overdraw, and preserving battery life on mobile devices.

## When to Use
Use when optimizing React Native, Flutter, Android, or iOS mobile applications with stuttering list scrolling, high CPU drain, or rapid battery depletion.

## Inputs / Context
Mobile UI layout, rendering profiling traces (Systrace, Android Studio Profiler, Instruments), list virtualization configs, and background task schedules.

## Instructions
1. Adhere to the 16ms / 8ms Frame Budget:
   - For standard 60Hz displays, all UI thread rendering work must complete within 16.6ms per frame.
   - For high-refresh 120Hz displays (ProMotion), work must complete within 8.3ms per frame.
   - Any frame taking longer causes a visible visual stutter (Jank / Dropped Frame).
2. Offload Non-UI Work from the Main Thread:
   - Never parse large JSON payloads, serialize complex models, or execute cryptographic operations on the main UI thread.
   - Offload heavy tasks to background worker threads, Kotlin Coroutines (`Dispatchers.Default`), or React Native native modules.
3. Optimize List Virtualization:
   - Always virtualize dynamic lists (`RecyclerView` in Android, `FlatList` with `getItemLayout` in React Native, `ListView.builder` in Flutter).
   - Recycle views and avoid creating new component instances or allocating new closures during fast scrolling.
4. Minimize GPU Overdraw:
   - Inspect overdraw: ensure pixels are not drawn multiple times in a single frame due to stacked opaque background colors on parent containers.
   - Remove redundant container backgrounds.
5. Conserve Battery Life:
   - Avoid continuous polling; use push notifications (FCM/APNs) for remote updates.
   - Batch background location and network requests using system job schedulers (WorkManager on Android, BGTaskScheduler on iOS).
   - Cease all animations, timers, and sensor listeners immediately when the mobile screen or activity enters the background.

## Constraints / Rules
- Never execute file I/O or network requests on the mobile UI thread.
- Avoid nesting scrollable containers within scrollable containers without fixed constraints.
- Do not keep GPS location sensors active at high accuracy when the app is backgrounded.

## Workflow
1. Profile scrolling performance using mobile profilers to measure dropped frames.
2. Identify overdraw hotspots and strip unnecessary background colors.
3. Configure list virtualization with precomputed item heights.
4. Move JSON parsing and heavy business transformations to background workers.
5. Audit background services to ensure compliance with OS battery saver policies.

## Expected Output
High-performance mobile UI code delivering smooth 60/120 FPS scrolling, minimal overdraw, and battery-friendly background task scheduling.

## Validation Checklist
- [ ] Are all list views properly virtualized and recycled?
- [ ] Is the main UI thread completely free of blocking I/O and heavy parsing?
- [ ] Is overdraw minimized to <= 1x across all screen regions?
- [ ] Are animations paused when views are off-screen or backgrounded?
- [ ] Are background tasks scheduled using WorkManager or BGTaskScheduler?

## Common Mistakes & Antipatterns
- Rendering an unbounded list of 500 cards in a standard `ScrollView` instead of a virtualized list, crashing the mobile app with an Out-Of-Memory error.
- Setting opaque background colors on 5 nested parent containers, forcing the mobile GPU to render the same pixel 5 times per frame.
- Leaving a high-frequency GPS or timer loop running after the user minimizes the app, draining 20% of battery in an hour.

## Concrete Real-World Example
Scenario: A mobile product catalog stutters severely during scrolling on Android devices, dropping down to 18 FPS and heating up the device.
Prompt: Optimize this mobile catalog list to achieve butter-smooth 60 FPS scrolling and reduce battery consumption.
Application: The AI migrates the list to a virtualized `FlatList` with `getItemLayout` for instantaneous scroll calculations, removes redundant nested view backgrounds to eliminate 3x overdraw, offloads image decoding, and memoizes list item renderers with `React.memo`, restoring smooth 60 FPS scrolling.
