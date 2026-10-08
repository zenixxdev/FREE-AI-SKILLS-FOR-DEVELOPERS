---
name: "firestore-security-and-queries"
description: "Authoring declarative Cloud Firestore Security Rules, preventing unauthorized document reads/writes, enforcing schema validation, and structuring compound queries."
category: "database"
subcategory: "firebase"
language: "javascript"
framework: "none"
technology: "firestore"
difficulty: "intermediate"
tags: ["database", "firebase", "firestore", "security-rules", "nosql", "permissions"]
---

# Cloud Firestore Security Rules and Indexed Queries

## Purpose
Provide AI agents with concrete rules for authoring airtight Firestore Security Rules and structuring queries that strictly conform to Firestore indexing constraints.

## When to Use
Use when securing Firebase Firestore databases, implementing client-side queries, validating document structures, or resolving missing index errors.

## Inputs / Context
Firestore collection hierarchy, user authentication state, role definitions, and document schema rules.

## Instructions
1. Structure Firestore Security Rules using version 2 syntax (`rules_version = '2'; service cloud.firestore { ... }`).
2. Default-deny all access at the root: `match /{document=**} { allow read, write: if false; }`.
3. Separate `read` permissions into granular `get` (single document) and `list` (queries/collections) rules.
4. Separate `write` permissions into granular `create`, `update`, and `delete` rules.
5. In `create` rules, validate incoming document schemas using `request.resource.data`:
   - Verify required fields exist and have correct types (`request.resource.data.title is string`).
   - Prevent client tampering with server-assigned fields (e.g., enforce `request.resource.data.authorId == request.auth.uid`).
6. In `update` rules, enforce immutability on sensitive fields using `request.resource.data.diff(resource.data).affectedKeys().hasOnly(['field1', 'field2'])`.
7. Remember that Firestore Security Rules are not filters: queries must specify the exact constraints enforced by security rules, otherwise the entire query is rejected.
8. Define compound indexes in `firestore.indexes.json` for queries combining equality filters with inequality/range filters or sorting on multiple fields.

## Constraints / Rules
- Never write `allow read, write: if request.auth != null;` across entire collections in production.
- Avoid deep subcollection nesting beyond 2-3 levels; use root collections with foreign key references for complex relationships.
- Do not make more than 10 `get()` or `exists()` calls within a single security rule evaluation (Firestore limit).

## Workflow
1. Map collection structure and permission requirements.
2. Draft modular helper functions in `firestore.rules` (e.g., `isSignedIn()`, `isOwner(userId)`).
3. Author granular CRUD rules with schema validation.
4. Define compound indexes in `firestore.indexes.json` matching application queries.
5. Test using the Firebase Rules Unit Testing SDK (`@firebase/rules-unit-testing`).

## Expected Output
Complete `firestore.rules` file with helper functions, schema validation, and matching `firestore.indexes.json` compound index definitions.

## Validation Checklist
- [ ] Is root default-deny rule configured?
- [ ] Are `create`, `update`, and `delete` rules split into distinct blocks?
- [ ] Is `request.resource.data` validated for required fields and types?
- [ ] Are sensitive fields (IDs, creation timestamps) protected from updates?
- [ ] Are required compound indexes defined in `firestore.indexes.json`?

## Common Mistakes & Antipatterns
- Writing `allow read, write: if true;` for temporary testing and deploying it to production, leaving the entire database publicly readable and writable.
- Assuming Firestore rules filter results: writing a rule that restricts access to `resource.data.ownerId == request.auth.uid`, but running a query without `.where('ownerId', '==', uid)`, which Firestore rejects with 'Missing or insufficient permissions'.
- Mutating document author or creation date on document updates.

## Concrete Real-World Example
Scenario: A mobile app's Firestore comments collection allows any authenticated user to edit or delete comments created by other users.
Prompt: Write Firestore security rules that allow public read, restrict creation to authenticated users setting their own authorId, and restrict edit/delete to the original author.
Application: The AI crafts rules using helper functions `isOwner()`, restricts `create` by verifying `request.resource.data.authorId == request.auth.uid`, restricts `update` to `isOwner()` and forbids modifying `authorId` or `createdAt`, and restricts `delete` to `isOwner()`.
