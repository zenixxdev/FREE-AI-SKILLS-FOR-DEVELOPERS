---
name: "gameplay-framework-cpp-blueprints"
description: "Architecting scalable Unreal Engine games utilizing the Gameplay Framework (GameMode, GameState, PlayerController, Character), C++ performance, and Blueprint visual scripting."
category: "game-development"
subcategory: "unreal-engine"
language: "cpp"
framework: "unreal-engine"
technology: "unreal-engine-5"
difficulty: "advanced"
tags: ["game-development", "unreal-engine", "cpp", "blueprints", "gameplay-framework", "ue5"]
---

# Unreal Engine Gameplay Framework in C++ and Blueprints

## Purpose
Instruct AI agents to author robust Unreal Engine 5 gameplay code that respects the engine's canonical Gameplay Framework hierarchy and cleanly balances C++ for performance with Blueprints for iteration.

## When to Use
Use when architecting Unreal Engine 5 games, building character controllers, implementing multiplayer networking foundations, or designing game rules.

## Inputs / Context
Game genre, multiplayer requirements (server vs client), character capabilities, and game state rules.

## Instructions
1. Adhere Strictly to the Unreal Gameplay Framework Roles:
   - `AGameModeBase` / `AGameMode`: Exists ONLY on the server in multiplayer. Enforces game rules, win/loss conditions, player spawning, and match flow.
   - `AGameStateBase` / `AGameState`: Replicated to all clients. Tracks global game data (score, match timer, active objectives).
   - `APlayerController`: Represents the human player interface. Possesses a Pawn/Character. Exists on the owning client and the server. Handles UI, input bindings, and camera control.
   - `APlayerState`: Replicated to all clients. Tracks individual player statistics (player name, ping, score, health).
   - `APawn` / `ACharacter`: The physical avatar in the 3D world.
2. C++ Base, Blueprint Leaf Architecture:
   - Write core systems, mathematical algorithms, networking logic, and performance-critical loops in C++.
   - Expose properties using `UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "...")`.
   - Expose functions using `UFUNCTION(BlueprintCallable, Category = "...")`.
   - Create Blueprint subclasses of C++ classes for visual design, audio assignments, and animation setup.
3. Optimize Ticking (`Tick` Function):
   - Disable ticking (`PrimaryActorTick.bCanEverTick = false;`) on all Actors and Components that do not strictly require per-frame updates.
   - Use timers (`FTimerManager::SetTimer`) or event-driven architecture instead of polling inside `Tick`.
4. Memory Management and Garbage Collection:
   - Always decorate `UObject` and `AActor` raw pointers with `UPROPERTY()` to prevent the Unreal Garbage Collector from prematurely recycling active references.
   - Use `TWeakObjectPtr<T>` when referencing objects without owning them to avoid dangling pointers.

## Constraints / Rules
- Never write game-rule enforcement logic inside `ACharacter` or `APlayerController` in multiplayer games; game rules belong exclusively in `AGameMode`.
- Never execute heavy algorithmic loops in Blueprint graphs when C++ is appropriate.
- Avoid leaving `bCanEverTick = true` on static or event-driven actors.

## Workflow
1. Create C++ base classes inheriting from `ACharacter`, `APlayerController`, `AGameModeBase`.
2. Declare gameplay properties with `UPROPERTY` and functions with `UFUNCTION`.
3. Disable `Tick` on non-ticking classes.
4. Derive Blueprint classes from C++ base classes and assign mesh/sound assets in editor.
5. Verify multiplayer replication and frame rates using `stat unit`.

## Expected Output
High-performance Unreal Engine C++ header and source files adhering to the Gameplay Framework, exposed cleanly to Blueprints.

## Validation Checklist
- [ ] Are game roles mapped to correct Gameplay Framework classes?
- [ ] Are C++ properties exposed via `UPROPERTY` with proper categories?
- [ ] Is `PrimaryActorTick.bCanEverTick = false` configured on non-ticking actors?
- [ ] Are raw UObject pointers protected with `UPROPERTY()` against GC deletion?
- [ ] Is server-authoritative logic confined to GameMode and server functions?

## Common Mistakes & Antipatterns
- Putting game win conditions inside the client-side `APlayerController`, allowing clients to cheat or break multiplayer synchronization.
- Leaving `Tick()` enabled on 500 environmental actors, wasting CPU time evaluating empty tick functions every frame.
- Storing a raw C++ pointer to an Actor without `UPROPERTY()`, leading to random crashes when Unreal GC reclaims the memory.

## Concrete Real-World Example
Scenario: An Unreal Engine 5 shooter has severe frame drops and crashes randomly because 200 enemy spawn points have `Tick` enabled and store unmanaged raw C++ pointers.
Prompt: Refactor this enemy spawner system into C++ with proper memory management and event timers.
Application: The AI creates `AEnemySpawner : public AActor`, sets `bCanEverTick = false`, replaces per-frame polling with an `FTimerHandle` spawning cycle, stores references in `TArray<TWeakObjectPtr<AEnemyCharacter>>`, and exposes spawn parameters via `UPROPERTY` to Blueprints.
