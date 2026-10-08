---
name: "spring-boot-domain-service"
description: "Developing robust Java enterprise applications using Spring Boot 3, declarative transaction boundaries, record DTOs, JPA repository best practices, and Problem Details."
category: "backend"
subcategory: "java"
language: "java"
framework: "spring-boot"
technology: "spring-boot-3"
difficulty: "advanced"
tags: ["backend", "java", "spring-boot", "jpa", "transactions", "dto", "records"]
---

# Spring Boot 3 Enterprise Service Architecture and Transactions

## Purpose
Guide AI in authoring high-throughput Spring Boot 3 backend services with correct transactional isolation, N+1 query prevention, immutable DTOs, and standard REST responses.

## When to Use
Use when creating enterprise microservices with Spring Boot 3, implementing transactional workflows, or refactoring legacy Spring code.

## Inputs / Context
Business domain model, persistence requirements, transaction isolation rules, and REST endpoint contracts.

## Instructions
1. Standardize data transfer objects using Java 21+ `record` types for immutability and concise syntax.
2. Apply `@Transactional(readOnly = true)` at the class level for service classes; apply `@Transactional` explicitly only to write/mutation methods.
3. Prevent JPA N+1 query problems by using `@EntityGraph`, JOIN FETCH queries, or Spring Data projections.
4. Separate REST Controller layer from Service layer: controllers handle HTTP parameter binding and validation (`@Valid`), while services encapsulate domain logic.
5. Implement global exception handling using `@RestControllerAdvice` and RFC 7807 `ProblemDetail` responses.
6. Use constructor-based dependency injection (preferably via Lombok `@RequiredArgsConstructor` or explicit final field constructors); avoid field injection via `@Autowired`.
7. Configure database connection pool (HikariCP) with explicit maximum pool size, connection timeout, and validation intervals.
8. Externalize configuration using `@ConfigurationProperties` with validation (`@Validated`) rather than scattered `@Value` annotations.

## Constraints / Rules
- Never use field injection (`@Autowired private MyService myService;`); always use constructor injection.
- Never call a `@Transactional` method from within the same class (self-invocation), as Spring's AOP proxy will not intercept the call and no transaction will be started.
- Avoid returning raw JPA Entities directly from `@RestController` methods; always map to immutable record DTOs.

## Workflow
1. Define JPA entities with appropriate indexes and fetch strategies (`FetchType.LAZY` on associations).
2. Create Spring Data JPA repositories with query specifications.
3. Implement Service layer with declarative `@Transactional` boundaries.
4. Author REST controllers consuming and returning Java record DTOs.
5. Create `@RestControllerAdvice` mapping domain exceptions to `ProblemDetail`.
6. Write integration tests using `@DataJpaTest` and `@SpringBootTest` with Testcontainers.

## Expected Output
Clean Spring Boot 3 application code with constructor injection, record DTOs, transactional service boundaries, and RFC 7807 error handling.

## Validation Checklist
- [ ] Are all dependencies injected via constructors?
- [ ] Are DTOs modeled as immutable Java records?
- [ ] Is `readOnly = true` configured on read operations to optimize database snapshots?
- [ ] Are all JPA relations configured with `FetchType.LAZY`?
- [ ] Does global exception handling return standard `ProblemDetail` responses?

## Common Mistakes & Antipatterns
- Using `FetchType.EAGER` on `@OneToMany` or `@ManyToMany` relations, causing massive unexpected database joins and performance degradation.
- Self-invoking `@Transactional` methods within the same bean, leading to silent transaction rollback failures.
- Leaving `@Transactional` on methods that perform slow external HTTP calls, holding database connections open unnecessarily.

## Concrete Real-World Example
Scenario: A Spring Boot banking transfer endpoint suffers from lock timeouts and occasional double-spending under concurrent requests.
Prompt: Refactor this money transfer endpoint for transactional integrity, idempotency, and proper exception handling.
Application: The AI isolates the transfer method with `@Transactional(isolation = Isolation.REPEATABLE_READ)`, applies optimistic locking via `@Version` on the Account entity, verifies debit/credit balances atomically, maps exceptions to RFC 7807 `ProblemDetail`, and maps responses to an immutable `TransferResponse` record.
