---
name: "rbac-and-abac-policy-engine"
description: "Architecting hybrid authorization engines combining Role-Based Access Control (RBAC) with Attribute-Based Access Control (ABAC) for fine-grained resource permissions."
category: "authentication"
subcategory: "permissions"
language: "typescript"
framework: "none"
technology: "authorization-engine"
difficulty: "advanced"
tags: ["authentication", "authorization", "rbac", "abac", "permissions", "policy-engine"]
---

# Role-Based (RBAC) and Attribute-Based (ABAC) Access Control

## Purpose
Instruct AI agents to build scalable, granular authorization policy engines capable of evaluating user roles, organizational hierarchies, and contextual resource attributes.

## When to Use
Use when implementing authorization in SaaS platforms, multi-tenant systems, enterprise dashboards, or document collaboration tools.

## Inputs / Context
Actor (user, roles, attributes), Action (read, write, delete, share), Resource (document, project, ownerId, status), and Environment Context (time, IP, department).

## Instructions
1. Differentiate authorization models:
   - RBAC (Role-Based): Evaluates coarse roles (e.g., `Admin`, `Editor`, `Viewer`) mapped to permissions (e.g., `documents:create`, `documents:delete`).
   - ABAC (Attribute-Based): Evaluates granular attributes of Actor, Action, Resource, and Environment (e.g., 'User can edit document IF user is in the same department AND document status is draft').
2. Structure permissions using standard namespacing: `resource:action` (e.g., `projects:create`, `invoices:export`, `users:invite`).
3. Implement a unified Policy Engine function: `can(actor, action, resource, context?): boolean`.
4. Separate Policy Definitions from business logic code: define policies declaratively in isolated policy rule matrices or classes (e.g., CASL or custom policy classes).
5. Always evaluate permissions on the backend API layer regardless of what UI controls are rendered or disabled on the frontend.
6. Return HTTP `403 Forbidden` when an authenticated user lacks permission for a known resource; return HTTP `404 Not Found` if revealing the existence of the resource is itself a security violation.
7. Optimize multi-resource checks in database queries: push authorization predicates directly into database query `WHERE` clauses rather than fetching 1,000 rows into memory and filtering with `can()`.

## Constraints / Rules
- Never rely on client-side permission checks for security; client-side checks are purely for UI/UX convenience.
- Never hardcode role checks (`if (user.role === 'admin')`) directly inside controller routes; check permissions (`if (can(user, 'update', document))`).
- Avoid loading unbounded resource lists into application memory to filter by permission.

## Workflow
1. Define atomic permission strings and default role-permission mappings.
2. Build declarative policy rules for each domain resource.
3. Implement authorization middleware for route endpoints.
4. Translate policy rules into database SQL/ORM query filters for list endpoints.
5. Author exhaustive unit tests for every role and attribute permutation.

## Expected Output
Clean TypeScript policy engine supporting RBAC roles, ABAC dynamic attribute evaluations, route middleware, and database query filters.

## Validation Checklist
- [ ] Are permissions checked using action strings (`resource:action`) rather than raw role names?
- [ ] Are ABAC attributes (ownership, tenant, department) evaluated dynamically?
- [ ] Are list queries filtered at the database level rather than in-memory?
- [ ] Are unauthorized mutations rejected with HTTP 403 or 404?
- [ ] Are all policy combinations covered by unit tests?

## Common Mistakes & Antipatterns
- Hardcoding `if (user.role === 'superadmin')` across 50 controllers, making it impossible to add a custom 'compliance_officer' role later without rewriting every route.
- Fetching 10,000 documents from the database and running an in-memory `.filter(doc => can(user, 'read', doc))` loop, causing severe latency and memory spikes.
- Failing to verify tenant/organization isolation in attribute checks, allowing cross-tenant privilege escalation.

## Concrete Real-World Example
Scenario: A project management app allows any user with the 'Editor' role to edit ANY project in the system, even projects belonging to competing client organizations.
Prompt: Refactor this authorization system to enforce both RBAC permissions and organization/ownership ABAC boundaries.
Application: The AI builds a policy engine verifying `actor.hasPermission('project:update')` AND `actor.orgId === project.orgId` AND (`project.isPublic || project.members.includes(actor.id)`), eliminating cross-organization data tampering.
