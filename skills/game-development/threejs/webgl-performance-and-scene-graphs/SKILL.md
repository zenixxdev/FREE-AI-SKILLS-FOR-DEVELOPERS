---
name: "webgl-performance-and-scene-graphs"
description: "Architecting high-performance 3D web experiences using Three.js, instanced meshes (InstancedMesh), geometry disposal, shader materials, and draw-call reduction."
category: "game-development"
subcategory: "threejs"
language: "javascript"
framework: "threejs"
technology: "webgl-threejs"
difficulty: "advanced"
tags: ["game-development", "threejs", "webgl", "3d", "performance", "instancing", "shaders"]
---

# Three.js Scene Graph Architecture and WebGL Render Optimization

## Purpose
Instruct AI agents to author 3D browser graphics in Three.js that minimize WebGL draw calls, manage GPU memory disposal, and maintain consistent 60 FPS on mobile and desktop.

## When to Use
Use when creating interactive 3D product visualizers, WebGL web games, data visualizations, or virtual environments.

## Inputs / Context
3D scene requirements, asset models (glTF/GLB), lighting setup, animation loop, and target hardware constraints.

## Instructions
1. Minimize WebGL Draw Calls using `InstancedMesh`:
   - Never render hundreds or thousands of individual `Mesh` objects sharing the same geometry and material; each Mesh triggers an expensive CPU-GPU draw call.
   - Use `THREE.InstancedMesh` to render tens of thousands of object instances in a single draw call, updating transforms via 4x4 transformation matrices.
2. Prevent GPU Memory Leaks with Explicit Resource Disposal:
   - JavaScript Garbage Collection does NOT free WebGL GPU memory.
   - When removing objects, always explicitly call:
     * `geometry.dispose()`
     * `material.dispose()`
     * `texture.dispose()`
3. Optimize Geometry and Textures:
   - Use Draco or Meshopt-compressed glTF (`.glb`) models.
   - Keep texture dimensions to powers of two (e.g., 512x512, 1024x1024, 2048x2048) for GPU mipmapping.
   - Set texture anisotropy conditionally based on device capability.
4. Optimize Shadow Maps:
   - Restrict shadow-casting lights to 1 or 2 directional lights; disable `castShadow` and `receiveShadow` on non-essential decorative meshes.
   - Size shadow map resolutions prudently (1024x1024 or 2048x2048).
5. Animation Loop Discipline:
   - Never instantiate objects (`new THREE.Vector3()`, `new THREE.Matrix4()`) inside the `requestAnimationFrame` loop. Pre-allocate temporary scratch variables outside the loop to avoid continuous GC thrashing.
6. Handle Viewport Resize and High-DPI Displays:
   - Cap `renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))`: rendering at 3x or 4x pixel density on ultra-high-res screens destroys mobile GPU fill rate with zero perceptible visual gain.

## Constraints / Rules
- Never create new geometry, material, or vector instances inside the render loop.
- Never remove a mesh from the scene without calling `.dispose()` on its geometry and materials.
- Do not set `pixelRatio` higher than 2.

## Workflow
1. Initialize Three.js Scene, Camera, WebGLRenderer with capped pixel ratio.
2. Pre-allocate scratch vectors for animation loops.
3. Group repeated meshes into `InstancedMesh`.
4. Implement clean disposal function for scene unmount.
5. Monitor draw calls and triangles using `renderer.info`.

## Expected Output
High-performance Three.js 3D application code featuring InstancedMesh batching, pre-allocated scratch math objects, and complete GPU memory disposal.

## Validation Checklist
- [ ] Are repetitive meshes grouped into `InstancedMesh`?
- [ ] Are geometries, materials, and textures explicitly disposed of?
- [ ] Is `renderer.setPixelRatio` capped at `Math.min(window.devicePixelRatio, 2)`?
- [ ] Are vector and matrix allocations kept outside the animation loop?
- [ ] Does `renderer.info.render.calls` verify minimal draw calls (< 50)?

## Common Mistakes & Antipatterns
- Creating 2,000 individual `new THREE.Mesh()` objects for a particle field or forest, triggering 2,000 draw calls and reducing frame rates to 5 FPS.
- Removing a 3D model from the scene via `scene.remove(mesh)` without calling `.dispose()`, causing hundreds of megabytes of GPU VRAM to leak.
- Calling `new THREE.Vector3()` in the render loop running 60 times a second, triggering massive Garbage Collection stutters.

## Concrete Real-World Example
Scenario: An interactive 3D product showcase renders 500 screws and bolts as individual meshes, causing 500 draw calls and heating up mobile devices.
Prompt: Optimize this Three.js scene to render 500 identical bolts efficiently.
Application: The AI converts the individual meshes into a single `THREE.InstancedMesh(boltGeometry, boltMaterial, 500)`, computes positions using pre-allocated matrix scratchpads, caps pixel ratio at 2, reducing draw calls from 500 to 1 and elevating frame rate to 60 FPS.
