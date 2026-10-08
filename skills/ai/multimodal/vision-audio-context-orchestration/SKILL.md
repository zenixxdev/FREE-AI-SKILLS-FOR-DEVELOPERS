---
name: "vision-audio-context-orchestration"
description: "Orchestrating multimodal LLM workflows incorporating high-resolution image analysis, audio transcripts, bounding box spatial grounding, and token budgeting."
category: "ai"
subcategory: "multimodal"
language: "python"
framework: "none"
technology: "multimodal-ai"
difficulty: "advanced"
tags: ["ai", "multimodal", "vision", "audio", "spatial-grounding", "bounding-boxes", "token-budgeting"]
---

# Multimodal Context Orchestration for Vision and Audio

## Purpose
Instruct AI agents to author applications that seamlessly combine text, high-resolution imagery, and audio streams, managing token costs and extracting spatially grounded insights.

## When to Use
Use when analyzing charts/diagrams, inspecting UI screenshots, processing scanned documents/receipts, or building multimodal voice assistants.

## Inputs / Context
Image/audio assets (URLs, Base64 buffers), prompt query, resolution budget, and expected output schema.

## Instructions
1. Image Pre-Processing and Token Budgeting:
   - High-resolution images consume large token counts (e.g., 1,000+ tokens per 1024x1024 image tile).
   - Resize images to standard maximum bounds (e.g., 1568px on longest edge) and convert to WebP or JPEG before sending to the model; never send uncompressed 50MB RAW or TIFF files.
   - Select detail level (`detail: "low"` for general classification, `detail: "high"` for small text/OCR).
2. Spatial Grounding and Normalized Bounding Boxes:
   - When asking multimodal models to locate objects, require normalized coordinates on a 0-1000 scale: `[ymin, xmin, ymax, xmax]`.
   - Normalized coordinates remain resolution-independent and allow frontend UI components to overlay highlight boxes accurately across responsive viewports.
3. Multi-Image Comparison and Sequence Context:
   - When presenting multiple images (e.g., before-and-after UI diffs, time-series camera frames), explicitly label each image in the message array: `Image 1: Baseline UI (v1.0)`, `Image 2: Modified UI (v1.1)`.
4. Audio Processing and Timestamp Grounding:
   - For audio workflows, transcribe audio with word-level or sentence-level timestamps (e.g., via Whisper).
   - Feed timestamps into the multimodal prompt context to enable precise audio-scrubbing links in the output response.
5. Handle Unreadable / Degraded Media Gracefully:
   - Instruct the model to report image blur, occlusion, or audio clipping explicitly rather than hallucinating illegible text.

## Constraints / Rules
- Never pass raw, uncompressed high-resolution images (> 20MB) to multimodal API endpoints.
- Do not ask models for pixel-exact coordinates without specifying the reference coordinate system.
- Avoid passing 50 images in a single request without verifying model context window limits.

## Workflow
1. Ingest image/audio and resize/compress to target token budget.
2. Encode image to Base64 data URL or upload to object storage.
3. Formulate prompt requesting normalized bounding boxes or timestamped audio extraction.
4. Parse structured vision response into domain models.
5. Render visual overlays on original media.

## Expected Output
Multimodal API integration pipeline supporting image optimization, normalized spatial bounding box extraction, and timestamped audio synthesis.

## Validation Checklist
- [ ] Are images resized and optimized before API transmission?
- [ ] Are spatial bounding boxes requested using normalized 0-1000 coordinates?
- [ ] Are multiple images labeled sequentially in the prompt context?
- [ ] Is token consumption calculated and bounded?
- [ ] Does the system gracefully flag unreadable or occluded media?

## Common Mistakes & Antipatterns
- Sending a 4000x3000 photo of a receipt, consuming thousands of tokens and timing out the HTTP request.
- Asking 'Where is the button?' without requesting normalized coordinates, receiving a vague text answer like 'in the upper middle' instead of programmatic coordinates.
- Assuming an audio transcription contains accurate speaker diarization without explicit multi-channel or diarization modeling.

## Concrete Real-World Example
Scenario: A quality assurance agent inspects automated UI screenshots to verify that an error alert banner appears when a login fails.
Prompt: Write a Python function using a multimodal LLM to detect the error banner and return its exact bounding box.
Application: The AI optimizes the screenshot to WebP, submits it with a schema requiring `banner_present: bool`, `error_text: str`, and `box_2d: [ymin, xmin, ymax, xmax]`, and verifies that the returned coordinates match the UI alert box.
