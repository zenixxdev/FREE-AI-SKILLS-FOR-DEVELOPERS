---
name: "database-boundary-testing"
description: "Authoring reliable integration tests against real database engines using ephemeral Docker containers (Testcontainers), automated migrations, and transactional rollbacks."
category: "testing"
subcategory: "integration"
language: "agnostic"
framework: "none"
technology: "testcontainers"
difficulty: "advanced"
tags: ["testing", "integration", "testcontainers", "database", "postgres", "docker"]
---

# Database Boundary Integration Testing with Testcontainers

## Purpose
Instruct AI agents to author true integration tests that run against real database engines in isolated Docker containers, verifying actual SQL queries, constraints, and migration scripts.

## When to Use
Use when testing database repositories, complex SQL queries, migrations, foreign key cascades, or ORM mapping configurations.

## Inputs / Context
Database migration scripts, repository interface, sample seed fixtures, and test suite runner.

## Instructions
1. Test against real database engines: never substitute an in-memory database (like H2 or SQLite) when testing code targeted for PostgreSQL or MySQL in production; dialect and locking differences invalidate tests.
2. Use Testcontainers to spin up ephemeral, lightweight container instances of the exact production database version.
3. Run all database migration scripts against the containerized database before the test suite begins.
4. Maintain Test Isolation between test cases:
   - Approach A (Transactional Rollback): Wrap each test in a database transaction and roll it back in the teardown phase (`ROLLBACK`).
   - Approach B (Table Truncation): Fast-truncate all tables between tests while preserving foreign key constraints and schema structure.
5. Test Real Database Constraints:
   - Unique index violations.
   - Foreign key cascading deletes and nullifications.
   - Check constraints and nullability constraints.
   - Database triggers and generated columns.
6. Seed minimal, targeted test data per test rather than relying on massive, fragile global seed scripts.
7. Optimize container startup: reuse container instances across test files using singleton container patterns or Testcontainers reusable container flags.

## Constraints / Rules
- Never run integration tests against a shared, persistent development or staging database where tests can overwrite each other's data.
- Never use H2 in 'PostgreSQL compatibility mode' for testing PostgreSQL features like JSONB or partial indexes.
- Do not leave dangling Docker containers after test suite completion.

## Workflow
1. Define Testcontainers lifecycle hooks (startup before suite, shutdown after suite).
2. Execute migration runner (Flyway, Liquibase, Prisma, Alembic) on container startup.
3. Write repository tests verifying CRUD operations, joins, and constraint failures.
4. Reset table data between individual test executions.
5. Verify clean exit and resource cleanup.

## Expected Output
High-confidence integration test suite running against an ephemeral containerized database with automated schema migration and clean test data resets.

## Validation Checklist
- [ ] Are tests running against the actual production database engine (not in-memory mocks)?
- [ ] Are migration scripts executed and verified?
- [ ] Is test data cleaned up between tests without cross-test pollution?
- [ ] Are database constraints (unique keys, foreign keys) explicitly verified?
- [ ] Are container lifecycles managed cleanly without orphaned processes?

## Common Mistakes & Antipatterns
- Testing PostgreSQL-specific JSONB operators against an in-memory SQLite database, which crashes with syntax errors.
- Forgetting to truncate tables between tests, causing test B to fail because test A inserted an unexpected record with the same email.
- Running migration scripts manually outside the test lifecycle, leading to broken CI pipelines.

## Concrete Real-World Example
Scenario: A user repository test passes in CI using SQLite, but fails in production because a PostgreSQL foreign key cascade behavior was improperly configured.
Prompt: Convert this repository test suite to use Testcontainers with real PostgreSQL.
Application: The AI configures a singleton PostgreSQL Testcontainer, runs database migrations on startup, wraps repository test assertions in rollback transactions, and verifies foreign key deletion constraints against real Postgres behavior.
