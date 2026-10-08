---
name: "event-driven-eventual-consistency"
description: "Architecting resilient microservices utilizing Event-Driven Architecture, the Transactional Outbox Pattern, Saga orchestration/choreography, and eventual consistency."
category: "architecture"
subcategory: "microservices"
language: "agnostic"
framework: "none"
technology: "microservices-event-driven"
difficulty: "advanced"
tags: ["architecture", "microservices", "event-driven", "saga-pattern", "transactional-outbox", "eventual-consistency"]
---

# Microservices Event-Driven Architecture and Eventual Consistency (Saga Pattern)

## Purpose
Instruct AI agents to author distributed microservice workflows that maintain data consistency across distributed database boundaries without blocking two-phase commits.

## When to Use
Use when designing distributed transactions across microservices (e.g., checkout spanning Order, Payment, Inventory, and Shipping services).

## Inputs / Context
Service boundaries, database per service, distributed transaction steps, failure compensation actions, and messaging broker.

## Instructions
1. Database-per-Service Principle:
   - Each microservice must own and encapsulate its own private database.
   - Microservices must NEVER access or query another service's database directly; all data exchange must occur via APIs or asynchronous event streams.
2. The Transactional Outbox Pattern:
   - When a service updates its database AND emits an event, doing both in separate steps creates a fatal dual-write inconsistency if the process crashes between the DB write and the message publish.
   - Solution: In the exact same database transaction as the business mutation, insert an event record into a local `outbox` table.
   - A dedicated Outbox Relay worker (or Change Data Capture / Debezium) tails the outbox table and reliably publishes events to the message broker (Kafka/RabbitMQ) with at-least-once delivery guarantees.
3. Distributed Transactions with the Saga Pattern:
   - Replace blocking two-phase commit (2PC) with the Saga Pattern: a sequence of local transactions where each step publishes an event triggering the next step.
   - Choreography: Services react to events autonomously without a central coordinator (best for simple 2-3 step workflows).
   - Orchestration: A dedicated Saga Orchestrator service commands participants what local transactions to execute and monitors progress (best for complex workflows).
4. Compensating Transactions (Rollback Mechanism):
   - If a step fails in a Saga (e.g., Payment declined at step 3), the Saga must execute explicit Compensating Transactions backwards to undo previous steps (e.g., release reserved inventory, cancel pending order).
5. Idempotent Event Consumers:
   - In distributed messaging, networks guarantee at-least-once delivery, meaning duplicate events WILL occur.
   - Every consumer must be idempotent: store processed message IDs to discard duplicates.

## Constraints / Rules
- Never share a single database across multiple independent microservices.
- Never write dual-writes (DB insert followed by message publish) without the Transactional Outbox pattern.
- Avoid building Sagas without defining explicit compensating transactions for every step.

## Workflow
1. Define service boundaries and private database schemas.
2. Implement local database transaction writing to business tables and `outbox` table.
3. Configure Outbox Relay to publish to message broker.
4. Author Saga Orchestrator managing forward steps and compensating rollback steps.
5. Implement idempotent message consumer handlers.

## Expected Output
Event-driven microservice specification and code implementing the Transactional Outbox pattern, Saga orchestrator state machine, and compensating rollback handlers.

## Validation Checklist
- [ ] Does each microservice own its own isolated database?
- [ ] Is the Transactional Outbox pattern used to prevent dual-write bugs?
- [ ] Are compensating transactions defined for every reversible Saga step?
- [ ] Are all message consumer event handlers idempotent?
- [ ] Is eventual consistency verified under simulated intermediate service crashes?

## Common Mistakes & Antipatterns
- Executing `db.orders.insert()` followed by `kafka.publish('order_created')`: the server crashes after the insert, leaving the order in the database while no other service ever hears about it.
- Building microservices that share a single unified PostgreSQL database, creating a distributed monolith with tight schema coupling.
- Assuming distributed events will never arrive out of order or more than once.

## Concrete Real-World Example
Scenario: An e-commerce purchase requires reserving inventory in the Inventory Service, charging a card in the Payment Service, and creating an order in the Order Service.
Prompt: Design a fault-tolerant Saga orchestration workflow with compensating transactions for this checkout sequence.
Application: The AI creates an `OrderSagaOrchestrator` that executes local transactions, publishes outbox events, handles payment failures by issuing a compensating `ReleaseInventoryCommand`, and records transaction state in an idempotent saga log.
