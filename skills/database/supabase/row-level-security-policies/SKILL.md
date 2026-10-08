---
name: "row-level-security-policies"
description: "Architecting multi-tenant, secure Supabase PostgreSQL databases using fine-grained Row-Level Security (RLS) policies, auth.uid() checks, and performant subquery joins."
category: "database"
subcategory: "supabase"
language: "sql"
framework: "none"
technology: "supabase"
difficulty: "intermediate"
tags: ["database", "supabase", "rls", "postgres", "security", "multi-tenant", "auth"]
---

# Supabase Row-Level Security (RLS) and Tenant Isolation

## Purpose
Instruct AI agents to write ironclad PostgreSQL Row-Level Security (RLS) policies in Supabase, preventing data leakage across tenants while maintaining sub-millisecond query performance.

## When to Use
Use when creating or updating tables in Supabase, implementing multi-tenant data models, or securing client-side database queries.

## Inputs / Context
Table schemas, tenancy model (single-user vs. organization/team), user roles, and CRUD permission matrices.

## Instructions
1. Always enable Row-Level Security immediately upon creating any table: `ALTER TABLE public.my_table ENABLE ROW LEVEL SECURITY;`.
2. Explicitly revoke public access: `REVOKE ALL ON public.my_table FROM anon, authenticated;` and grant specific permissions (`SELECT`, `INSERT`, `UPDATE`, `DELETE`) as needed.
3. For individual user-owned tables, create simple policies matching `auth.uid()`:
   `CREATE POLICY "Users can access own records" ON my_table FOR ALL TO authenticated USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid());`
4. For organization/team-owned tables, avoid correlated subqueries inside RLS policies that re-evaluate for every single row. Instead, wrap authorization lookups in security-definer helper functions or use indexed `EXISTS` subqueries:
   `CREATE POLICY "Team members view team documents" ON documents FOR SELECT TO authenticated USING (EXISTS (SELECT 1 FROM team_members WHERE team_members.team_id = documents.team_id AND team_members.user_id = auth.uid()));`
5. Always index the foreign key columns referenced in RLS policies (e.g., index `team_id` and `user_id`); unindexed RLS columns trigger sequential scans on every query.
6. Provide distinct `USING` (read/filter) and `WITH CHECK` (write/validate) expressions on `UPDATE` policies to prevent users from updating a record to belong to another user.
7. Bypass RLS only in trusted backend microservices using the `service_role` key; never expose the `service_role` key to client applications.

## Constraints / Rules
- Never create a table in the `public` schema in Supabase without enabling RLS.
- Never use `USING (true)` on mutation policies (`INSERT`, `UPDATE`, `DELETE`) for authenticated users.
- Avoid calling complex multi-table joins inside RLS policies without covering indexes.

## Workflow
1. Define table schema with foreign keys to `auth.users` or team tables.
2. Enable RLS on the table.
3. Create indexes on all columns evaluated in RLS conditions.
4. Author granular policies for `SELECT`, `INSERT`, `UPDATE`, `DELETE`.
5. Test using Supabase client impersonation or `SET ROLE authenticated; SET request.jwt.claim.sub = 'user-uuid';`.

## Expected Output
Complete SQL migration enabling RLS, defining targeted CRUD policies with `auth.uid()`, and creating prerequisite performance indexes.

## Validation Checklist
- [ ] Is `ENABLE ROW LEVEL SECURITY` executed on every public table?
- [ ] Are columns used in RLS policies (e.g., `user_id`, `team_id`) indexed?
- [ ] Do `UPDATE` policies specify both `USING` and `WITH CHECK` clauses?
- [ ] Are separate policies created for different operations (`SELECT` vs `DELETE`)?
- [ ] Is data isolation verified under simulated authenticated user roles?

## Common Mistakes & Antipatterns
- Enabling RLS on a table but forgetting to write any policies, causing all queries by authenticated users to return empty result sets.
- Using an unindexed subquery in an RLS policy on a 100,000-row table, degrading query response times from 5ms to 8 seconds.
- Writing an `UPDATE` policy with only `USING (user_id = auth.uid())` without `WITH CHECK`, allowing users to change `user_id` to another user's ID.

## Concrete Real-World Example
Scenario: A SaaS application allows any logged-in user to read all other companies' invoices because the invoices table was created in Supabase without RLS.
Prompt: Secure this Supabase invoices table with multi-tenant RLS policies based on team membership.
Application: The AI enables RLS on `invoices`, indexes `invoices(team_id)`, and defines an `EXISTS` policy verifying that `auth.uid()` belongs to the associated `team_id` in the `team_members` table, completely isolating tenant data.
