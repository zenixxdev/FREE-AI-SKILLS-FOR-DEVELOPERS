---
name: "distributed-trace-investigation"
description: "Troubleshooting distributed microservice failures and latency anomalies using OpenTelemetry, W3C Trace Context, span hierarchy analysis, and log correlation."
category: "debugging"
subcategory: "troubleshooting"
language: "agnostic"
framework: "none"
technology: "opentelemetry"
difficulty: "advanced"
tags: ["debugging", "troubleshooting", "distributed-tracing", "opentelemetry", "microservices", "latency"]
---

# Distributed Trace Analysis and Microservice Troubleshooting

## Purpose
Instruct AI agents to troubleshoot cross-service failures and latency bottlenecks in distributed architectures by following trace IDs, span cascades, and correlated logs.

## When to Use
Use when an end-to-end request traverses multiple microservices, queues, and databases, and suffers from unexplained latency or cascading 500 errors.

## Inputs / Context
Trace ID, distributed trace span JSON (Jaeger, Zipkin, Datadog), service topology map, and correlated log streams.

## Instructions
1. Propagate W3C Trace Context across all boundaries:
   - Ensure the `traceparent` HTTP header (`00-{trace-id}-{parent-span-id}-{trace-flags}`) is propagated across all inter-service HTTP, gRPC, and messaging queue hops.
2. Analyze the Distributed Trace Span Waterfall:
   - Identify the Root Span (the initial entrypoint request) and total duration.
   - Locate the Critical Path: the sequence of dependent spans that directly determines total wall-clock execution time.
   - Differentiate Serial vs Parallel Spans: spans starting at identical timestamps represent concurrent execution; staggered sequential spans represent blocking dependencies.
3. Diagnose Latency Anomalies:
   - Network Transit Gaps: Compare the completion time of a client span with the start time of the downstream server child span to identify network/queue latency.
   - Database/Cache Bottlenecks: Inspect database client spans for high execution times or repeated identical queries (N+1 query cascades in microservices).
4. Correlate Traces with Structured Logs:
   - Use the `trace_id` and `span_id` embedded in structured log entries to pull all log statements across all services involved in that exact transaction.
5. Identify Failure Origins:
   - In a cascade of 500 errors across 4 microservices, trace downward to the deepest child span marked with `status.code = ERROR` to isolate the originating root failure.

## Constraints / Rules
- Never drop the `traceparent` context header when making outbound HTTP or RPC calls in microservices.
- Do not log unstructured text without injecting the active `trace_id`.
- Avoid creating manual spans for trivial in-memory functions; instrument architectural boundaries.

## Workflow
1. Retrieve the trace waterfall using the transaction `trace_id`.
2. Trace the critical path from root to leaf spans.
3. Identify the span with the highest self-time (total time minus child span durations).
4. Pull correlated service logs matching the failing span ID.
5. Remediate the bottleneck or root failure in the originating microservice.

## Expected Output
Distributed trace diagnosis report detailing the critical path, latency breakdown per service, and root cause failure analysis.

## Validation Checklist
- [ ] Is W3C Trace Context (`traceparent`) verified across all service hops?
- [ ] Is the critical path identified in the span waterfall?
- [ ] Is the deepest originating error span isolated from downstream cascades?
- [ ] Are service logs correlated with `trace_id` and `span_id`?
- [ ] Is network transit time separated from service execution time?

## Common Mistakes & Antipatterns
- Blaming the edge API Gateway for a 5-second timeout when the distributed trace shows that 4.8 seconds were spent waiting on a downstream inventory service database lock.
- Breaking trace context propagation when dispatching background tasks via message queues (Kafka, RabbitMQ), resulting in fragmented, disconnected traces.
- Sifting through millions of logs searching for keywords instead of filtering by the exact transaction `trace_id`.

## Concrete Real-World Example
Scenario: A checkout request takes 8 seconds and intermittently fails with HTTP 504. The web team blames the order service, while the order team blames the payment team.
Prompt: Inspect this OpenTelemetry trace waterfall and determine which service is causing the checkout delay.
Application: The AI analyzes the trace waterfall, observes that the order service called an internal fraud-check microservice sequentially 12 times instead of in parallel, accounting for 7.2 seconds of the 8-second total, pinpointing the exact batching bug in the order service.
