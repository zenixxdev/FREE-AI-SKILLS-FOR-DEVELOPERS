# Contributing to Free AI Skills for Developers

Thank you for your interest in contributing to **FREE AI SKILLS FOR DEVELOPERS**! Our mission is to create the highest quality, open-source collection of structured AI skills to make AI coding assistants reliable and safe engineering partners.

Please take a moment to review this guide before submitting issues or pull requests.

---

## Quality Principles

Before submitting a new skill, ensure it meets our core standards:

1. **Quality > Quantity**: We do not accept shallow, repetitive prompts or generic advice.
2. **Specific & Actionable**: A skill must give concrete, technical, step-by-step instructions.
3. **Defensive & Safe**: A skill must enforce security best practices (least privilege, input validation, no secrets).
4. **Model-Agnostic**: Phase 1 content must not contain vendor-specific hacks or model-specific directory structures.
5. **No Duplication**: Check existing skills before authoring a new one. Specialize only when technologies fundamentally diverge.

---

## Contribution Workflow

### 1. Proposing a New Skill
- Check existing skills in `skills/` to ensure the topic is not already covered.
- Open a GitHub Issue using the **New Skill Proposal** template.
- Explain the domain problem, why a skill is needed, and proposed category/subcategory placement.

### 2. Authoring a Skill
- Copy the canonical template from `templates/SKILL.md`.
- Place the skill in the appropriate category path:
  `skills/<category>/<subcategory>/<skill-slug>/SKILL.md`
- Ensure all required YAML frontmatter fields are present.
- Write complete instructions, constraints, workflows, validation checklists, common mistakes, and realistic examples.
- Ensure zero `stub` or placeholder text.

### 3. Validating the Skill
- Verify Markdown formatting and headings.
- Ensure YAML frontmatter parses as valid YAML.
- Verify the skill follows all rules in [docs/skill-format.md](docs/skill-format.md) and [docs/naming-conventions.md](docs/naming-conventions.md).

### 4. Submitting a Pull Request
- Create a short-lived branch: `git checkout -b feat/add-my-skill`.
- Commit changes using Conventional Commits: `feat(database): add postgresql-partitioning skill`.
- Open a Pull Request referencing the approved issue.
- Complete the PR checklist in `PULL_REQUEST_TEMPLATE.md`.

---

## Code of Conduct

All contributors are expected to uphold the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).
