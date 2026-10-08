# Getting Started with Free AI Skills for Developers

Welcome to **FREE AI SKILLS FOR DEVELOPERS**! This guide walks you through how to find, understand, and apply skills in your daily development workflow.

---

## 1. What is an AI Skill?

An AI skill is a structured markdown specification that gives an AI coding assistant the domain expertise, architectural rules, constraints, and validation checklists of a senior engineer.

Instead of writing a prompt like *"Build an auth system"*, you provide the **Authentication Skill** alongside your request. The AI adheres to the skill's instructions, preventing security holes, race conditions, and architectural drift.

---

## 2. Finding the Right Skill

Skills are organized logically in the `skills/` directory:

```text
skills/<category>/<subcategory>/<skill-slug>/SKILL.md
```

### Quick Lookup Examples:
- **Need responsive CSS?** -> `skills/ui/web/responsive-interface-design/SKILL.md`
- **Need to optimize slow Postgres queries?** -> `skills/database/postgresql/indexing-and-execution-plans/SKILL.md`
- **Need to build idempotent APIs?** -> `skills/api/rest/idempotent-endpoint-design/SKILL.md`
- **Need to write bulletproof unit tests?** -> `skills/testing/unit/isolated-unit-test-design/SKILL.md`
- **Need to set up a minimal Docker image?** -> `skills/devops/docker/multi-stage-minimal-images/SKILL.md`

---

## 3. How to Use Skills in Different Tools

### In Web Chats (ChatGPT, Claude, Gemini)
1. Open the target `SKILL.md` file in this repository.
2. Copy the entire markdown content.
3. Paste it at the start of your message, followed by your project details and task.

### In IDE Assistants (Cursor, VS Code Copilot)
- **Cursor**: Copy relevant skills into your `.cursorrules` file or reference them directly in chat prompts.
- **GitHub Copilot**: Add skill instructions into `.github/copilot-instructions.md`.
- **Claude Projects**: Upload relevant skill files as project knowledge files.

### In Coding Agents (AutoGPT, OpenDevin, LangGraph)
- Point your agent's file-reading tools to the `skills/` directory.
- Prompt the agent to inspect the corresponding `SKILL.md` before generating code.

---

## 4. Composing Multiple Skills

Skills are designed to be composable. For example, when building a production API endpoint, you can combine:
1. `skills/api/rest/idempotent-endpoint-design/SKILL.md` (for HTTP idempotency)
2. `skills/security/authorization/idor-prevention-and-validation/SKILL.md` (for tenant scoping)
3. `skills/logic/validation/declarative-schema-validation/SKILL.md` (for request validation)

The AI will synthesize all three sets of constraints, producing an endpoint that is idempotent, secure against IDOR, and strictly validated.
