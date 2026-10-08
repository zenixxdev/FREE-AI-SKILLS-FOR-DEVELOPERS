---
name: "protobuf-schema-evolution"
description: "Designing high-performance inter-service RPC APIs using Protocol Buffers v3, backward/forward compatible schema evolution rules, and gRPC interceptors."
category: "api"
subcategory: "grpc"
language: "protobuf"
framework: "grpc"
technology: "grpc-protobuf"
difficulty: "advanced"
tags: ["api", "grpc", "protobuf", "microservices", "schema-evolution", "rpc"]
---

# gRPC Service Architecture and Protocol Buffers Schema Evolution

## Purpose
Guide AI in designing high-throughput, backward-compatible gRPC service contracts, maintaining strict protobuf field numbering rules and interceptor pipelines.

## When to Use
Use when architecting internal microservice communication, polyglot service meshes, high-performance streaming pipelines, or latency-critical RPCs.

## Inputs / Context
Service domain model, RPC methods, message structures, versioning policy, and cross-cutting interceptor requirements.

## Instructions
1. Define services and messages using `syntax = "proto3";`.
2. Follow strict Protocol Buffers Backward and Forward Compatibility Rules:
   - NEVER change the numeric tag of an existing field.
   - NEVER reuse a deleted field number; mark obsolete field tags and names using `reserved` (e.g., `reserved 4, 7 to 9; reserved "foo", "bar";`).
   - New fields must always be optional (default in proto3); old servers must be able to parse messages from new clients by ignoring unknown fields.
   - NEVER change the data type of an existing field.
3. Group related messages into versioned packages (e.g., `package orders.v1;`).
4. Implement standard gRPC Interceptors for cross-cutting concerns:
   - Unary and Streaming Server Interceptors for correlation ID propagation, request logging, and authentication verification.
   - Client Interceptors for deadline/timeout enforcement and distributed tracing.
5. Always set explicit Deadlines (timeouts) on the client for every RPC call; propagate deadlines across downstream service hops via context.
6. Map business and domain errors to standard gRPC Status Codes (`NOT_FOUND`, `INVALID_ARGUMENT`, `ALREADY_EXISTS`, `UNAUTHENTICATED`, `PERMISSION_DENIED`, `DEADLINE_EXCEEDED`).
7. Enrich error responses using `google.rpc.Status` with structured error details (`BadRequest`, `PreconditionFailure`, `ErrorInfo`).

## Constraints / Rules
- Never remove or renumber existing protobuf field numbers without `reserved` declarations.
- Never make gRPC calls without configuring an explicit deadline/timeout.
- Do not use streaming RPCs when a standard unary call suffices.

## Workflow
1. Author `.proto` file with service definitions and message schemas.
2. Declare `reserved` tags for deprecated attributes.
3. Generate server and client stubs using `protoc` or `buf`.
4. Implement server handlers with deadline checking and gRPC status code mapping.
5. Configure client interceptors to inject deadlines and tracing headers.

## Expected Output
Clean `.proto` schema file adhering to proto3 evolution standards, along with server interceptor and error handling implementations.

## Validation Checklist
- [ ] Are proto files organized in versioned packages (`package domain.v1;`)?
- [ ] Are deleted field tags explicitly marked as `reserved`?
- [ ] Are client calls configured with explicit deadlines?
- [ ] Are domain errors mapped to standard `grpc/status` codes?
- [ ] Are generated stubs verified against breaking changes using `buf breaking`?

## Common Mistakes & Antipatterns
- Renumbering fields in a `.proto` file to make them consecutive, corrupting binary deserialization across existing running services.
- Omitting deadlines on client RPC calls, allowing a stalled downstream microservice to exhaust the calling service's thread pool.
- Returning generic `INTERNAL` status codes for all errors, hiding validation and authentication failures from callers.

## Concrete Real-World Example
Scenario: An internal payment microservice breaks existing checkout clients after an engineer changes the field tag of `amount_cents` from 2 to 3.
Prompt: Fix this protobuf schema breaking change and establish schema evolution guidelines for this service.
Application: The AI restores `amount_cents` to tag 2, marks tag 3 as `reserved`, adds a `buf.yaml` lint and breaking-change detection configuration, and documents field immutability rules for future migrations.
