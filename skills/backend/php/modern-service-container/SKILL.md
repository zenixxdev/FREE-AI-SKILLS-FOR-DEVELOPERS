---
name: "modern-service-container"
description: "Architecting modern PHP 8.2+ backend services using strict typing, constructor property promotion, readonly classes, PSR-11 dependency injection, and native Attributes."
category: "backend"
subcategory: "php"
language: "php"
framework: "none"
technology: "php8"
difficulty: "intermediate"
tags: ["backend", "php", "php8", "dependency-injection", "psr-11", "readonly", "attributes"]
---

# Modern PHP 8+ Architecture with Dependency Injection and Attributes

## Purpose
Provide modern, strictly-typed PHP patterns that eliminate legacy antipatterns and leverage modern PHP 8.2+ features for type safety and clean service architecture.

## When to Use
Use when authoring modern PHP applications, microservices, Symfony/Laravel service layers, or PSR-compliant packages.

## Inputs / Context
Service interfaces, business requirements, configuration parameters, and external client specifications.

## Instructions
1. Enforce strict typing at the top of every PHP file using `declare(strict_types=1);`.
2. Utilize PHP 8+ Constructor Property Promotion and `readonly` classes for immutable DTOs and value objects (`final readonly class UserData`).
3. Leverage Native PHP Attributes for metadata and routing instead of legacy docblock annotations (`/** @Route(...) */`).
4. Design services against PSR-11 Container and PSR-14 Event Dispatcher standards; program to interfaces, not concrete implementations.
5. Use union types (`int|string`), intersection types (`Countable&Traversable`), and `match` expressions for exhaustive, type-safe conditional logic.
6. Replace magic getters/setters (`__get`, `__set`) with explicit typed methods or public readonly properties.
7. Wrap domain exceptions in strongly typed custom exception classes extending `\DomainException` or `\RuntimeException`.

## Constraints / Rules
- Never write PHP files without `declare(strict_types=1);`.
- Avoid the Service Locator antipattern (passing the DI container into business services); inject specific service interfaces instead.
- Never suppress errors using the `@` error control operator.

## Workflow
1. Define immutable Value Objects and DTOs using `final readonly class`.
2. Declare service contracts as explicit PHP interfaces.
3. Implement services using constructor property promotion for dependency injection.
4. Bind interfaces to implementations in the PSR-11 container configuration.
5. Verify code with PHPStan at Level 8 or 9.

## Expected Output
Modern, strictly typed PHP 8.2+ codebase utilizing readonly classes, native attributes, constructor promotion, and clean interface segregation.

## Validation Checklist
- [ ] Is `declare(strict_types=1);` present at the top of every file?
- [ ] Are immutable objects declared as `readonly`?
- [ ] Are dependencies injected as interfaces via constructors?
- [ ] Are match expressions used instead of verbose switch-case statements?
- [ ] Does PHPStan pass without errors at Level 8+?

## Common Mistakes & Antipatterns
- Using `mixed` or omitting type hints on method parameters and returns.
- Using docblock annotations like `@var` or `@return` instead of native PHP 8 types.
- Passing the entire DI container into a service, hiding the service's actual dependencies.

## Concrete Real-World Example
Scenario: A legacy PHP payment service uses untyped arrays for order data and accesses database connections via global static singletons.
Prompt: Modernize this payment gateway into strictly typed PHP 8.2 with dependency injection.
Application: The AI creates an immutable `PaymentRequest` readonly DTO, defines a `PaymentGatewayInterface`, implements `StripePaymentGateway` with constructor-injected credentials, and binds it via a PSR-11 container with strict type declarations.
