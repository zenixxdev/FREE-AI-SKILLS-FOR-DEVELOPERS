---
name: "blue-green-and-canary-rollouts"
description: "Architecting zero-downtime deployment pipelines using Blue-Green switching, Canary traffic shifting, automated metric analysis, and instant rollback gates."
category: "devops"
subcategory: "deployment"
language: "agnostic"
framework: "none"
technology: "deployment-strategies"
difficulty: "advanced"
tags: ["devops", "deployment", "blue-green", "canary", "zero-downtime", "rollbacks", "kubernetes"]
---

# Zero-Downtime Blue-Green and Canary Deployment Strategies

## Purpose
Provide AI agents with rigorous deployment patterns to release application updates with zero downtime, gradual risk exposure, automated metric validation, and sub-second rollbacks.

## When to Use
Use when releasing mission-critical services, orchestrating Kubernetes deployments, configuring load balancers, or architecting continuous delivery pipelines.

## Inputs / Context
Current production environment (Blue), new release artifact (Green), load balancer / ingress router, health criteria, and rollback triggers.

## Instructions
1. BLUE-GREEN DEPLOYMENT:
   - Maintain two identical production environments: Blue (active live traffic) and Green (idle staging environment).
   - Deploy the new application version to Green.
   - Run end-to-end smoke tests and synthetic health checks against Green while real users remain entirely on Blue.
   - Cutover: Update the edge router, load balancer, or DNS to switch 100% of live traffic from Blue to Green instantly.
   - Rollback: If critical errors occur post-cutover, immediately flip the router back to Blue within seconds.
   - Decommission or put old Blue on standby once Green proves stable.
2. CANARY DEPLOYMENT:
   - Deploy the new version to a small Canary instance pool receiving 2-5% of live traffic.
   - Automated Canary Analysis (ACA): Monitor error rates (HTTP 5xx), P99 latency, and crash loops between Canary and Baseline over 15-30 minutes.
   - Progressive Rollout: Gradually increase traffic (5% -> 25% -> 50% -> 100%) if metrics remain within acceptable SLA thresholds.
   - Instant Rollback: Automatically abort rollout and route 100% of traffic back to Baseline if error rate spikes above threshold (e.g., > 1%).
3. Backward and Forward Database Schema Compatibility:
   - All database migrations during zero-downtime deployments must follow the Expand and Contract (Parallel Run) pattern.
   - The database must simultaneously support both the old version (Blue) and new version (Green) during the transition period.

## Constraints / Rules
- Never apply breaking database schema changes (e.g., dropping or renaming a column) simultaneously with an application deployment.
- Never switch 100% of traffic to a new version without verified smoke test execution on the new environment.
- Do not dismantle the previous deployment environment until the new release has run stably under live load.

## Workflow
1. Deploy new version to isolated Green/Canary environment.
2. Execute automated synthetic smoke tests against target endpoints.
3. Shift 5% of production traffic to Canary.
4. Evaluate Prometheus/CloudWatch metrics (HTTP 5xx, P99 latency) for 15 minutes.
5. If metrics pass, complete rollout to 100%; if metrics degrade, trigger immediate rollback.
6. Keep previous stable version warm for 1 hour post-deployment.

## Expected Output
Zero-downtime deployment orchestration specification featuring automated smoke validation, canary traffic increment gates, and metric-based rollback rules.

## Validation Checklist
- [ ] Are synthetic smoke tests verified before routing live traffic?
- [ ] Is canary traffic incremented gradually with automated metric evaluation?
- [ ] Is rollback automated upon error rate or latency threshold breach?
- [ ] Is database schema backward-compatible with both versions?
- [ ] Does live user traffic experience zero dropped connections during cutover?

## Common Mistakes & Antipatterns
- Renaming a database column in the same deployment step, causing the old version to immediately crash while the new version is still booting up.
- Switching 100% of traffic to Green without testing Green's connectivity to databases and internal services.
- Relying on manual human observation to decide whether to roll back instead of automated metric monitoring.

## Concrete Real-World Example
Scenario: A fintech platform experiences an outage during deployment because a bug in a new microservice release is deployed to all servers at once.
Prompt: Design a Canary deployment pipeline with automated rollback for this service on Kubernetes.
Application: The AI configures an Argo Rollouts canary strategy starting at 5% traffic weight for 10 minutes, sets an automated analysis template monitoring Prometheus HTTP 5xx error percentage (< 0.5%), promotes to 20%, 50%, and 100% upon success, and aborts to the baseline revision automatically if errors exceed 1%.
