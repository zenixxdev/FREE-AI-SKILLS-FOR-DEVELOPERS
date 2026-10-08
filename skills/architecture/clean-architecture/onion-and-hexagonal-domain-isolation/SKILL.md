---
name: "onion-and-hexagonal-domain-isolation"
description: "Structuring maintainable enterprise applications using Clean / Onion Architecture, strict Dependency Inversion, Entity Enterprise Business Rules, and Use Case Interactors."
category: "architecture"
subcategory: "clean-architecture"
language: "agnostic"
framework: "none"
technology: "clean-architecture"
difficulty: "advanced"
tags: ["architecture", "clean-architecture", "onion-architecture", "domain-driven-design", "dependency-inversion"]
---

# Clean Architecture, Onion Architecture, and Domain Isolation

## Purpose
Instruct AI agents to author enterprise software structured in concentric Clean Architecture layers, ensuring domain rules remain completely decoupled from databases, UI, and external frameworks.

## When to Use
Use when designing enterprise core systems, long-lived applications, multi-channel software (serving Web, Mobile, CLI simultaneously), or domain-heavy business software.

## Inputs / Context
Business domain model, use cases, persistence needs, and delivery channels (HTTP, CLI, gRPC).

## Instructions
1. Enforce the Dependency Rule (Concentric Circles):
   - Source code dependencies must ONLY point inward toward higher-level policies.
   - Nothing in an inner circle can know anything at all about something in an outer circle (e.g., Domain Entities know nothing of Use Cases; Use Cases know nothing of Controllers or Databases).
2. The Four Concentric Layers:
   - Core / Entities: Enterprise business rules, domain invariants, value objects. Zero framework dependencies.
   - Use Cases (Application): Application-specific business rules, interactor workflows, orchestration. Declares Inbound and Outbound Port interfaces.
   - Interface Adapters: Converts data from use case format to external delivery format (Controllers, Presenters, Gateways, Repository Implementations).
   - Frameworks & Drivers (Infrastructure): Web frameworks (Express, Spring, FastAPI), database drivers (Postgres, Mongo), UI, third-party SDKs.
3. Crossing Boundaries with Polymorphism (Dependency Inversion):
   - When a Use Case needs to persist an entity, it does NOT import a database repository directly.
   - The Use Case declares an Interface (Outbound Port) in the inner layer: `interface UserRepository { save(user: User): Promise<void>; }`.
   - The outer Infrastructure layer implements this interface: `class PostgresUserRepository implements UserRepository`.
4. Decouple Data Transfer Objects (DTOs):
   - Never pass raw database models or HTTP request objects across layer boundaries; use plain DTOs or Value Objects.
5. Independent Testability:
   - The entire business logic (Entities and Use Cases) must be testable without starting a web server, database, or external network connection.

## Constraints / Rules
- Never import an outer-layer class or library into an inner-layer file.
- Never place SQL queries, ORM annotations, or HTTP status codes inside the Domain or Use Case layers.
- Avoid passing domain entities directly to the UI presentation layer; map through Presenter DTOs.

## Workflow
1. Define core domain Entities and value objects.
2. Formulate Use Case Interactors declaring Port interfaces.
3. Implement Controllers and Repository Adapters in Interface Adapter layer.
4. Configure framework routers and database connection drivers in Infrastructure.
5. Wire dependencies together in Composition Root.

## Expected Output
Clean Architecture package layout and code implementation demonstrating strict inward dependency flow, Port interfaces, and framework isolation.

## Validation Checklist
- [ ] Do all dependencies point strictly inward?
- [ ] Is the Domain layer 100% free of database and framework imports?
- [ ] Are external integrations defined as Port interfaces in the Application layer?
- [ ] Can all Use Cases be unit tested purely in memory with mock ports?
- [ ] Are DTOs used to pass data across architectural boundaries?

## Common Mistakes & Antipatterns
- Importing an ORM entity class (like TypeORM or Prisma) into the innermost Domain entity layer.
- Passing the Express `Request` and `Response` objects directly into a Use Case interactor.
- Calling a payment gateway API directly from inside a domain entity calculation.

## Concrete Real-World Example
Scenario: An enterprise payroll system needs to support both an Express web API and a batch CLI tool while allowing the database to migrate from MySQL to PostgreSQL.
Prompt: Structure this payroll system using Clean Architecture.
Application: The AI creates an inner `Domain` module with `Employee` and `PayrollCalculation`, an `Application` module with `CalculatePayrollUseCase` and `PayrollRepository` port, an `Infrastructure` module implementing `PostgresPayrollRepository`, and two lightweight driving adapters (`ExpressController` and `CliCommand`).
