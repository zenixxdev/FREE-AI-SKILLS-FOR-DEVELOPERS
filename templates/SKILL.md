---
name: skill-name-in-kebab-case
description: A concise 1-2 sentence description explaining what this skill does and when an AI should use it.
category: category-name
subcategory: subcategory-name
language: agnostic # or specific language: python, typescript, go, rust, java, etc.
framework: none # or specific framework: react, nextjs, fastapi, spring-boot, etc.
technology: technology-identifier # e.g., postgresql, docker, redis, playwright
difficulty: intermediate # beginner | intermediate | advanced
tags: [tag1, tag2, tag3, tag4]
---

# Skill Title in Title Case

## Purpose
Describe the primary objective of this skill. Explain what engineering challenge it solves, why it is critical, and how it improves AI-assisted development.

## When to Use
Specify concrete triggering scenarios when this skill should be activated.
- Scenario 1: When implementing feature X...
- Scenario 2: When refactoring code that exhibits smell Y...
- Scenario 3: When addressing performance or security issue Z...

## Inputs / Context
List the prerequisites, files, schemas, environment parameters, and project conventions the AI must inspect or gather before generating code.
- Existing codebase conventions, dependencies, and configuration files.
- Relevant domain entities and database schemas.
- Non-functional requirements (latency, throughput, concurrency, security).

## Instructions
Provide sequential, highly specific, imperative instructions guiding the AI through execution.
1. Inspect surrounding context and identify prerequisites.
2. Formulate explicit domain entities and boundaries.
3. Apply technology-specific patterns and idiomatic APIs.
4. Implement comprehensive error handling for all potential failure modes.
5. Structure clean interfaces with strict typing and defensive validation.

## Constraints / Rules
Define hard negative constraints and boundaries the AI must never violate.
- Never use deprecated methods or libraries.
- Never output placeholder comments such as `stub` or `pass`.
- Never expose sensitive credentials, tokens, or private keys.
- Do not introduce unnecessary dependencies when standard language primitives suffice.

## Workflow
Outline the chronological phases the AI should follow:
1. **Analyze**: Inspect inputs and identify architectural boundaries.
2. **Design**: Structure interfaces, data models, and contracts.
3. **Implement**: Author complete, production-ready code.
4. **Validate**: Test against boundary conditions and edge cases.
5. **Review**: Ensure zero violation of constraints and clean documentation.

## Expected Output
Detail what the final deliverable must look like.
- Complete, runnable, syntax-checked code files.
- Clean architectural separation between domain logic and external infrastructure.
- Accompanying unit/integration test specifications where applicable.

## Validation Checklist
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
