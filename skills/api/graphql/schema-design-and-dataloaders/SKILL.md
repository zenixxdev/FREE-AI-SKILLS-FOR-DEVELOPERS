---
name: "schema-design-and-dataloaders"
description: "Designing production GraphQL schemas using Relay cursor pagination, strong input/output types, and solving the N+1 query problem via batching DataLoaders."
category: "api"
subcategory: "graphql"
language: "typescript"
framework: "none"
technology: "graphql"
difficulty: "advanced"
tags: ["api", "graphql", "dataloader", "n-plus-one", "schema-design", "relay-pagination"]
---

# GraphQL Schema Design and DataLoader N+1 Prevention

## Purpose
Provide AI agents with architecture standards for GraphQL schemas, enforcing strict input types, scalable pagination, and batching mechanisms to eliminate database query amplification.

## When to Use
Use when designing GraphQL APIs, writing resolvers for relational data, building unified federated graphs, or resolving GraphQL performance bottlenecks.

## Inputs / Context
Domain entities, relationship cardinality, query requirements, and underlying database models.

## Instructions
1. Design schemas following the GraphQL Best Practices:
   - Use explicit, dedicated `Input` types for every mutation (e.g., `input CreateUserInput { ... }`).
   - Return payload objects from mutations containing both the modified entity and possible domain errors (e.g., `type CreateUserPayload { user: User, userErrors: [UserError!]! }`).
2. Implement Relay-compliant Cursor Connections for pagination: `edges`, `node`, `pageInfo { hasNextPage, endCursor }` instead of naive offset/limit pagination.
3. Solve the N+1 Query Problem in field resolvers by always using DataLoaders for database lookups:
   - Instantiate fresh DataLoader instances per request (scoped to the GraphQL execution context) to prevent cross-request data leaks.
   - Batch individual IDs into a single database `WHERE id IN (...)` query.
   - Ensure the batch loader function returns an array of identical length and order matching the input keys array (filling missing entries with `null` or `Error`).
4. Prevent Denial of Service (DoS) by enforcing Query Depth Limiting (e.g., max 6 levels deep) and Query Complexity Analysis.
5. Mask internal server exceptions: log detailed stack traces on the server while returning sanitized `GraphQLError` messages with custom `extensions.code` to clients.

## Constraints / Rules
- Never query the database directly inside nested field resolvers without a DataLoader.
- Never share DataLoader cache instances across different HTTP requests.
- Avoid exposing unbounded list fields without required `first` or `last` limit arguments.

## Workflow
1. Define GraphQL schema with explicit inputs, payloads, and connection types.
2. Initialize per-request DataLoaders inside the GraphQL context creation function.
3. Wire resolvers to dispatch requests through DataLoaders.
4. Add query depth limiting and query complexity plugins.
5. Validate resolver execution counts using database query logging.

## Expected Output
Clean GraphQL schema definition (SDL), context-scoped DataLoader factories, and batch-optimized field resolvers.

## Validation Checklist
- [ ] Are DataLoaders instantiated per request in the context?
- [ ] Does the batch loader function preserve key order and array length?
- [ ] Is Relay cursor pagination implemented on collection fields?
- [ ] Are query depth and complexity limits enforced?
- [ ] Does requesting 50 parent items with 10 child relations execute exactly 2 database queries instead of 51?

## Common Mistakes & Antipatterns
- Declaring a global static DataLoader, accidentally leaking cached private user data to other concurrent users.
- Returning an array from a DataLoader batch function that does not match the exact order of the input keys array, corrupting resolver data mapping.
- Leaving schemas open to recursive queries (e.g., `author -> books -> author -> books`), crashing the server with stack overflow.

## Concrete Real-World Example
Scenario: A GraphQL query fetching 30 blog posts and their authors triggers 31 separate SQL queries (1 for posts, 30 for authors), taking 600ms.
Prompt: Fix the N+1 query problem on this GraphQL post author resolver using DataLoader.
Application: The AI creates an `AuthorLoader` in the request context, batches author IDs into `SELECT * FROM authors WHERE id IN (?)`, orders the results to match requested IDs, reducing database round-trips from 31 to 2 and response latency to 18ms.
