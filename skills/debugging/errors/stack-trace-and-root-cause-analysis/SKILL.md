---
name: "stack-trace-and-root-cause-analysis"
description: "Systematic methodology for analyzing complex multi-threaded and asynchronous stack traces, isolating root causes, and formulating minimal bug reproductions."
category: "debugging"
subcategory: "errors"
language: "agnostic"
framework: "none"
technology: "debugging"
difficulty: "intermediate"
tags: ["debugging", "stack-trace", "root-cause", "errors", "troubleshooting", "reproduction"]
---

# Stack Trace Analysis and Root Cause Isolation

## Purpose
Equip AI agents with a methodical debugging framework to dissect complex stack traces, trace asynchronous execution boundaries, and identify the root cause behind production errors.

## When to Use
Use when diagnosing unhandled exceptions, analyzing production crash reports (Sentry, Datadog), or debugging failing CI test pipelines.

## Inputs / Context
Raw stack trace, error message, environment details, relevant source code files, and user action sequence.

## Instructions
1. Parse the Stack Trace Top-Down and Bottom-Up:
   - Exception Type and Message: Understand the exact assertion or runtime violation (e.g., `TypeError: Cannot read properties of undefined (reading 'map')`).
   - Deepest Application Frame: Locate the first frame in the stack trace belonging to application source code (ignoring framework and runtime library frames like Express or React internals).
   - Entrypoint Frame: Locate the originating HTTP request, event listener, or message handler frame at the bottom of the trace.
2. Trace the Async Boundary:
   - In asynchronous runtimes (Node.js, Python asyncio), recognize where the stack trace breaks across tick boundaries.
   - Inspect Promise chains and async/await suspension points.
3. Formulate the Failure Hypothesis:
   - Identify which variable was in an unexpected state (null, undefined, uninitialized, empty).
   - Formulate a falsifiable hypothesis explaining why that variable reached that state.
4. Construct a Minimal Reproducible Example (MRE):
   - Strip away unrelated UI components, database tables, and middleware.
   - Write a single failing test case that triggers the exact same stack trace and error message.
5. Implement the Fix at the Root:
   - Fix the underlying state invalidity rather than merely slapping a defensive null check (`foo?.bar`) that masks the bug and leaves system state corrupted.
6. Verify the failing test passes and ensure no regressions are introduced.

## Constraints / Rules
- Never apply band-aid null-checks (`if (!x) return;`) without understanding why `x` was null.
- Do not conclude investigation based on guesswork; always verify against the stack frame line numbers.
- Avoid modifying multiple unrelated files simultaneously during bug isolation.

## Workflow
1. Extract and sanitize stack trace.
2. Map line numbers to source control commit revision.
3. Isolate the exact failing statement.
4. Write a minimal reproduction test case reproducing the failure.
5. Fix the root cause and verify test passes.

## Expected Output
Root cause analysis report detailing the failure mechanism, minimal reproduction test, and clean permanent bug fix.

## Validation Checklist
- [ ] Is the deepest application source code frame identified?
- [ ] Is the exact failing variable and state documented?
- [ ] Is a minimal failing test written before applying the fix?
- [ ] Does the fix resolve the underlying root cause rather than masking the symptom?
- [ ] Does the reproduction test pass after the fix is applied?

## Common Mistakes & Antipatterns
- Slapping optional chaining (`user?.profile?.address?.zip`) on a variable, hiding the fact that the database query failed to load the user profile entirely.
- Getting confused by framework internal frames (like React fiber or Node.js internal stream frames) instead of focusing on user application code.
- Assuming the error happened on the line where the exception was thrown, rather than 10 steps earlier where bad data was ingested.

## Concrete Real-World Example
Scenario: A Node.js backend throws `TypeError: Cannot read properties of undefined (reading 'status')` deep inside an order processing worker.
Prompt: Analyze this stack trace and find the root cause of the crash.
Application: The AI analyzes the trace, determines that `order.payment` is undefined because an upstream webhook failed to create the payment record before emitting the processing event, creates a reproduction test with a payment-less order, and implements transactional order-payment creation to fix the root cause.
