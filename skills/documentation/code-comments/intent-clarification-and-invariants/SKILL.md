---
name: "intent-clarification-and-invariants"
description: "Authoring high-value code comments that document architectural intent, non-obvious business invariants, hardware quirks, and algorithmic complexity rather than restating code."
category: "documentation"
subcategory: "code-comments"
language: "agnostic"
framework: "none"
technology: "code-documentation"
difficulty: "intermediate"
tags: ["documentation", "code-comments", "clean-code", "invariants", "intent", "maintainability"]
---

# Intent-Clarifying Code Comments and Invariant Documentation

## Purpose
Provide AI agents with concrete principles for writing high-value code comments that document the 'Why' and 'Invariants' rather than redundantly narrating the 'What'.

## When to Use
Use when writing complex algorithms, implementing mathematical formulas, working around upstream library bugs, or establishing critical safety invariants.

## Inputs / Context
Source code function or class, business invariant rules, edge case context, and historical bug workarounds.

## Instructions
1. Document the 'WHY', Never the 'WHAT':
   - Redundant Comment (Antipattern): `// Increment count by 1` followed by `count++;` (Adds zero value; wastes reading time).
   - Intent Comment (High Value): `// We increment count before socket dispatch to prevent race conditions where immediate ACK callbacks read stale sequence counters.`
2. Document Domain Invariants and Pre/Post-Conditions:
   - Invariants: Rules that must NEVER be violated (e.g., `// Invariant: Account balance must never drop below 0 after debit evaluation`).
   - Pre-conditions: Expected caller state (`// Precondition: items array must be pre-sorted in ascending order by timestamp`).
   - Post-conditions: Guaranteed state upon function exit.
3. Document Non-Obvious Workarounds and External Bug Links:
   - When code looks awkward or counter-intuitive due to a browser quirk or third-party library defect, explicitly cite the issue:
     `// Workaround for Safari 16.4 IndexedDB transaction auto-commit bug: see WebKit bug #254190`
4. Document Big-O Time and Space Complexity on Core Algorithms:
   - Include complexity annotations in function docstrings:
     `// Time Complexity: O(N log K) using min-heap. Space Complexity: O(K).`
5. Keep Comments Synchronized:
   - Outdated comments that contradict the code are more hazardous than no comments at all. Update or delete comments whenever the underlying logic changes.

## Constraints / Rules
- Never write comments that merely rephrase code syntax in plain English.
- Never leave commented-out dead code blocks in production repositories; Git tracks history.
- Avoid using comments as a substitute for clean code; refactor obscure variable names first.

## Workflow
1. Refactor code for maximum self-documenting clarity (expressive variable and function names).
2. Identify non-obvious business rules or performance trade-offs.
3. Formulate concise comments explaining the architectural intent.
4. Document invariants and algorithmic Big-O complexity in docstrings.
5. Review to ensure zero redundant narration comments remain.

## Expected Output
Clean source code accompanied strictly by high-value intent comments, invariant assertions, and complexity docstrings.

## Validation Checklist
- [ ] Do comments explain 'Why' rather than 'What'?
- [ ] Are critical domain invariants explicitly documented?
- [ ] Are weird workarounds linked to bug tracker URLs?
- [ ] Is Big-O complexity noted on algorithmic functions?
- [ ] Is commented-out dead code completely eliminated?

## Common Mistakes & Antipatterns
- Writing `/* Loop through users */` above `for (const user of users)`, adding visual clutter with zero information gain.
- Leaving a 40-line commented-out block of old code 'just in case we need it later', polluting the file.
- Changing a function to return cents instead of dollars, but leaving an old comment that says `// Returns amount in dollars`.

## Concrete Real-World Example
Scenario: A payment reconciliation loop has an unusual `sleep(250)` between batches that confuses new developers who try to delete it to 'optimize' speed.
Prompt: Write high-value intent comments explaining this payment batch throttling logic.
Application: The AI documents the operational invariant: `// Rate-limit throttle: Stripe restricts bulk transfers to 20 ops/sec per account. This 250ms sleep caps batch rate at 4 batches/sec (16 ops/sec), preventing HTTP 429 backoff storms that degrade webhook processing.`
