---
name: "gameplay-systems-architecture"
description: "Architecting modular, performant Unity games using ScriptableObject data architecture, zero-allocation Object Pooling, and decoupled event channels."
category: "game-development"
subcategory: "unity"
language: "csharp"
framework: "unity"
technology: "unity-engine"
difficulty: "advanced"
tags: ["game-development", "unity", "csharp", "scriptable-objects", "object-pooling", "gameplay-systems"]
---

# Unity Gameplay Architecture with ScriptableObjects and Object Pooling

## Purpose
Instruct AI agents to author scalable, high-performance Unity gameplay systems in C# that eliminate Garbage Collection pauses and decouple game systems using ScriptableObjects.

## When to Use
Use when creating Unity game mechanics, projectile systems, inventory management, audio managers, or optimizing mobile/console game frame rates.

## Inputs / Context
Game mechanics specification, entity definitions, prefab references, performance budgets, and event hooks.

## Instructions
1. Decouple Systems using ScriptableObject Event Channels:
   - Avoid direct tight references between game systems (e.g., Player should not directly reference UIManager or SoundManager).
   - Use ScriptableObjects as modular Event Channels (e.g., `GameEventSO`, `IntEventChannelSO`): publishers invoke `Raise()`, listeners subscribe via `OnEventRaised`.
2. Data-Driven Design with ScriptableObject Configuration:
   - Store weapon stats, enemy types, and balancing parameters in `ScriptableObject` asset files rather than hardcoding them in `MonoBehaviour` scripts.
3. Zero-Allocation Object Pooling:
   - Never call `Instantiate()` and `Destroy()` repeatedly for high-frequency game entities (projectiles, particle effects, damage numbers, audio clips).
   - Use Unity's native `UnityEngine.Pool.ObjectPool<T>`:
     * Pre-warm the pool at scene start.
     * Call `pool.Get()` on spawn and `pool.Release()` on death/despawn.
     * Eliminates Garbage Collection allocations and prevents frame-rate stutter.
4. Cache Component References and String Hashes:
   - Never call `GetComponent<T>()` or `FindObjectOfType<T>()` inside `Update()`. Cache references in `Awake()` or `Start()`.
   - Cache animator and shader property IDs: use `Animator.StringToHash("Speed")` rather than passing string names in `Update()`.
5. Physics and Update Rules:
   - Run all Rigidbody physics calculations inside `FixedUpdate()`, never `Update()`.
   - Scale movement and frame-dependent calculations by `Time.deltaTime` (in `Update`) or `Time.fixedDeltaTime` (in `FixedUpdate`).

## Constraints / Rules
- Never call `GameObject.Find()` or `GetComponent()` inside `Update()` or per-frame loops.
- Never instantiate and destroy high-frequency game objects dynamically during gameplay.
- Do not use physics raycasts without layer masks (`Physics.Raycast` must always specify a `LayerMask`).

## Workflow
1. Define ScriptableObject event channels and data containers.
2. Implement gameplay components subscribing to event channels.
3. Build ObjectPool for spawning and despawning entities.
4. Cache all component handles in `Awake()`.
5. Profile frame rate and GC Alloc in the Unity Profiler.

## Expected Output
High-performance Unity C# scripts featuring ScriptableObject architecture, `ObjectPool<T>` integration, and zero per-frame GC allocations.

## Validation Checklist
- [ ] Are high-frequency entities recycled using `ObjectPool<T>`?
- [ ] Are systems decoupled using ScriptableObject event channels?
- [ ] Are all `GetComponent` calls cached in `Awake()`?
- [ ] Does physics code execute exclusively in `FixedUpdate()`?
- [ ] Does Unity Profiler show 0B GC allocation on per-frame update loops?

## Common Mistakes & Antipatterns
- Calling `Instantiate(bulletPrefab)` and `Destroy(bullet, 2f)` 50 times per second in a shooter game, creating massive memory fragmentation and triggering 50ms GC freezes.
- Calling `Camera.main` in `Update()` (in older Unity versions, this internally executes an expensive `FindObjectWithTag` call on every frame).
- Hardcoding game variables directly in C# scripts, forcing code recompilation for simple balance tweaks.

## Concrete Real-World Example
Scenario: A mobile 2D space shooter drops from 60 FPS to 22 FPS whenever the player fires a weapon due to continuous GameObject instantiation and garbage collection spikes.
Prompt: Optimize this Unity weapon firing system to maintain solid 60 FPS without GC allocations.
Application: The AI replaces dynamic `Instantiate`/`Destroy` with Unity's `ObjectPool<Projectile>`, caches particle and audio components, moves bullet stats into a `WeaponConfigSO` ScriptableObject, and converts bullet death to `pool.Release()`, eliminating all GC allocations.
