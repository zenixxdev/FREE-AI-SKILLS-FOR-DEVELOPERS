---
name: "hexagonal-backend-architecture"
description: "Structuring clean, testable TypeScript backend services using Hexagonal Architecture (Ports and Adapters) with pure domain logic decoupled from frameworks and infrastructure."
category: "backend"
subcategory: "typescript"
language: "typescript"
framework: "none"
technology: "typescript"
difficulty: "advanced"
tags: ["backend", "typescript", "hexagonal-architecture", "clean-architecture", "ports-and-adapters", "domain-driven-design"]
---

# Hexagonal Ports and Adapters Backend Architecture in TypeScript

## Purpose
Provide architectural discipline for decoupling core business rules from external technologies (databases, HTTP frameworks, message brokers) using TypeScript interfaces and dependency inversion.

## When to Use
Use when architecting long-lived enterprise backends, core domain business engines, or microservices that must support interchangeable storage backends or test doubles.

## Inputs / Context
Domain entities, business rules, primary driven actors (database, third-party APIs), and primary driving actors (HTTP controllers, CLI, queues).

## Instructions
1. Organize code into three distinct concentric layers:
   - Domain Layer: Entities, Value Objects, Domain Errors, and pure business invariants. Zero dependencies on external libraries or frameworks.
   - Application Layer: Use Cases / Command Handlers and Port interfaces (inbound and outbound).
   - Infrastructure Layer: Adapters implementing Port interfaces (PostgreSQL repository, Stripe payment adapter, Express/Fastify HTTP controllers).
2. Inbound Ports: Define TypeScript interfaces for use cases consumed by Driving Adapters (e.g., `RegisterUserUseCase`).
3. Outbound Ports: Define TypeScript interfaces for external dependencies required by the domain (e.g., `UserRepository`, `NotificationGateway`).
4. Outbound Adapters: Implement outbound ports inside the infrastructure layer using concrete technologies (e.g., `PostgresUserRepository implements UserRepository`).
5. Invert dependencies: Domain and Application layers must never import code from the Infrastructure layer.
6. Assemble dependencies at the application entrypoint (Composition Root) using dependency injection containers or manual constructor injection.
7. Express domain errors as distinct classes extending a base `DomainError` rather than HTTP status codes.

## Constraints / Rules
- Never import ORM models (Prisma, TypeORM, Mongoose) or HTTP objects (Express `Request`, `Response`) inside the Domain or Application layers.
- Do not allow infrastructure details (like SQL column names or JSON field formats) to dictate domain entity properties.
- Avoid circular dependencies between domain modules.

## Workflow
1. Define core domain entities and value objects with internal validation.
2. Declare Outbound Port interfaces for data persistence and external integrations.
3. Write Application Use Cases implementing business workflows via Port interfaces.
4. Implement Infrastructure Adapters (ORM repos, HTTP clients) satisfying the Port interfaces.
5. Bind adapters to use cases in the application entrypoint Composition Root.
6. Write unit tests for use cases by mocking port interfaces in memory without databases.

## Expected Output
Modular TypeScript codebase organized by Domain, Application, and Infrastructure layers, with complete Port interfaces and zero framework leakage into domain models.

## Validation Checklist
- [ ] Are Domain and Application layers completely free of framework and database imports?
- [ ] Are all external integrations represented as Outbound Port interfaces?
- [ ] Are Use Cases testable in memory using mock repositories without Docker or DBs?
- [ ] Is dependency wiring consolidated in a single Composition Root?
- [ ] Are domain errors decoupled from HTTP status codes?

## Common Mistakes & Antipatterns
- Coupling domain models to ORM decorators (like TypeORM `@Entity()` or `@Column()`), polluting pure business logic with database metadata.
- Passing HTTP `req` and `res` objects directly into use cases or service methods.
- Defining outbound port interfaces inside the infrastructure folder instead of the application layer.

## Concrete Real-World Example
Scenario: An e-commerce service has order processing logic tightly coupled to Express controllers and raw MongoDB queries, making it impossible to test without a live database.
Prompt: Refactor this order checkout flow into Hexagonal Architecture using TypeScript.
Application: The AI creates an `Order` domain entity with validation methods, defines an `OrderRepository` outbound port and `CheckoutUseCase` inbound port, implements `MongoOrderRepository` in infrastructure, and wires them together cleanly at the composition root.
