# Naming Conventions

To keep the repository predictable, automated, and maintainable, all files, categories, and skills must adhere to these naming conventions.

---

## 1. Directory Structure

```text
skills/<category>/<subcategory>/<skill-slug>/SKILL.md
```

- `<category>`: Top-level category in lowercase kebab-case (e.g., `frontend`, `database`, `cloud`).
- `<subcategory>`: Subcategory representing a language, technology, or domain (e.g., `postgresql`, `docker`, `react`).
- `<skill-slug>`: Descriptive, action-oriented kebab-case folder name (e.g., `indexing-and-execution-plans`).
- `SKILL.md`: The canonical filename for all skill definitions. Must always be uppercase `SKILL.md`.

---

## 2. Skill Slugs

- Must be in **kebab-case** using lowercase letters, numbers, and hyphens (`[a-z0-9-]+`).
- Must be descriptive and specific:
  - Good: `idempotent-endpoint-design`, `row-level-security-policies`, `core-web-vitals-optimization`
  - Bad: `skill1`, `test`, `postgres-helper`, `clean-code`, `misc`
- Do not repeat the category or technology redundantly in the slug if already in the path:
  - Good: `skills/database/postgresql/indexing-and-execution-plans/`
  - Bad: `skills/database/postgresql/postgresql-database-indexing/`

---

## 3. Metadata Tags

- Tags must be lowercase, alphanumeric with hyphens (e.g., `jwt`, `rate-limiting`, `zero-downtime`).
- Keep tags focused on discoverability: include relevant technology names, concepts, and synonyms.
- Provide between 3 and 7 tags per skill.

---

## 4. Documentation and Template Files

- Root files must be uppercase: `README.md`, `LICENSE`, `CONTRIBUTING.md`, `SECURITY.md`, `ROADMAP.md`, `CHANGELOG.md`.
- Documentation files in `docs/` must be kebab-case: `getting-started.md`, `skill-format.md`, `naming-conventions.md`, `contribution-guide.md`.
- Canonical template file must be `templates/SKILL.md`.
