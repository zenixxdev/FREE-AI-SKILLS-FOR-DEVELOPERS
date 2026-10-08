---
name: "context-rich-code-synthesis"
description: "Synthesizing complete, production-ready code by extracting surrounding project context, matching existing idioms, respecting constraints, and eliminating placeholders."
category: "general"
subcategory: "code-generation"
language: "agnostic"
framework: "none"
technology: "code-generation"
difficulty: "intermediate"
tags: ["general", "code-generation", "synthesis", "production-quality", "context-grounding", "no-placeholders"]
---

# Context-Rich Code Synthesis and Constraint Grounding

## Purpose
Instruct AI agents to generate production-quality code that seamlessly matches the surrounding project's style, imports existing dependencies, handles all edge cases, and completely eliminates placeholder comments.

## When to Use
Use whenever an AI assistant writes, modifies, or extends software code in any programming language.

## Inputs / Context
User task prompt, target repository files, surrounding code idioms, existing dependencies, and design patterns.

## Instructions
1. Inspect Surrounding Context Before Generating:
   - Examine existing imports, project structure, naming conventions (camelCase vs snake_case), and library choices.
   - Reuse existing utility functions and installed packages rather than inventing new helper libraries or installing duplicate packages.
2. Complete, Production-Ready Code (Zero Placeholders):
   - NEVER use lazy placeholder comments such as:
     * `// Stub: Implement later`
     * `// Add error handling here`
     * `/* ... rest of code ... */`
     * `pass  # deferred logic`
   - Every function, error handler, validation check, and data model must be fully implemented and syntactically complete.
3. Defensive Programming by Default:
   - Handle null, undefined, empty collections, and error boundaries in every generated code block.
   - Use strict types, explicit error returns, and validated schemas.
4. Idiomatic Language Fluency:
   - Respect the target language's actual runtime and idioms: do not write Python like Java, do not write Go like JavaScript.
   - Use language-native constructs (comprehensions in Python, goroutines in Go, pattern matching in Rust, runes in Svelte 5).
5. Self-Contained and Runnable:
   - Ensure all necessary imports are included at the top of the file.
   - Ensure the generated code compiles cleanly without syntax errors.

## Constraints / Rules
- Never emit incomplete code snippets with 'left as an exercise' or 'TODO' placeholders.
- Never invent imaginary APIs, package names, or non-existent framework methods.
- Avoid introducing unnecessary third-party dependencies when standard library primitives suffice.

## Workflow
1. Analyze the surrounding codebase style, conventions, and existing dependencies.
2. Draft complete implementation covering all edge cases and error handling.
3. Review code internally to ensure zero placeholder comments remain.
4. Verify all import statements match real, installed packages.
5. Output clean, fully implemented, ready-to-run source code.

## Expected Output
Complete, production-ready source code file with zero placeholders, full error handling, idiomatic style, and verified imports.

## Validation Checklist
- [ ] Are all functions fully implemented with zero `stub` placeholders?
- [ ] Are all necessary imports included?
- [ ] Does naming and architecture match the surrounding repository?
- [ ] Are errors and edge cases explicitly handled?
- [ ] Is the code syntactically valid and ready to run?

## Common Mistakes & Antipatterns
- Outputting a function body that says `// insert database query here`, forcing the developer to write the hardest part themselves.
- Hallucinating a fictitious convenience method like `jwt.verifyAndDecodeAsync()` that does not exist in the installed library.
- Writing Java-style class hierarchies in a lightweight Python script.

## Concrete Real-World Example
Scenario: A developer asks for a complete authentication middleware for an Express TypeScript application.
Prompt: Write a production-ready JWT authentication middleware in TypeScript.
Application: The AI writes a complete, compilable middleware file importing `jsonwebtoken`, extracting Bearer tokens, handling expired/malformed errors with standard 401 Problem Details responses, extending Express `Request` interface with typed user claims, with zero placeholder comments.
