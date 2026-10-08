---
name: "idor-prevention-and-validation"
description: "Eliminating Insecure Direct Object References (IDOR) and Broken Object Level Authorization (BOLA) through contextual tenant scoping, UUIDs, and ownership assertions."
category: "security"
subcategory: "authorization"
language: "agnostic"
framework: "none"
technology: "access-control"
difficulty: "intermediate"
tags: ["security", "idor", "bola", "authorization", "multi-tenant", "ownership-validation"]
---

# Insecure Direct Object Reference (IDOR) Prevention and Tenant Scoping

## Purpose
Provide concrete engineering rules to eliminate IDOR / BOLA vulnerabilities by ensuring every database lookup and mutation verifies resource ownership against authenticated user context.

## When to Use
Use when building any API route accepting resource identifiers in URL parameters (`/api/documents/:id`, `/api/orders/:id/download`).

## Inputs / Context
Route parameters, authenticated session context (userId, orgId, roles), database queries, and authorization rules.

## Instructions
1. Never rely on unguessable IDs (UUIDs) alone as a security mechanism; obscurity is not authorization.
2. Contextual Query Scoping:
   - Never fetch a resource by its ID alone: `SELECT * FROM invoices WHERE id = :invoiceId` is an IDOR vulnerability.
   - Always scope queries to the authenticated tenant or owner:
     `SELECT * FROM invoices WHERE id = :invoiceId AND organization_id = :currentOrgId`
3. Explicit Ownership Verification:
   - For complex permissions where scoping in the query is impossible, load the resource and execute an explicit authorization guard:
     `if (resource.tenantId !== currentUser.tenantId) { throw new ForbiddenError(); }`
4. Prevent Sequential ID Enumeration:
   - Avoid exposing auto-incrementing integer IDs (`/users/104`, `/invoices/105`) in public APIs, which allows attackers to scrape all records by iterating numbers.
   - Use UUIDv7 or nanoid for public-facing identifiers.
5. Enforce Scoping Across Nested Child Routes:
   - When accessing nested resources (`/api/projects/:projectId/tasks/:taskId`), verify BOTH that the project belongs to the user's organization AND that the task belongs to that specific project.
6. Return HTTP `404 Not Found` instead of `403 Forbidden` when accessing unauthorized objects if acknowledging the existence of the object ID leaks confidential data.

## Constraints / Rules
- Never write `UPDATE` or `DELETE` queries that filter only by resource ID without including tenant/user ID scoping.
- Do not trust client-supplied tenant or user IDs in request bodies; read identity strictly from the authenticated session/token.
- Avoid passing raw database sequence IDs in client URLs.

## Workflow
1. Extract resource ID from path parameters.
2. Extract authenticated user ID and organization ID from verified session.
3. Query database with compound filter `WHERE id = :id AND org_id = :orgId`.
4. If no row returned, respond with 404 Not Found.
5. Execute mutation or return data.

## Expected Output
IDOR-free controller and database query code with strict tenant scoping, UUID identifiers, and ownership assertion guards.

## Validation Checklist
- [ ] Are all database lookups scoped by authenticated user/tenant ID?
- [ ] Are auto-incrementing IDs replaced with UUIDs/nanoids in public URLs?
- [ ] Are nested child relations verified against their parent resource?
- [ ] Are mutations (`UPDATE`, `DELETE`) constrained by tenant ownership in SQL?
- [ ] Is user identity sourced exclusively from validated session context?

## Common Mistakes & Antipatterns
- Believing UUIDs make an endpoint secure: `GET /invoices/c8b3a0e1-...` is still an IDOR if any user who obtains that UUID can read the invoice without ownership checks.
- Accepting `tenant_id` or `user_id` in the JSON request body: an attacker changes `user_id` in the payload to take over another user's profile.
- Updating resources with `UPDATE documents SET title = :title WHERE id = :id`, allowing an attacker to overwrite another tenant's documents.

## Concrete Real-World Example
Scenario: An e-commerce API allows customers to download any PDF invoice by changing the invoice ID in the URL: `GET /api/invoices/9482/download`.
Prompt: Fix the IDOR vulnerability on this invoice download endpoint.
Application: The AI extracts `currentUser.organizationId` from the session, replaces the SQL query with `SELECT * FROM invoices WHERE id = :id AND organization_id = :orgId`, returns 404 if not found, and migrates public routes to use UUIDv7 identifiers.
