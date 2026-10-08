---
name: "directed-acyclic-graph-orchestration"
description: "Orchestrating complex multi-agent workflows using stateful Directed Acyclic Graphs (DAGs), conditional branching, human review checkpoints, and state persistence."
category: "agents"
subcategory: "workflows"
language: "python"
framework: "none"
technology: "workflow-dag"
difficulty: "advanced"
tags: ["agents", "workflows", "dag", "state-machine", "orchestration", "human-in-the-loop"]
---

# Agent Workflow Orchestration with Directed Acyclic Graphs (DAGs)

## Purpose
Instruct AI agents to author structured, reliable agent workflows modeled as stateful Directed Acyclic Graphs (similar to LangGraph) with explicit state transitions and human-in-the-loop gates.

## When to Use
Use when coordinating multi-step software release pipelines, content generation review cycles, complex customer onboarding, or multi-stage data ETL.

## Inputs / Context
Workflow nodes (agent functions), edges (transitions), state schema, conditional routing logic, and checkpoint storage.

## Instructions
1. Model Workflows as Explicit State Graphs:
   - Define a centralized, immutable `AgentState` schema (using Pydantic or TypedDict) passed between all nodes in the graph.
   - Nodes: Pure or async functions that take `AgentState`, execute an agent or tool action, and return a dictionary of state updates.
   - Edges: Explicit transition paths connecting nodes.
2. Support Conditional Branching:
   - Use Conditional Edges: A router function evaluates current state and returns the name of the next destination node (e.g., `if state['quality_score'] < 0.8: return 'refine_draft'; else: return 'publish'`).
3. Checkpoint State Persistence:
   - Save the complete graph state to a persistent database (Postgres/Redis) after every node execution.
   - Enables time-travel debugging, session resumption across server restarts, and auditability.
4. Integrate Human-in-the-Loop Interrupts:
   - Define Interrupt Gates: Pause graph execution before entering high-risk nodes (e.g., `DeployToProdNode`), persist state, and wait for human approval or feedback input before resuming.
5. Cycle Prevention and Loop Limits:
   - For cyclical workflows (e.g., draft -> review -> refine -> review), enforce a strict `max_revisions` counter in the state to prevent infinite refinement loops.

## Constraints / Rules
- Never allow workflows to cycle indefinitely without a hard iteration limit.
- Do not store un-serializable objects (like open network sockets or active threads) in the workflow state.
- Avoid building monolithic nodes that perform multiple unrelated agent tasks in a single function.

## Workflow
1. Define shared `AgentState` schema.
2. Implement atomic node functions returning state patches.
3. Define standard and conditional edge routing rules.
4. Attach state checkpointer for persistence.
5. Execute graph and verify state transitions and termination conditions.

## Expected Output
Modular DAG workflow engine implementation with state persistence, conditional branching, human-in-the-loop pauses, and loop guardrails.

## Validation Checklist
- [ ] Is shared state defined using a strongly typed schema?
- [ ] Are nodes implemented as modular functions returning state updates?
- [ ] Do cyclical refinement paths enforce a maximum iteration limit?
- [ ] Can workflow state be paused for human approval and resumed cleanly?
- [ ] Is state persisted at checkpoints between node transitions?

## Common Mistakes & Antipatterns
- Writing cyclical agent loops (draft -> review -> draft) without a loop counter, causing the agent to burn through $50 of API credits refining a comma.
- Mutating global state across nodes instead of returning explicit state patches, causing race conditions in parallel branches.
- Losing all workflow progress when the server restarts because state was kept only in local memory.

## Concrete Real-World Example
Scenario: A technical blog publishing workflow needs to generate an outline, write content, review technical accuracy, and require human editor approval before publishing.
Prompt: Build a stateful DAG workflow for this technical content publishing pipeline in Python.
Application: The AI defines an `ArticleState` TypedDict, creates nodes for `Outline`, `Draft`, `Review`, and `Publish`, routes through a conditional edge that returns to `Draft` if review score < 8 (capped at 2 revisions), pauses at an approval interrupt gate before `Publish`, and persists state in SQLite.
