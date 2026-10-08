---
name: "fastapi-production-service"
description: "Architecting resilient, asynchronous FastAPI microservices with Pydantic v2 schemas, lifespan handlers, dependency injection, and database connection pooling."
category: "backend"
subcategory: "python"
language: "python"
framework: "fastapi"
technology: "pydantic-asyncpg"
difficulty: "intermediate"
tags: ["backend", "python", "fastapi", "pydantic", "asyncio", "lifespan", "dependency-injection"]
---

# Production FastAPI Service Architecture and Async Lifecycles

## Purpose
Provide concrete blueprints for building high-performance, asynchronous Python REST APIs utilizing modern FastAPI idioms, lifespan context managers, and strict type validation.

## When to Use
Use when creating new Python microservices, exposing machine learning models via REST APIs, or refactoring synchronous Flask/Django REST endpoints to async FastAPI.

## Inputs / Context
API requirements, data models, external integrations, authentication mechanisms, and database pool configuration.

## Instructions
1. Use FastAPI `lifespan` context manager on the `FastAPI` instance for startup and shutdown event handling (e.g., initializing connection pools and closing HTTP sessions), replacing deprecated `@app.on_event`.
2. Define request and response schemas using Pydantic v2 `BaseModel` with strict type annotations, field descriptions, and custom validators (`@field_validator`).
3. Leverage FastAPI's dependency injection system (`Depends()`) for database sessions, authentication context, and configuration objects.
4. Keep path operation functions asynchronous (`async def`) when calling async database drivers or HTTP clients; use standard `def` when calling synchronous/blocking libraries to allow FastAPI to execute them in an internal thread pool.
5. Standardize error responses using custom exception handlers and RFC 7807 Problem Details schemas.
6. Manage settings via `pydantic-settings` with environment variable overrides and `.env` parsing.
7. Integrate structured JSON logging with correlation/trace IDs injected via middleware.

## Constraints / Rules
- Never execute blocking I/O calls (e.g., `requests.get()`, `time.sleep()`) directly inside `async def` route handlers; use `httpx.AsyncClient` and `asyncio.sleep()`.
- Do not instantiate global database connection sessions; always yield sessions per request via dependencies.
- Never return raw database ORM entities directly in route responses; serialize through explicit Pydantic response models (`response_model=...`).

## Workflow
1. Define Pydantic request, response, and domain schemas.
2. Configure application lifespan context with database connection pool initialization.
3. Implement reusable service dependencies for auth and DB sessions.
4. Create modular APIRouter endpoints grouped by domain feature.
5. Add global exception handlers and correlation ID middleware.
6. Write integration tests using `httpx.AsyncClient` with `ASGITransport`.

## Expected Output
Modular FastAPI application code with lifespan management, Pydantic v2 schemas, async route handlers, and dependency-injected services.

## Validation Checklist
- [ ] Are startup/shutdown resources managed via `asynccontextmanager` lifespan?
- [ ] Are all blocking I/O calls isolated from the event loop?
- [ ] Are route responses filtered through explicit Pydantic response models?
- [ ] Is correlation ID middleware logging requests with unique trace identifiers?
- [ ] Are database sessions yielded and closed per-request using `Depends()`?

## Common Mistakes & Antipatterns
- Using `time.sleep()` inside an `async def` endpoint, completely freezing the single-threaded asyncio event loop for all concurrent users.
- Relying on deprecated `@app.on_event("startup")` handlers.
- Using `response_model_exclude_unset` inappropriately, accidentally leaking sensitive schema attributes.

## Concrete Real-World Example
Scenario: A FastAPI service crashes under load because synchronous `requests.post()` calls to a payment gateway block all incoming asyncio requests.
Prompt: Refactor this payment processing route to prevent event loop blocking and implement lifespan connection pooling.
Application: The AI creates an `httpx.AsyncClient` inside the application `lifespan` context manager, injects it into the route via `Depends()`, converts the route handler to async, and adds structured error handling with Pydantic v2 schemas.
