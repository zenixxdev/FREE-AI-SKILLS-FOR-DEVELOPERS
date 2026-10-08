---
name: "chain-of-thought-system-prompts"
description: "Architecting robust, model-agnostic system prompts utilizing XML tagging, few-shot examples, Chain-of-Thought (CoT) reasoning, and strict guardrails."
category: "ai"
subcategory: "prompting"
language: "agnostic"
framework: "none"
technology: "prompt-engineering"
difficulty: "intermediate"
tags: ["ai", "prompting", "chain-of-thought", "system-prompts", "few-shot", "guardrails"]
---

# Model-Agnostic Chain-of-Thought System Prompt Engineering

## Purpose
Provide AI agents and prompt engineers with standardized structural patterns for authoring high-reliability, model-agnostic system prompts that produce deterministic outputs.

## When to Use
Use when crafting system instructions for LLM applications, designing automated agent personas, building extraction pipelines, or eliminating hallucination.

## Inputs / Context
Task objective, target output schema, domain rules, edge cases, and representative positive/negative few-shot examples.

## Instructions
1. Structure System Prompts using Semantic XML Tags:
   - Use clear XML boundary tags to delineate functional prompt sections:
     * `<role>`: Explicit identity, domain expertise, and operational tone.
     * `<context>`: Background scenario and system capabilities.
     * `<instructions>`: Granular, sequential, imperative rules.
     * `<constraints>`: Negative guardrails (things the model must NEVER do).
     * `<reasoning>`: Mandatory step-by-step thinking instructions before outputting the final answer.
     * `<examples>`: High-quality few-shot input/output pairs.
     * `<output_format>`: Exact format constraints (JSON schema, markdown table).
2. Mandate Chain-of-Thought (CoT) Reasoning:
   - Instruct the model to reason through constraints and edge cases in a private `<thinking>` scratchpad tag before generating the final deliverable.
   - Explicit scratchpad reasoning drastically reduces logical errors, hallucinations, and formatting violations.
3. Provide Diverse Few-Shot Demonstrations:
   - Include at least 2-3 realistic few-shot examples demonstrating both standard happy paths and tricky edge cases (e.g., incomplete data, ambiguous queries).
4. Enforce Negative Guardrails and Fallbacks:
   - Explicitly instruct the model on what to do when information is unavailable: 'If the retrieved context does not contain the answer, reply exactly: "Information not found in context." Do not extrapolate or guess.'
5. Maintain Model Agnosticism:
   - Avoid model-specific proprietary prompt syntax; use universal structural conventions (XML, Markdown headers) that work reliably across Claude, GPT-4, Gemini, Llama, and Mistral.

## Constraints / Rules
- Never write vague, subjective instructions like 'Be helpful and concise' without defining operational criteria.
- Never place few-shot examples without clear delimiters separating inputs from outputs.
- Avoid contradictory rules that force the model into logical deadlocks.

## Workflow
1. Define task role and boundary constraints.
2. Structure sections using semantic XML tags.
3. Draft positive and negative few-shot examples.
4. Enforce scratchpad thinking requirements.
5. Benchmark prompt against a suite of 20 edge-case test queries.

## Expected Output
Modular, model-agnostic system prompt template utilizing XML section tags, scratchpad reasoning, and robust negative constraints.

## Validation Checklist
- [ ] Are prompt sections delineated using clear XML tags?
- [ ] Is Chain-of-Thought scratchpad reasoning required before output?
- [ ] Are few-shot examples included with both input and output?
- [ ] Is there an explicit fallback instruction for missing/ambiguous information?
- [ ] Does the prompt perform consistently across multiple LLM families?

## Common Mistakes & Antipatterns
- Dumping 2,000 words of unstructured stream-of-consciousness text into the prompt without headings or delimiters, leading to high instruction drift.
- Telling the model 'never make mistakes', which provides zero actionable guidance.
- Omitting instructions for handling missing context, forcing the model to hallucinate plausible-sounding answers.

## Concrete Real-World Example
Scenario: A customer support AI bot frequently invents company refund policies when users ask about non-standard return situations.
Prompt: Write a robust, grounded system prompt for this return-policy customer support bot.
Application: The AI authors an XML-delimited prompt with `<role>`, `<context>`, `<rules>`, and `<constraints>`, mandates a `<thinking>` tag to cross-reference customer questions against the provided refund knowledge base, and explicitly instructs the bot to state 'I cannot verify this policy' if an exact match is absent.
