---
name: "new-architecture-bridging"
description: "Architecting high-performance React Native applications leveraging the New Architecture, TurboModules (JSI), Fabric renderer, and Hermes engine optimization."
category: "mobile"
subcategory: "react-native"
language: "typescript"
framework: "react-native"
technology: "react-native-new-arch"
difficulty: "advanced"
tags: ["mobile", "react-native", "fabric", "turbomodules", "jsi", "hermes", "performance"]
---

# React Native New Architecture with Fabric and TurboModules

## Purpose
Guide AI in developing React Native applications compatible with the New Architecture, leveraging direct C++ JavaScript Interface (JSI) calls and synchronous Fabric UI rendering.

## When to Use
Use when building high-performance React Native apps, authoring native modules, optimizing cross-platform bridging, or eliminating bridge serialization lag.

## Inputs / Context
Component specifications, native bridge requirements, JavaScript/TypeScript code, and native platform bindings (Kotlin/Swift).

## Instructions
1. Leverage the React Native New Architecture:
   - Fabric Renderer: Synchronous rendering pipeline replacing the asynchronous legacy bridge, eliminating visual layout jumps and white screen flashes.
   - TurboModules: Lazy-loaded, synchronous native modules interacting with JavaScript via C++ JavaScript Interface (JSI) rather than JSON serialization over a bridge.
2. Define Type-Safe Native Module Specifications with Codegen:
   - Author native module interfaces using strict TypeScript or Flow specs extending `TurboModule`.
   - Run Codegen to generate strongly typed C++ interfaces for both iOS and Android.
3. Optimize for the Hermes Engine:
   - Enable Hermes JavaScript engine (`hermesEnabled: true`).
   - Hermes precompiles JavaScript into bytecode at build time, slashing app startup time and memory footprint.
4. Avoid Native Bridge Bottlenecks:
   - Never pass large binary buffers or high-frequency telemetry (e.g., 60Hz touch events) across the bridge; handle gestures natively using `react-native-gesture-handler` and `react-native-reanimated`.
5. Eliminate Re-Render Overhead:
   - Use `useCallback` and `React.memo` on list item renderers.
   - Use FlashList by Shopify instead of standard `FlatList` for 5x faster list rendering and memory recycling.
6. Handle Platform-Specific Insets:
   - Wrap roots in `SafeAreaProvider` and consume `useSafeAreaInsets()` to prevent UI overlap with notches and home indicators.

## Constraints / Rules
- Never write native bridge calls that pass massive JSON payloads synchronously.
- Avoid legacy asynchronous bridge modules in New Architecture enabled projects.
- Do not run continuous animation loops on the JS thread; run all animations on the UI thread via Reanimated worklets.

## Workflow
1. Define TurboModule TypeScript specification.
2. Generate C++ scaffolding via React Native Codegen.
3. Implement native methods in Kotlin and Swift adhering to generated interfaces.
4. Configure Hermes and Fabric in project builds.
5. Verify 60/120 FPS performance in React DevTools Profiler.

## Expected Output
React Native New Architecture component or TurboModule code featuring type-safe Codegen specs, JSI native bindings, and Hermes optimization.

## Validation Checklist
- [ ] Are native modules typed using TurboModule Codegen specifications?
- [ ] Is Hermes engine enabled for bytecode precompilation?
- [ ] Are high-frequency animations executed on the UI thread via worklets?
- [ ] Are virtualized lists powered by FlashList with precomputed item sizes?
- [ ] Does UI rendering avoid legacy asynchronous bridge serialization?

## Common Mistakes & Antipatterns
- Passing 60 FPS scroll updates from native to JS thread to compute layout positions, causing severe stutter and lag.
- Writing untyped legacy `NativeModules.MyModule` calls without compile-time parameter verification.
- Failing to clean up native event listeners in React `useEffect` hooks, leaking native memory.

## Concrete Real-World Example
Scenario: A React Native drawing app stutters because touch coordinates are serialized over the legacy bridge as JSON, causing 50ms of input lag.
Prompt: Refactor this drawing interaction to use the React Native New Architecture and Reanimated worklets.
Application: The AI implements a TurboModule with C++ JSI direct memory binding, migrates gesture tracking to `react-native-gesture-handler` running directly on the UI thread via Reanimated worklets, eliminating bridge latency and providing instant 120Hz drawing responsiveness.
