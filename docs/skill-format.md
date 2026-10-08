# Canonical Skill Format Specification

Every skill in this repository MUST strictly conform to the canonical `SKILL.md` specification.

---

## Frontmatter (YAML)

Every `SKILL.md` file must begin with YAML frontmatter containing these exact keys:

```yaml
---
name: kebab-case-name
description: Concise, 1-2 sentence description of what the skill does and when to use it.
category: category-name
subcategory: subcategory-name
language: target-programming-language (or agnostic)
framework: target-framework (or none)
technology: primary-technology-identifier
difficulty: beginner | intermediate | advanced
tags: [tag1, tag2, tag3]
---
```

### Frontmatter Fields Rationale:
- `name`: Matches directory name in kebab-case.
- `description`: Used for search indexing and agent tool-matching.
- `category`: Matches top-level directory (e.g., `backend`, `database`).
- `subcategory`: Matches sub-directory (e.g., `python`, `postgresql`).
- `language`: Target programming language or `agnostic`.
- `framework`: Specific framework or `none`.
- `technology`: Specific underlying technology.
- `difficulty`: Expected complexity level.
- `tags`: Keywords for search discovery.

---

## Mandatory Markdown Sections

Following the frontmatter, the document must contain these exact sections in order:

### `# <Skill Title>`
Clear, professional title of the skill.

### `## Purpose`
Explains why the skill exists, what architectural challenge it resolves, and the concrete outcome it achieves.

### `## When to Use`
Explicit triggering conditions specifying when an AI or developer should activate this skill.

### `## Inputs / Context`
The information, files, schemas, or requirements the AI must inspect or gather before generating code.

### `## Instructions`
Numbered, sequential, imperative technical steps. Must be actionable, specific, and technology-aware. Avoid vague generalities.

### `## Constraints / Rules`
Bullet points of hard negative constraints (things the AI must NEVER do). Enforces security, backwards compatibility, and anti-pattern avoidance.

### `## Workflow`
The step-by-step lifecycle of executing the skill from preparation to verification.

### `## Expected Output`
Detail what the final deliverable must look like.
- Complete, runnable, syntax-checked code files.
- Clean architectural separation between domain logic and external infrastructure.
- Accompanying unit/integration test specifications where applicable.

### `## Validation Checklist`
Provide a checklist of verifiable pass/fail criteria to audit the output:
- [ ] Does the implementation handle all edge cases (null, empty, boundary values)?
- [ ] Are all error and failure modes explicitly captured and handled?
- [ ] Are security best practices strictly observed?
- [ ] Is the code completely free of temporary placeholders?
- [ ] Are all necessary imports and dependencies included?

## Common Mistakes & Antipatterns
List frequent mistakes, subtle bugs, or naive approaches developers and AI models make on this task:
- Mistake 1: Explaining what happens and why it is harmful.
- Mistake 2: Explaining what happens and why it is harmful.
- Mistake 3: Explaining what happens and why it is harmful.

## Concrete Real-World Example
Provide a realistic scenario demonstrating how this skill is applied in practice:

**Scenario**: Describe an authentic developer challenge or existing flawed implementation.

**Prompt**:
```text
Show a realistic user prompt asking for this feature or refactor.
```

**Application**:
Explain step-by-step how the AI applies the skill's instructions, enforces the constraints, and produces a verified, production-quality solution.
