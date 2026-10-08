---
name: "robust-tool-use-architecture"
description: "Architecting reliable LLM tool-calling (function-calling) systems with strict JSON schema declarations, execution sandboxes, error feedback, and loop termination."
category: "ai"
subcategory: "tool-calling"
language: "python"
framework: "none"
technology: "tool-calling"
difficulty: "advanced"
tags: ["ai", "tool-calling", "function-calling", "agent-tools", "json-schema", "sandboxing"]
---

# Robust LLM Tool Calling, Schema Declarations, and Execution Loops

## Purpose
Instruct AI agents to author reliable tool-calling and function-calling loops that execute external tools safely, handle runtime tool failures gracefully, and prevent infinite tool execution loops.

## When to Use
Use when giving LLMs the ability to query databases, execute shell commands, call external REST APIs, or interact with filesystems.

## Inputs / Context
Tool definitions (name, description, parameters schema), execution dispatcher, LLM client, and max iteration limits.

## Instructions
1. Author High-Clarity Tool Schemas:
   - Provide detailed, unambiguous descriptions for the tool and every parameter. The description is the sole documentation the model receives to understand when and how to call the function.
   - Use JSON Schema (or Pydantic models) with strict property types, required parameter arrays, and descriptive enum values.
2. Sandboxed Tool Execution:
   - Execute tool functions in a safe environment with strict timeout limits (e.g., 10 seconds per tool call).
   - Catch and encapsulate all runtime tool exceptions; NEVER let a tool exception crash the agent loop.
3. Feed Tool Errors Back into the Model Context:
   - When a tool fails (e.g., invalid parameters, database connection timeout, missing file), return a structured tool error response back to the LLM:
     `{"status": "error", "error_type": "FileNotFound", "message": "File 'report.csv' not found. Available files: [...]"}`
   - This allows the model to introspect its error, adjust parameters, and self-correct on the next iteration.
4. Enforce Hard Loop Termination Guardrails:
   - Always enforce a maximum tool iteration limit (`MAX_ITERATIONS = 5` or `10`).
   - If the limit is reached without a final answer, terminate execution and return a graceful failure explanation to the user.
5. Prevent Duplicate / Infinite Tool Loops:
   - Track previously executed tool calls and parameters; if the model calls the exact same tool with the exact same arguments 3 times consecutively without progress, abort and alert the user.

## Constraints / Rules
- Never execute destructive tools (e.g., deleting a database or sending an email to a customer) without an explicit human-in-the-loop confirmation step.
- Never run tool-calling loops without a hard iteration cap.
- Do not let unhandled tool exceptions escape the execution dispatcher.

## Workflow
1. Define tools with Pydantic schemas and descriptive docstrings.
2. Register tools in a centralized registry map `dict[str, Callable]`.
3. Pass tool definitions to LLM in API request.
4. Inspect model response: if `tool_calls` present, execute tools safely.
5. Append tool results to message history and invoke LLM again until final response or max iterations reached.

## Expected Output
Complete, resilient tool-calling orchestration loop with schema generation, sandboxed execution, error feedback injection, and loop guardrails.

## Validation Checklist
- [ ] Are all tool parameters documented with explicit descriptions and types?
- [ ] Is tool execution wrapped in try/except blocks returning structured error messages?
- [ ] Is a hard maximum iteration cap enforced?
- [ ] Are duplicate identical tool call loops detected and interrupted?
- [ ] Are sensitive actions protected by confirmation gates?

## Common Mistakes & Antipatterns
- Omitting parameter descriptions, causing the model to guess argument formats and pass invalid types.
- Allowing an unhandled tool exception (like `NetworkTimeout`) to crash the Python process instead of returning an error message for the model to recover from.
- Running a `while True` loop without a max iteration count, running up huge API bills when the model gets stuck in an infinite tool cycle.

## Concrete Real-World Example
Scenario: An AI database assistant gets stuck in an infinite loop querying a table with slightly misspelled column names, racking up 50 failed API calls.
Prompt: Build a robust tool-calling dispatcher in Python that handles tool errors, suggests valid columns, and enforces max iteration limits.
Application: The AI implements a tool loop capped at 5 iterations, catches SQL column errors, returns `{"error": "column 'usr_name' not found. Did you mean 'username'?"}` as the tool response, allowing the model to correct its query on turn 2 and produce the correct result.
