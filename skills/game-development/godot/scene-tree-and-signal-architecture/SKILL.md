---
name: "godot-scene-tree-and-signal-architecture"
description: "Architecting modular, decoupled Godot 4 games in GDScript using the Scene Tree, 'Call Down, Signal Up' communication, typed signals, and custom resources."
category: "game-development"
subcategory: "godot"
language: "gdscript"
framework: "godot"
technology: "godot-4"
difficulty: "intermediate"
tags: ["game-development", "godot", "godot4", "gdscript", "signals", "scene-tree"]
---

# Godot 4 Scene Tree Architecture and Signal Communication

## Purpose
Instruct AI agents to author clean, modular Godot 4 games using idiomatic GDScript, strict scene decoupling, typed signals, and data-driven Custom Resources.

## When to Use
Use when creating 2D/3D games in Godot 4, structuring player controllers, building UI systems, or designing game state management.

## Inputs / Context
Game mechanics, node hierarchy, character controls, signal events, and resource definitions.

## Instructions
1. Adhere to the 'Call Down, Signal Up' Rule:
   - A parent node may directly call methods or modify properties on its child nodes (Call Down).
   - A child node must NEVER call methods or reference properties on its parent node directly; it must emit a typed Signal (Signal Up).
   - This ensures child scenes (like a Player, Coin, or Enemy) can be instanced and tested completely in isolation.
2. Use Godot 4 Typed Signals:
   - Declare signals with explicit parameter types: `signal health_changed(new_health: int, max_health: int)`.
   - Connect signals cleanly in code using callable syntax: `health_changed.connect(_on_health_changed)`.
3. Data-Driven Design with Custom Resources (`class_name ... extends Resource`):
   - Encapsulate configuration data (weapon stats, character attributes) inside custom `Resource` files (`.tres`) rather than hardcoding values in scripts.
4. Process vs. PhysicsProcess:
   - Use `_process(delta)` for visual rendering, animations, UI updates, and non-physics logic.
   - Use `_physics_process(delta)` for kinematic movement (`move_and_slide()`), raycasts, and RigidBody physics.
   - Always multiply movement calculations by `delta` to ensure frame-rate independent gameplay.
5. Node Path Safety:
   - Use `@onready @export var` or unique node names (`%UniqueNode`) rather than fragile hardcoded node paths (`$Path/To/Node`).

## Constraints / Rules
- Never write `get_parent().get_parent().do_something()` in child scripts; use signals.
- Avoid hardcoding absolute node paths like `/root/Main/Player`.
- Never execute physics movement code inside `_process()`.

## Workflow
1. Define data containers as Custom Resources.
2. Construct atomic scene nodes (e.g., `Player.tscn`).
3. Define typed signals for all outward notifications.
4. Connect child signals in parent orchestrator scenes.
5. Verify scene runs independently by pressing F6 in Godot.

## Expected Output
Clean GDScript code for Godot 4 with typed signals, 'Call Down, Signal Up' architecture, and custom `.tres` resources.

## Validation Checklist
- [ ] Does the script follow 'Call Down, Signal Up'?
- [ ] Are signals declared with explicit types?
- [ ] Does physics code live in `_physics_process`?
- [ ] Can the scene be run and tested in isolation (F6)?
- [ ] Are unique node names (`%Node`) or `@export` used for node lookups?

## Common Mistakes & Antipatterns
- Writing `get_node("../../UI/ScoreLabel").text = "100"` from inside a coin script, making the coin crash if instanced in any other level without that exact node hierarchy.
- Forgetting `delta` in movement calculations, causing characters to move 10x faster on 144Hz monitors than 60Hz monitors.
- Connecting signals without disconnecting or verifying duplicate connections.

## Concrete Real-World Example
Scenario: A Godot 4 health component is tightly coupled to the UI by directly modifying a HUD label node, crashing whenever the enemy uses the health component.
Prompt: Decouple this Godot 4 health component using typed signals.
Application: The AI creates `HealthComponent.gd` extending `Node`, declares `signal health_changed(current: int, maximum: int)`, emits the signal on damage, and has the HUD subscribe to the signal from the parent level scene, allowing the component to be reused across both players and enemies.
