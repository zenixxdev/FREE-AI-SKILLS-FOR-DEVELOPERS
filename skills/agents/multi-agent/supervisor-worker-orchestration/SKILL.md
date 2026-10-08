---
name: "supervisor-worker-orchestration"
description: "Architecting resilient multi-agent systems using a centralized Supervisor pattern, specialized Worker agents, inter-agent message buses, and consensus aggregation."
category: "agents"
subcategory: "multi-agent"
language: "python"
framework: "none"
technology: "multi-agent"
difficulty: "advanced"
tags: ["agents", "multi-agent", "supervisor-worker", "hierarchical", "consensus", "orchestration"]
---

# Multi-Agent Systems with Supervisor-Worker Hierarchies

## Purpose
Instruct AI agents to author scalable multi-agent systems where a Supervisor agent delegates specialized subtasks to domain-expert Workers, reviews outputs, and synthesizes results.

## When to Use
Use when building complex end-to-end applications requiring diverse specializations: research, software architecture, security review, coding, and technical writing.

## Inputs / Context
Overall project goal, worker agent personas (Coder, Reviewer, Tester, Researcher), supervisor routing logic, and shared state memory.

## Instructions
1. Structure the Supervisor-Worker Hierarchy:
   - Supervisor Agent: Acts as the orchestrator. Analyzes the global goal, decomposes it into tasks, routes tasks to appropriate Worker agents, inspects worker outputs for quality, and decides when the mission is accomplished.
   - Specialized Worker Agents: Focused, domain-specific agents with narrow toolsets (e.g., `ResearchAgent` has web search tools; `CodingAgent` has filesystem and bash tools; `SecurityAgent` has static analysis tools).
2. Maintain Centralized State via Shared Blackboard:
   - Workers do not message each other in an unconstrained, chaotic peer-to-peer web (which causes infinite conversational ping-pong).
   - All communication flows through the Supervisor and a shared state Blackboard (`SharedContext`).
3. Define Structured Worker Handoff Contracts:
   - Supervisor invokes workers with explicit task prompts and expected schema outputs.
   - Workers return structured status objects: `{"status": "completed" | "needs_clarification" | "failed", "artifacts": [...], "notes": "..."}`.
4. Implement Consensus and Verification Gates:
   - Before accepting a feature, the Supervisor routes the `CodingAgent`'s artifact to the `TesterAgent` and `SecurityAgent` for independent verification.
   - If any reviewer rejects the artifact, the Supervisor routes the actionable feedback back to the `CodingAgent`.
5. Enforce Hard Delegation Depth and Iteration Limits:
   - Cap maximum total agent interactions (e.g., max 15 handoffs) to prevent infinite loops.

## Constraints / Rules
- Never allow unconstrained peer-to-peer agent chat loops without a supervisory coordinator.
- Do not equip all worker agents with universal access to all tools; enforce role-specific tool isolation.
- Avoid deploying multi-agent systems where a single agent could achieve the goal with less complexity and cost.

## Workflow
1. Define worker agent personas with isolated toolsets.
2. Implement Supervisor evaluation and routing loop.
3. Supervisor dispatches task to primary worker.
4. Output is routed to reviewer/tester worker for verification.
5. Supervisor aggregates approved artifacts into final delivery.

## Expected Output
Multi-agent orchestration framework in Python with Supervisor routing, specialized worker personas, verification gates, and iteration limits.

## Validation Checklist
- [ ] Is communication orchestrated through a centralized Supervisor?
- [ ] Do worker agents possess specialized, isolated toolsets?
- [ ] Are artifacts verified by reviewer/tester agents before approval?
- [ ] Is a hard cap enforced on total multi-agent handoffs?
- [ ] Is shared state managed via a centralized, typed context blackboard?

## Common Mistakes & Antipatterns
- Creating 4 autonomous agents in an open group chat, watching them congratulate each other in an infinite conversational loop without writing any code.
- Giving the `DocumentationAgent` access to filesystem deletion tools, violating least-privilege tool isolation.
- Making the multi-agent hierarchy 5 levels deep, introducing crippling latency and exponential API costs.

## Concrete Real-World Example
Scenario: An enterprise feature request requires researching an API specification, writing the implementation code, and running security vulnerability checks.
Prompt: Build a multi-agent system with a Supervisor, Researcher, Coder, and Security Reviewer.
Application: The AI creates a `SupervisorAgent` that dispatches research to `ResearcherAgent`, passes the research brief to `CoderAgent`, routes the resulting code to `SecurityAgent` for OWASP checks, returns fixes to the coder if vulnerabilities are found, and approves final deployment.
