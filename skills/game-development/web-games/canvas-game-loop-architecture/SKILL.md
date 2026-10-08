---
name: "canvas-game-loop-architecture"
description: "Building performant 2D browser games using HTML5 Canvas, fixed time-step game loops, sprite atlas batching, spatial hashing, and keyboard/touch input managers."
category: "game-development"
subcategory: "web-games"
language: "javascript"
framework: "none"
technology: "html5-canvas"
difficulty: "intermediate"
tags: ["game-development", "web-games", "canvas", "html5", "game-loop", "sprite-batching", "spatial-hash"]
---

# HTML5 Canvas 2D Game Loop Architecture and Sprite Batching

## Purpose
Provide AI agents with standards for creating robust, frame-rate independent 2D games running directly on native HTML5 Canvas without heavy external engines.

## When to Use
Use when building lightweight 2D web games, casual browser games, gamified interactive dashboards, or educational simulations.

## Inputs / Context
Game canvas element, game entities, physics rules, sprite sheets, and user controls.

## Instructions
1. Implement a Fixed Time-Step Game Loop with Variable Render (Accumulator Pattern):
   - Never tie physics simulation directly to `requestAnimationFrame` delta time, as variable frame rates cause physics tunneling and instability.
   - Use a fixed physics time-step (e.g., 60 updates/sec = 16.66ms) with an accumulator:
     * Add elapsed time to accumulator.
     * While accumulator >= fixedDelta, update physics by fixedDelta and decrement accumulator.
     * Render the visual state once per frame using interpolation.
2. Use Single Sprite Sheets / Texture Atlases:
   - Combine all game sprites into a single image sheet; draw sprites using `ctx.drawImage(atlas, sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight)` to eliminate image loading lag and context switching.
3. Optimize Canvas Rendering:
   - Clear only dirty screen regions or use `ctx.clearRect(0, 0, width, height)` cleanly.
   - Round coordinate positions to whole integers (`Math.round(x)`) before drawing; drawing on fractional pixels triggers expensive sub-pixel anti-aliasing.
   - Use OffscreenCanvas for pre-rendering static backgrounds or complex procedural terrain.
4. Spatial Hashing for Fast 2D Collision Detection:
   - Replace O(n²) all-pairs collision checking with a 2D Spatial Hash Grid to only test entities occupying the same spatial cell.
5. State-Driven Input Handling:
   - Track key presses and touch coordinates in an input manager holding boolean state maps; read input state inside the update loop rather than executing game logic inside raw DOM event listeners.

## Constraints / Rules
- Never calculate physics directly using unconstrained variable delta times.
- Avoid drawing on fractional pixel coordinates in Canvas 2D.
- Do not load individual image files for every single game animation frame.

## Workflow
1. Initialize Canvas and handle Retina/DPI scaling.
2. Implement input listener updating state maps.
3. Construct fixed time-step game loop with accumulator.
4. Build spatial hash grid for collision checks.
5. Render sprite atlas frames with rounded integer coordinates.

## Expected Output
Modular 2D HTML5 Canvas game engine implementation featuring a fixed time-step loop, sprite sheet renderer, and spatial hash collision detection.

## Validation Checklist
- [ ] Is physics updated using a fixed time-step accumulator?
- [ ] Are sprites rendered from a unified sprite sheet atlas?
- [ ] Are drawing coordinates rounded to integers to prevent sub-pixel blur?
- [ ] Is collision detection accelerated using spatial partitioning?
- [ ] Does gameplay speed remain identical on 60Hz, 120Hz, and 144Hz monitors?

## Common Mistakes & Antipatterns
- Updating physics with `x += speed * dt` where `dt` is variable, causing characters to fall through floors when the browser stutters.
- Drawing sprites at floating-point coordinates like `(104.382, 219.841)`, forcing the browser CPU/GPU to anti-alias every edge and dropping frame rates.
- Adding hundreds of event listeners directly to window without central input buffering.

## Concrete Real-World Example
Scenario: A 2D canvas platformer game runs at double speed on 120Hz gaming laptops and allows players to jump through platforms when lag occurs.
Prompt: Refactor this HTML5 canvas game loop to use a fixed time-step accumulator.
Application: The AI implements a canonical Glenn Fiedler accumulator loop with a 16.6ms fixed step, isolates rendering to `requestAnimationFrame`, clamps max accumulator time to avoid 'spiral of death', and guarantees identical physics across all monitor refresh rates.
