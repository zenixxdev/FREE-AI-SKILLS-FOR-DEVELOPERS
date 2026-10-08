---
name: "openapi-specification-design"
description: "Designing comprehensive OpenAPI 3.1 (Swagger) specifications with strict JSON Schema schemas, reusable components, error responses, and mock servers."
category: "documentation"
subcategory: "api-docs"
language: "yaml"
framework: "openapi"
technology: "openapi-3.1"
difficulty: "intermediate"
tags: ["documentation", "api-docs", "openapi", "swagger", "rest-api", "json-schema"]
---

# OpenAPI 3.1 Specification Design and Interactive Documentation

## Purpose
Instruct AI agents to author complete, accurate OpenAPI 3.1 specification files that enable interactive API documentation, automated SDK generation, and mock servers.

## When to Use
Use when designing REST API contracts, documenting microservice endpoints, configuring Swagger UI / Redoc, or generating client SDKs via OpenAPI Generator.

## Inputs / Context
API endpoints, HTTP methods, path/query parameters, request/response JSON schemas, authentication schemes, and status codes.

## Instructions
1. Standardize on OpenAPI 3.1.0:
   - Use `openapi: 3.1.0` for full JSON Schema alignment (allowing standard `type: ["string", "null"]`, `$defs`, and pattern properties).
2. Modularize using Reusable `components`:
   - Never duplicate schema structures inline across multiple paths.
   - Define reusable schemas under `components/schemas/` (e.g., `User`, `ErrorResponse`, `PaginationMeta`).
   - Define reusable security schemes under `components/securitySchemes/` (Bearer JWT, APIKey, OAuth2).
   - Define reusable HTTP responses under `components/responses/` (e.g., `NotFound`, `Unauthorized`).
3. Document All Possible HTTP Status Codes:
   - Every path must document not only 200/201 Success, but also expected client and server error codes:
     * `400 Bad Request` (Validation errors).
     * `401 Unauthorized` (Missing or invalid auth token).
     * `403 Forbidden` (Insufficient permissions).
     * `404 Not Found` (Resource missing).
     * `429 Too Many Requests` (Rate limit exceeded).
4. Provide Realistic Examples:
   - Always include realistic `example` or `examples` blocks for request bodies and response payloads; avoid useless generic placeholders like `"string"` or `0`.
5. Strict Parameter Typing and Descriptions:
   - Include clear `description` strings on every parameter explaining format, constraints, and valid ranges.

## Constraints / Rules
- Never write an OpenAPI specification without documenting error responses (4xx, 5xx).
- Avoid inline duplicate schema declarations; use `$ref: '#/components/schemas/...'`.
- Do not omit authentication requirements on protected endpoints.

## Workflow
1. Declare OpenAPI header with title, version, and server URLs.
2. Define security schemes under components.
3. Author reusable data models under `components/schemas`.
4. Define path operations with parameter bindings and `$ref` responses.
5. Validate specification using `spectral lint openapi.yaml`.

## Expected Output
Complete, valid OpenAPI 3.1 YAML specification file with modular components, realistic examples, and comprehensive status code schemas.

## Validation Checklist
- [ ] Is OpenAPI version set to 3.1.0?
- [ ] Are data models centralized in `components/schemas` with `$ref`?
- [ ] Are all standard error status codes (400, 401, 403, 404) documented?
- [ ] Do request and response schemas include realistic examples?
- [ ] Does Spectral linter validate the specification with zero errors?

## Common Mistakes & Antipatterns
- Documenting only the 200 OK response, leaving API consumers to guess what error format is returned on validation failures.
- Providing schemas where every example string is `"string"`, making interactive Swagger UI documentation useless for developer testing.
- Forgetting to link the security scheme to endpoints (`security: - BearerAuth: []`).

## Concrete Real-World Example
Scenario: A payment gateway REST API has no machine-readable documentation, making it difficult for mobile developers to integrate and generate client SDKs.
Prompt: Author an OpenAPI 3.1 specification for a payment charge and refund endpoint.
Application: The AI creates a modular `openapi.yaml` file defining `ChargeRequest` and `ChargeResponse` under components, documents idempotency headers, includes realistic card and amount examples, defines error responses conforming to RFC 7807, and binds Bearer token authentication.
