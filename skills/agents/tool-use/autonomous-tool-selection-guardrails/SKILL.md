---
name: "autonomous-tool-selection-guardrails"
description: "Governing autonomous AI agent tool selection, dynamic parameter validation, permission gates, execution sandboxes, and rate-limiting guardrails."
category: "agents"
subcategory: "tool-use"
language: "python"
framework: "none"
technology: "agent-tools"
difficulty: "advanced"
tags: ["agents", "tool-use", "guardrails", "security", "sandboxing", "permissions"]
---

# Autonomous Tool Selection, Parameter Validation, and Safety Guardrails

## Purpose
Provide AI agents with robust safety frameworks to govern how autonomous systems select, validate, and execute external tools without causing data loss or security breaches.

## When to Use
Use when deploying coding agents, workflow automation agents, cloud management bots, or multi-tool autonomous systems.

## Inputs / Context
Tool definitions, user permission context, execution policies, parameter schemas, and environmental sandboxes.

## Instructions
1. Multi-Tier Permission Hierarchy:
   - Tier 1 (Read-Only / Safe): Autonomous execution permitted without user confirmation (e.g., `read_file`, `search_code`, `get_status`).
   - Tier 2 (Idempotent / Low-Risk Mutation): Autonomous execution with logging and automatic rollback support (e.g., `create_scratch_file`, `run_unit_test`).
   - Tier 3 (Destructive / High-Risk Mutation): Strictly requires explicit human-in-the-loop confirmation before execution (e.g., `delete_file`, `git_push_force`, `drop_table`, `send_email`).
2. Pre-Execution Parameter Validation:
   - Validate tool parameters against strict Pydantic schemas before invocation.
   - Enforce path sandboxing: verify file paths do not traverse outside the designated workspace directory (`os.path.commonpath` verification to prevent `../../etc/passwd` path traversal).
3. Tool Execution Sandboxing:
   - Execute shell and code commands in isolated containerized sandboxes or restricted subprocesses with strict CPU, memory, and timeout caps (e.g., max 30s).
   - Prohibit interactive commands that block awaiting stdin without a terminal (e.g., `vim`, `nano`, unflagged `apt-get install`).
4. Rate Limiting and Cost Guardrails:
   - Cap maximum tool calls per task (e.g., max 25 calls).
   - Cap total monetary API spend or token consumption per session.

## Constraints / Rules
- Never execute Tier 3 destructive operations without explicit human authorization.
- Never execute shell commands with root privileges.
- Do not allow file operations outside the designated workspace sandbox.

## Workflow
1. Agent selects tool and generates arguments.
2. Validate arguments against Pydantic schema and sandbox constraints.
3. Check permission tier: if Tier 3, prompt user for approval.
4. Execute tool in sandboxed subprocess with timeout.
5. Sanitize tool output and return to agent context.

## Expected Output
Safe tool execution engine featuring permission tier routing, path traversal sandboxing, human confirmation prompts, and timeout handling.

## Validation Checklist
- [ ] Are tools classified into clear safety tiers?
- [ ] Are destructive actions gated by human confirmation?
- [ ] Is path traversal strictly prevented on filesystem tools?
- [ ] Are subprocess tools constrained by execution timeouts?
- [ ] Are total session tool calls and costs capped?

## Common Mistakes & Antipatterns
- Giving an agent a generic `execute_bash` tool with root access, allowing it to accidentally run `rm -rf /` or overwrite system files.
- Allowing an agent to read arbitrary paths on the host system via `../../.ssh/id_rsa`.
- Omitting timeouts on tool calls, causing the entire agent process to hang forever when a script waits for user input.

## Concrete Real-World Example
Scenario: An autonomous coding agent attempts to clean up temporary files and generates a command to delete the entire project directory due to a variable expansion bug.
Prompt: Implement safety guardrails and permission gates for this coding agent's filesystem tools.
Application: The AI creates a `SafeToolRunner` enforcing path containment within `/workspace`, flags all deletion operations as Tier 3 requiring human confirmation, validates arguments via Pydantic, and prevents execution outside the approved directory.
