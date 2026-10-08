---
name: "node-event-loop-resilience"
description: "Building memory-efficient, resilient Node.js backend services leveraging streams, event loop lag monitoring, backpressure management, and graceful shutdown."
category: "backend"
subcategory: "javascript"
language: "javascript"
framework: "none"
technology: "nodejs"
difficulty: "advanced"
tags: ["backend", "javascript", "nodejs", "streams", "backpressure", "event-loop", "resilience"]
---

# Node.js Event Loop Resilience and Stream Processing

## Purpose
Instruct AI agents to author robust Node.js backend applications capable of processing massive file and network payloads without exceeding heap limits or blocking the event loop.

## When to Use
Use when building data export services, file ingestion pipelines, high-throughput proxy servers, or long-running worker processes in Node.js.

## Inputs / Context
Data source, processing pipeline, destination sinks, memory limit thresholds, and shutdown signals.

## Instructions
1. Always process large datasets using Node.js streams (`stream.pipeline` or `stream/promises`) rather than buffering entire payloads into V8 memory (`fs.readFile` or large JSON arrays).
2. Respect backpressure in custom readable/writable streams: pause reading when `stream.write()` returns `false`, and resume on the `'drain'` event.
3. Monitor Event Loop Lag using `perf_hooks.monitorEventLoopDelay()` to detect CPU starvation and shed load before the process becomes unresponsive.
4. Implement graceful process shutdown by trapping `SIGTERM` and `SIGINT`:
   - Stop accepting new inbound connections (`server.close()`).
   - Drain active HTTP requests and database connection pools with a hard timeout (e.g., 10 seconds).
   - Exit with status code 0.
5. Handle `uncaughtException` and `unhandledRejection` by logging fatal context to stderr and terminating the process safely (`process.exit(1)`), relying on process orchestrators (Kubernetes/systemd) to restart.
6. Offload heavy cryptographic hashing, image manipulation, or compression to Worker Threads (`worker_threads`).

## Constraints / Rules
- Never buffer an unbounded stream into memory via `data += chunk` without strict byte length caps.
- Never ignore `'error'` events on EventEmitter or stream instances, as an unhandled error event will immediately crash the Node.js process.
- Avoid synchronous filesystem or crypto calls (`fs.readFileSync`, `crypto.pbkdf2Sync`) in request handling paths.

## Workflow
1. Identify large data ingestion or export requirements.
2. Construct pipeline using `stream.pipeline` with transform streams for chunk-by-chunk processing.
3. Attach signal listeners for graceful shutdown.
4. Add event loop delay monitoring and health check endpoints.
5. Verify peak memory usage under simulated 1GB file processing.

## Expected Output
Memory-stable Node.js service code using streams, backpressure handling, and graceful shutdown hooks.

## Validation Checklist
- [ ] Are streams piped using `stream.pipeline` with error handling?
- [ ] Is backpressure handled properly on writable streams?
- [ ] Does the service shut down gracefully on `SIGTERM` without dropping active requests?
- [ ] Are CPU-heavy tasks delegated to worker threads?
- [ ] Are unhandled rejections captured and logged with structured context?

## Common Mistakes & Antipatterns
- Reading multi-gigabyte CSV exports into a single memory variable with `fs.readFile()`, causing `FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory`.
- Piping streams using `readable.pipe(writable)` without handling errors, causing silent resource leaks if either stream fails.
- Swallowing `uncaughtException` and continuing execution in a corrupted process state.

## Concrete Real-World Example
Scenario: An enterprise Node.js data migration service crashes with OOM when exporting 500,000 database records to S3 as compressed CSV.
Prompt: Refactor this memory-intensive export script to use Node.js streams with backpressure.
Application: The AI creates a database cursor stream, pipes it through a CSV transform stream and a Gzip stream directly into an S3 multipart upload stream using `stream.pipeline`, maintaining memory consumption below 60MB throughout.
