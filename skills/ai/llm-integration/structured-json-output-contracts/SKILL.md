---
name: "structured-json-output-contracts"
description: "Integrating LLMs into production backends with guaranteed JSON schema conformity, Pydantic/Zod parsing, repair pipelines, and temperature tuning."
category: "ai"
subcategory: "llm-integration"
language: "python"
framework: "none"
technology: "llm-json"
difficulty: "intermediate"
tags: ["ai", "llm-integration", "structured-output", "json-schema", "pydantic", "validation"]
---

# LLM Structured JSON Outputs and Schema Enforcement

## Purpose
Instruct AI agents to author reliable backend LLM integration code that guarantees structured JSON output, validates payloads against strict schemas, and heals malformed responses.

## When to Use
Use when extracting data from documents, invoking LLMs to populate database records, generating API payloads, or driving automated workflows.

## Inputs / Context
Pydantic/Zod schema definition, LLM client API, prompt template, and retry policies.

## Instructions
1. Enforce Structured Outputs via Provider APIs:
   - Configure the LLM client to use strict JSON mode or schema-constrained decoding (e.g., `response_format={"type": "json_object"}` or provider-native JSON Schema enforcement).
2. Tune Generation Hyperparameters:
   - Set `temperature = 0.0` or `temperature = 0.1` for deterministic data extraction and structured categorization tasks; higher temperatures increase syntax errors.
3. Validate Output Against Strict Schema Validators:
   - Parse the returned string through Pydantic v2 (`MyModel.model_validate_json(raw_text)`) or Zod (`MySchema.parse(JSON.parse(raw_text))`).
   - Never trust that an LLM response is valid JSON without programmatic runtime validation.
4. Implement a Self-Correction / Healing Retry Loop:
   - If JSON decoding or schema validation fails, capture the exact validation error message.
   - Send the malformed output and the validator error back to the model in a follow-up repair turn:
     `"The previous output failed schema validation: {error_details}. Please fix the JSON and return only valid JSON."`
   - Cap repair attempts at 2-3 retries before failing over or raising an exception.
5. Strip Markdown Code Blocks:
   - LLMs frequently wrap JSON in ```json ... ``` markdown code fences; always strip markdown fences before passing text to the JSON parser.

## Constraints / Rules
- Never evaluate LLM outputs with `eval()` or dangerous deserializers.
- Never pass unvalidated LLM output directly into database write queries.
- Avoid using high temperature (> 0.5) when generating structured data schemas.

## Workflow
1. Define target Pydantic/Zod schema with explicit field descriptions.
2. Generate JSON schema and inject into prompt instructions and provider settings.
3. Invoke LLM with temperature 0.0.
4. Strip markdown fences and parse via schema validator.
5. On validation error, trigger automatic repair prompt loop.

## Expected Output
Robust LLM integration function accepting unstructured input and returning a validated, typed Pydantic or TypeScript object with automated repair handling.

## Validation Checklist
- [ ] Is temperature set to 0.0 for deterministic output?
- [ ] Is raw response parsed through a runtime schema validator?
- [ ] Are markdown code fences stripped automatically before parsing?
- [ ] Is an automated error-correcting repair loop implemented for validation failures?
- [ ] Are field descriptions included in the schema to guide model generation?

## Common Mistakes & Antipatterns
- Calling `json.loads(response)` directly, causing the backend service to crash whenever the LLM includes conversational preamble text before the JSON object.
- Discarding the validation error during retries instead of providing the exact schema error to the model to guide its correction.
- Leaving field meanings ambiguous in the schema without docstrings or descriptions.

## Concrete Real-World Example
Scenario: A resume parsing service frequently crashes because the LLM occasionally omits the required `graduation_year` field or formats it as a string instead of an integer.
Prompt: Write a resilient resume extraction function using Pydantic and an LLM with automated error correction.
Application: The AI defines a `ResumeSchema` with Pydantic v2, passes the JSON schema in the system prompt, catches `ValidationError`, and feeds the exact missing/invalid field error back into a repair prompt, achieving a 99.8% extraction success rate.
