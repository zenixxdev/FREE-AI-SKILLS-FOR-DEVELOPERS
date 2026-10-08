# Comprehensive Skill Contribution Guide

This guide provides an in-depth walkthrough for researching, drafting, validating, and submitting an AI developer skill.

---

## Step 1: Research and Authoritative Sourcing

Before writing a skill, conduct thorough technical research using authoritative sources:
- Official programming language specifications (W3C, ECMA, Python PEPs, Go docs, Rust RFCs).
- Official framework documentation (React, Next.js, FastAPI, Spring Boot, Vue, Svelte).
- Official database manuals (PostgreSQL, MySQL, SQLite, MongoDB, Redis).
- Recognized standards (IETF RFCs, OWASP Top 10, WCAG 2.2 AA).

**Rule**: Do NOT invent APIs, command flags, or framework behavior. Prefer current stable patterns over deprecated legacy methods.

---

## Step 2: Choosing the Right Category

Identify the most logical location within the existing Phase 1 category hierarchy:
- If it relates to React component composition -> `skills/frontend/react/`
- If it relates to API rate limiting -> `skills/backend/general/`
- If it relates to PostgreSQL indexes -> `skills/database/postgresql/`
- If it relates to Docker image optimization -> `skills/devops/docker/`

If unsure, open an issue to discuss placement with maintainers.

---

## Step 3: Drafting the Skill

1. Copy `templates/SKILL.md` to your target directory:
   `mkdir -p skills/category/subcategory/my-skill-slug`
   `cp templates/SKILL.md skills/category/subcategory/my-skill-slug/SKILL.md`
2. Populate all frontmatter fields accurately.
3. Write deep, practical instructions:
   - Provide numbered, sequential steps.
   - Explain what context the AI must check first.
   - Mandate specific algorithms, functions, or patterns.
4. Define strict negative constraints:
   - What must the AI NEVER do? (e.g., 'Never store plaintext passwords', 'Never use SELECT *').
5. Create a realistic, concrete example:
   - Include a realistic problem scenario.
   - Provide an actual developer prompt.
   - Explain how the AI executes the skill to solve the scenario.

---

## Step 4: Quality Self-Audit

Review your skill against this quality scorecard:
- [ ] Is the advice current and aligned with modern stable releases?
- [ ] Are all code snippets complete with zero `stub` or `pass` placeholders?
- [ ] Are negative security constraints explicitly stated?
- [ ] Does the validation checklist contain testable, objective criteria?
- [ ] Is the formatting clean and compliant with `docs/skill-format.md`?

---

## Step 5: Submitting Your Pull Request

1. Commit your changes:
   ```bash
   git add skills/category/subcategory/my-skill-slug/SKILL.md
   git commit -m "feat(category): add my-skill-slug skill"
   ```
2. Push to your fork and submit a PR to `main`.
3. Complete the pull request checklist.
