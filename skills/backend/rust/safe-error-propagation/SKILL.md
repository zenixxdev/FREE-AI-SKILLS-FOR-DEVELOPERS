---
name: "safe-error-propagation"
description: "Designing robust, panic-free Rust backend services utilizing `Result<T, E>`, `Option<T>`, `thiserror` for library domains, and `anyhow` for application orchestration."
category: "backend"
subcategory: "rust"
language: "rust"
framework: "none"
technology: "rust"
difficulty: "advanced"
tags: ["backend", "rust", "error-handling", "result", "thiserror", "anyhow", "type-safety"]
---

# Rust Safe Error Propagation and Domain Modeling with Thiserror

## Purpose
Provide concrete rules for structuring idiomatic Rust error hierarchies, ensuring all failure modes are explicit, strongly typed, and handled without unexpected runtime panics.

## When to Use
Use when developing Rust libraries, backend services, network daemons, or CLI tools where reliability and zero crashes are mandatory.

## Inputs / Context
Domain entities, fallible operations (I/O, parsing, network), third-party error types, and public API boundary contracts.

## Instructions
1. Distinguish between expected domain failures (modeled via `Result<T, E>`) and irrecoverable programmatic bugs (asserts/panics).
2. For domain and service boundaries, define explicit, typed error enums using the `thiserror` derive macro (`#[derive(thiserror::Error, Debug)]`).
3. For top-level application binaries and CLI orchestrators, use `anyhow::Result<T>` with `.context("...")` to add operational troubleshooting context to error traces.
4. Propagate errors idiomatically using the `?` operator; implement `From<OtherError>` (or `#[from]` attribute in `thiserror`) for clean automatic error conversions.
5. Eliminate `.unwrap()` and `.expect()` calls in production library code; use `.ok_or()` or pattern matching with `if let` / `match` instead.
6. Make illegal states unrepresentable using Rust's rich type system: use enums for multi-state entities and newtypes for validated identifiers (e.g., `struct EmailAddress(String)`).
7. Ensure all error types implement `std::error::Error + Send + Sync + 'static` for seamless thread transfer and async task compatibility.

## Constraints / Rules
- Never call `.unwrap()` on fallible operations in production server code.
- Avoid using `Box<dyn std::error::Error>` across internal domain boundaries; prefer explicit typed enums.
- Do not discard underlying error causes; always chain root causes via `#[source]`.

## Workflow
1. Enumerate all potential failure modes for the domain module.
2. Construct a typed error enum with `#[derive(thiserror::Error)]` and descriptive messages.
3. Return `Result<T, DomainError>` from all fallible service functions.
4. Use `?` operator for clean propagation and `.context()` for entrypoint logging.
5. Verify via `cargo check` and `cargo clippy` with strict linting rules.

## Expected Output
Panic-free, idiomatic Rust code featuring strongly typed error enums, seamless `?` propagation, and rich context diagnostics.

## Validation Checklist
- [ ] Are all fallible paths returning `Result<T, E>` without `.unwrap()`?
- [ ] Are domain errors categorized via typed `thiserror` enums?
- [ ] Do errors chain root causes via `#[source]` or `#[from]`?
- [ ] Are top-level application errors enriched with `anyhow::Context`?
- [ ] Does `cargo clippy -- -D warnings` pass cleanly?

## Common Mistakes & Antipatterns
- Sprinkling `.unwrap()` throughout request parsing code, causing the entire web worker thread or service to panic when given malformed JSON.
- Using stringly-typed errors (`Err("Something went wrong".to_string())`) which cannot be inspected or matched programmatically.
- Swallowing error sources, destroying stack context when diagnosing production outages.

## Concrete Real-World Example
Scenario: A Rust microservice parsing config files and querying Postgres crashes at startup due to `.unwrap()` calls on missing environment variables.
Prompt: Refactor this Rust configuration loader to use robust error handling with `thiserror` and `anyhow`.
Application: The AI defines a `ConfigError` enum with `thiserror` handling missing env vars, invalid port numbers, and database connection failures, replaces `.unwrap()` with `?`, and adds rich `.with_context(|| format!("failed loading {}", path))` in the main startup sequence.
