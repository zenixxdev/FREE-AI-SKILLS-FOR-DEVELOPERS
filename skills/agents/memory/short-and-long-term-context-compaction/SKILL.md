---
name: "short-and-long-term-context-compaction"
description: "Architecting tiered AI agent memory systems combining short-term working buffers, recursive context compaction, and long-term vector-backed episodic memory."
category: "agents"
subcategory: "memory"
language: "python"
framework: "none"
technology: "agent-memory"
difficulty: "advanced"
tags: ["agents", "memory", "context-compaction", "summarization", "episodic-memory", "vector-store"]
---

# Agent Memory Architecture, Context Compaction, and Semantic Recall

## Purpose
Instruct AI agents to author scalable memory systems that enable agents to maintain context across 100+ conversation turns without exceeding context windows or degrading reasoning quality.

## When to Use
Use when building long-running customer support agents, persistent coding assistants, multi-day workflow coordinators, or roleplaying companions.

## Inputs / Context
Message stream, token budget limit, vector store connection, summarization model, and entity extraction rules.

## Instructions
1. Implement Tiered Memory Architecture:
   - Working Memory (Short-Term): The most recent N messages (e.g., last 10-15 turns) retained verbatim in the context window.
   - Compacted Memory (Medium-Term): A running structured summary of older conversation turns, capturing decisions made, user preferences, and unresolved tasks.
   - Episodic / Semantic Memory (Long-Term): Key facts, user entity profiles, and past session summaries stored in a vector database and retrieved on-demand via semantic search.
2. Recursive Context Compaction Algorithm:
   - Monitor total token consumption. When conversation history reaches 75% of context window capacity:
     * Split history into: Old Turns (to be compacted) and Recent Turns (to retain verbatim).
     * Invoke a fast summarization prompt to condense Old Turns into a structured markdown state block:
       `<state_summary>`
       - User Goals: ...
       - Decisions Made: ...
       - Completed Tasks: ...
       - Pending Items: ...
       `</state_summary>`
     * Replace Old Turns with the compact `<state_summary>`, freeing up 70% of context space.
3. Long-Term Memory Extraction and Storage:
   - Asynchronously extract long-term user facts (e.g., 'User prefers TypeScript over JavaScript', 'User timezone is UTC+2') and upsert into a vector store with entity tags.
4. Dynamic Context Assembly:
   - On each incoming user turn, retrieve top-3 relevant facts from Long-Term Memory, prepend the Compacted Memory summary, and append the Working Memory turns.

## Constraints / Rules
- Never discard conversation history blindly without summarizing key decisions and pending tasks.
- Never store raw credentials or sensitive personal information in long-term memory.
- Avoid running context compaction synchronously during user request generation; compact proactively in background tasks.

## Workflow
1. Track token count on each conversation turn.
2. If token threshold is crossed, trigger context compaction.
3. Summarize older turns into a structured state block.
4. Extract long-term user facts and index into vector store.
5. Reconstruct context window with summary + recent turns.

## Expected Output
Modular agent memory manager implementing working memory buffering, automatic background context compaction, and vector episodic retrieval.

## Validation Checklist
- [ ] Does working memory preserve recent turns verbatim?
- [ ] Does context compaction retain critical decisions and pending tasks?
- [ ] Are long-term facts stored in vector memory with semantic retrieval?
- [ ] Is total prompt token size bounded regardless of session length?
- [ ] Can the agent remember decisions made 50 turns earlier?

## Common Mistakes & Antipatterns
- Using a naive FIFO sliding window that truncates the oldest 5 messages, immediately forgetting the user's primary instructions given in message 1.
- Writing vague, conversational summaries ('We talked about code') that lose exact variable names, file paths, and architectural decisions.
- Stuffing all past session memories into the context window simultaneously, triggering massive token costs and context confusion.

## Concrete Real-World Example
Scenario: A coding assistant forgets the user's architectural guidelines after 20 turns of code debugging because the initial prompt scrolled out of the context window.
Prompt: Build an automated context compaction and memory management system for this coding agent.
Application: The AI implements a `MemoryManager` that monitors token usage, compacts turns 1-15 into a concise `<project_state>` block capturing the architecture guidelines and fixed bugs, preserves turns 16-20 verbatim, maintaining full context coherence across 100+ turns.
