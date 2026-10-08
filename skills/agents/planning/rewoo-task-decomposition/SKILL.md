---
name: "rewoo-task-decomposition"
description: "Architecting reliable AI agents using Reasoning without Observation (ReWOO), plan-first task decomposition, dependency DAGs, and deterministic execution."
category: "agents"
subcategory: "planning"
language: "python"
framework: "none"
technology: "agent-planning"
difficulty: "advanced"
tags: ["agents", "planning", "rewoo", "decomposition", "dag", "orchestration"]
---

# Agent Planning, ReWOO Decomposition, and Dependency Graphs

## Purpose
Instruct AI agents to execute complex, multi-step engineering tasks by first decomposing the objective into an upfront execution plan and dependency DAG before triggering tool calls.

## When to Use
Use when architecting autonomous software agents, multi-step research assistants, complex code migration agents, or data analysis pipelines.

## Inputs / Context
High-level user goal, available tool registry, environment constraints, and intermediate variable dependencies.

## Instructions
1. Adopt the ReWOO (Reasoning without Observation) Architecture:
   - Step 1 (Planner): Generates a complete blueprint of sub-tasks and tool calls upfront, modeling intermediate results as symbolic variables (`#E1`, `#E2`, `#E3`) without executing them.
   - Step 2 (Worker): Executes the planned tool calls in parallel or sequence, substituting resolved outputs into downstream variable placeholders.
   - Step 3 (Solver): Synthesizes the aggregated tool outputs into the final deliverable.
   - Why ReWOO > ReAct: Standard ReAct (Reason-Act-Observe loops) incurs massive token latency and frequently gets lost or derails after 5 iterations; ReWOO creates an explicit execution DAG upfront, reducing API calls by 50% and improving reliability.
2. Structure the Plan as a Dependency DAG:
   - Identify independent tasks that can be executed in parallel (e.g., querying GitHub issues and reading documentation simultaneously).
   - Sequence dependent tasks where output `#E1` is a required input for task `#E2`.
3. Validate Plan Feasibility Before Execution:
   - Ensure every required variable has a corresponding upstream tool producer.
   - Detect and prevent circular dependencies in the plan.
4. Implement Dynamic Plan Re-Evaluation on Critical Failure:
   - If a worker step encounters an unrecoverable failure, invoke the Planner to revise the remaining unfinished nodes in the DAG rather than aborting the entire mission.

## Constraints / Rules
- Never begin executing tools before generating and validating the explicit task decomposition plan.
- Avoid unstructured ReAct loops for tasks requiring more than 4 distinct sequential steps.
- Do not create plans with unresolvable circular variable references.

## Workflow
1. Planner receives goal and produces plan lines with `#E` variable placeholders.
2. Parse plan lines into an executable Directed Acyclic Graph (DAG).
3. Workers execute independent tasks concurrently.
4. Substitute resolved variable values into downstream tasks.
5. Solver synthesizes all `#E` outputs into the final response.

## Expected Output
Modular ReWOO planning engine implementation with step parsing, variable substitution, parallel worker execution, and final solver synthesis.

## Validation Checklist
- [ ] Is an upfront execution plan generated before running tools?
- [ ] Are intermediate outputs modeled as variable placeholders (`#E1`, `#E2`)?
- [ ] Are independent tasks identified and executed in parallel?
- [ ] Is plan execution resilient to individual tool timeouts?
- [ ] Does the solver produce a coherent final answer synthesizing all outputs?

## Common Mistakes & Antipatterns
- Using raw ReAct loops for a 10-step migration, watching the agent enter a hallucinated loop after step 4 because conversation context became too noisy.
- Generating a plan where step 3 requires output from step 4 (unresolvable forward reference).
- Executing all steps sequentially even when 3 independent searches could have been performed in parallel.

## Concrete Real-World Example
Scenario: An autonomous engineering agent is tasked with diagnosing a bug, checking git blame, reviewing recent PRs, and proposing a patch.
Prompt: Implement a ReWOO planning structure for this bug diagnosis agent.
Application: The AI creates a Planner generating `#E1 = SearchLogs()`, `#E2 = ReadSourceFile()`, `#E3 = GitBlame(#E2)`, `#E4 = SearchPRs(#E3)`, executes `#E1` and `#E2` in parallel, chains `#E3` and `#E4`, and feeds all outputs to a Solver that writes the verified bug report and patch.
