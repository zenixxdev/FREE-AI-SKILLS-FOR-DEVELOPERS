---
name: "idiomatic-concurrency-patterns"
description: "Architecting high-throughput Go backend services utilizing goroutines, buffered channels, sync.ErrGroup, context propagation, and graceful worker pools."
category: "backend"
subcategory: "go"
language: "go"
framework: "none"
technology: "golang"
difficulty: "advanced"
tags: ["backend", "go", "golang", "concurrency", "goroutines", "channels", "context", "errgroup"]
---

# Idiomatic Go Concurrency, Context Cancellation, and Channels

## Purpose
Instruct AI agents to author leak-free, idiomatic Go concurrent systems with deterministic lifecycle management, context propagation, and thread-safe data access.

## When to Use
Use when writing Go microservices, concurrent worker pools, batch processors, stream aggregators, or CLI tools requiring parallel execution.

## Inputs / Context
Task throughput requirements, concurrency limits, timeout boundaries, and downstream service dependencies.

## Instructions
1. Always pass `context.Context` as the first argument in functions performing I/O or launching goroutines; never store a Context in a struct.
2. Manage concurrent goroutine lifecycles and error propagation using `golang.org/x/sync/errgroup` with context cancellation.
3. Prevent goroutine leaks: every spawned goroutine must have an explicit termination condition (channel closure, context cancellation, or worker exit signal).
4. Implement bounded worker pools using buffered job channels to control memory consumption and downstream resource saturation.
5. Handle channel communication safely:
   - Only the sender should close a channel, never the receiver.
   - Never send on a closed channel (panics).
   - Use `select` with `ctx.Done()` to prevent blocking indefinitely on channel sends or receives.
6. Protect shared mutable state using `sync.Mutex` or `sync.RWMutex`; prefer passing ownership via channels when possible ('Do not communicate by sharing memory; instead, share memory by communicating').
7. Always check and propagate errors explicitly; wrap errors with context using `fmt.Errorf("operation failed: %w", err)` to preserve error chains for `errors.Is` and `errors.As`.

## Constraints / Rules
- Never launch fire-and-forget goroutines (`go func() { ... }()`) without tracking via `sync.WaitGroup` or `errgroup.Group`.
- Never use `context.Background()` deep inside business logic; propagate caller context.
- Avoid package-level global variables for state management.

## Workflow
1. Define worker contract accepting `context.Context` and typed data.
2. Initialize `errgroup.WithContext(ctx)` with a concurrency limit (`eg.SetLimit(n)`).
3. Feed tasks into the pool, capturing errors on completion.
4. Handle system shutdown signals (`signal.NotifyContext`) to trigger graceful teardown.
5. Validate with Go race detector (`go test -race ./...`).

## Expected Output
Idiomatic, race-free Go concurrency code featuring context cancellation, bounded worker pools, explicit error wrapping, and clean channel semantics.

## Validation Checklist
- [ ] Is `context.Context` propagated to all goroutines and I/O calls?
- [ ] Are goroutine lifetimes bounded and guaranteed to terminate?
- [ ] Is `go test -race` passing with zero data races detected?
- [ ] Are errors wrapped using the `%w` verb for chain inspection?
- [ ] Are channels closed only by the sending goroutine?

## Common Mistakes & Antipatterns
- Spawning an unbounded number of goroutines inside an HTTP handler loop: `for _, item := range items { go process(item) }`, exhausting file descriptors under load.
- Creating a goroutine that sends to an unbuffered channel without a reader, hanging forever and leaking memory.
- Closing a channel from multiple consumer goroutines, triggering fatal panics.

## Concrete Real-World Example
Scenario: A Go web scraper crashes the server with thousands of open sockets when given a large list of URLs.
Prompt: Refactor this Go scraper into a bounded worker pool that respects cancellation and reports the first failure.
Application: The AI creates an `errgroup.Group` with `eg.SetLimit(10)`, iterates over URLs checking `ctx.Err()`, makes requests with context-aware `http.NewRequestWithContext`, wraps errors with `fmt.Errorf`, and collects results deterministically.
