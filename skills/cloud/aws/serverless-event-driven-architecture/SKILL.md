---
name: "serverless-event-driven-architecture"
description: "Architecting scalable, resilient event-driven cloud systems on AWS utilizing Lambda, SQS Dead-Letter Queues (DLQs), EventBridge buses, and IAM least-privilege policies."
category: "cloud"
subcategory: "aws"
language: "python"
framework: "aws-sam"
technology: "aws-serverless"
difficulty: "advanced"
tags: ["cloud", "aws", "serverless", "lambda", "sqs", "eventbridge", "dlq", "iam"]
---

# AWS Serverless Event-Driven Architecture (Lambda, SQS, EventBridge)

## Purpose
Instruct AI agents to design decoupled, fault-tolerant serverless architectures on AWS that handle traffic spikes, guarantee message durability, and enforce strict IAM permissions.

## When to Use
Use when designing cloud-native microservices, asynchronous task queues, webhooks processors, or event-driven integration pipelines on AWS.

## Inputs / Context
Event schemas, producer services, consumer microservices, throughput targets, and error retention policies.

## Instructions
1. Event Routing with Amazon EventBridge:
   - Use an EventBridge Custom Event Bus to decouple event producers from consumers; avoid direct point-to-point invocations between Lambdas.
   - Define strict Event Schemas and filter rules: consumers subscribe only to specific event details (`source`, `detail-type`).
2. Buffer and Regulate Traffic with SQS Queues:
   - Buffer high-volume events between EventBridge and consumer Lambdas using Amazon SQS to prevent downstream database saturation.
   - Configure SQS Visibility Timeout to at least 6x the downstream Lambda timeout.
   - Configure Lambda Event Source Mapping batching (`BatchSize: 10`, `MaximumBatchingWindowInSeconds: 5`) and enable `ReportBatchItemFailures` so that only failed messages in a batch are retried, not the entire batch.
3. Guarantee Message Durability with Dead-Letter Queues (DLQs):
   - Attach an SQS Dead-Letter Queue (DLQ) with `maxReceiveCount: 3` to every primary queue and Lambda asynchronous invocation.
   - Configure CloudWatch Alarms on `ApproximateNumberOfMessagesVisible > 0` in the DLQ to alert on poison-pill messages.
4. Optimize Lambda Cold Starts and Concurrency:
   - Right-size Lambda memory allocation (which proportionally scales CPU allocation).
   - Set Reserved Concurrency to prevent a rogue function from consuming the entire account-level concurrency quota (default 1,000).
5. Enforce Least-Privilege IAM Roles:
   - Scoped IAM execution roles per Lambda function: grant access only to specific resource ARNs (`Resource: "arn:aws:sqs:..."`) and specific API actions (`Action: ["sqs:ReceiveMessage", "sqs:DeleteMessage"]`). Never use wildcard `Resource: "*"`.
   - Store secrets in AWS Secrets Manager or Systems Manager Parameter Store and retrieve them during initialization (outside the handler).

## Constraints / Rules
- Never write IAM policies with `Resource: "*"` or `Action: "*"` in production.
- Never invoke worker Lambdas synchronously from web request handlers when asynchronous queueing is appropriate.
- Avoid deploying serverless functions without a configured Dead-Letter Queue.

## Workflow
1. Define event schema and publish to EventBridge custom bus.
2. Create target SQS queue with attached DLQ.
3. Author Lambda consumer handler using `ReportBatchItemFailures`.
4. Define IAM policy granting minimal permissions on SQS ARN.
5. Deploy via AWS SAM / CDK and verify with test events.

## Expected Output
Infrastructure-as-Code (SAM/CloudFormation or CDK) and Python Lambda handler code featuring EventBridge routing, SQS buffering, DLQs, and least-privilege IAM roles.

## Validation Checklist
- [ ] Is EventBridge used to decouple event producers and consumers?
- [ ] Is an SQS DLQ attached with CloudWatch alarm monitoring?
- [ ] Is `ReportBatchItemFailures` enabled on Lambda batch processing?
- [ ] Are IAM policies restricted to explicit resource ARNs?
- [ ] Are secrets loaded outside the Lambda invocation handler?

## Common Mistakes & Antipatterns
- Processing SQS batches without `ReportBatchItemFailures`: if message 9 of 10 fails, the entire batch of 10 messages is reprocessed, causing duplicate processing of messages 1-8.
- Setting SQS visibility timeout shorter than Lambda function timeout, causing SQS to redeliver the message to another worker while the first worker is still executing.
- Granting `AdministratorAccess` to a Lambda execution role for development speed and deploying it to production.

## Concrete Real-World Example
Scenario: An order processing Lambda crashes on a single malformed JSON message, causing the entire batch of 10 valid orders to be reprocessed in an infinite loop, charging customer credit cards repeatedly.
Prompt: Refactor this AWS order processing pipeline to handle partial batch failures and isolate poison pills using SQS and DLQs.
Application: The AI configures SQS with a Dead-Letter Queue (`maxReceiveCount: 3`), enables `ReportBatchItemFailures` in the SAM template, and updates the Python Lambda handler to catch individual item exceptions and return `{"batchItemFailures": [{"itemIdentifier": msg_id}]}`, quarantining the bad record while successfully committing the valid 9 orders.
