---
name: "cloud-run-containerized-microservices"
description: "Deploying scalable, secure containerized microservices on Google Cloud Run utilizing minimum instances, Cloud SQL connectors, Secret Manager, and Workload Identity."
category: "cloud"
subcategory: "google-cloud"
language: "yaml"
framework: "gcp"
technology: "google-cloud-run"
difficulty: "intermediate"
tags: ["cloud", "google-cloud", "gcp", "cloud-run", "containers", "secret-manager", "cloud-sql"]
---

# Google Cloud Run Containerized Architecture and IAM Workload Identity

## Purpose
Provide AI agents with concrete blueprints for architecting high-performance containerized microservices on Google Cloud Run with instant scaling, zero cold-start latency, and secure IAM service accounts.

## When to Use
Use when deploying web applications, REST APIs, or background workers on Google Cloud Platform using serverless containers.

## Inputs / Context
Container image URL, environment variables, Cloud SQL instance connection name, CPU/memory allocations, and scaling parameters.

## Instructions
1. Cloud Run Scaling and Resource Configuration:
   - Allocate adequate memory and CPU: e.g., `--memory 1Gi --cpu 1`.
   - Prevent Cold Starts on Latency-Sensitive Endpoints: Configure `--min-instances 1` or `2` to keep warm container instances ready for immediate request processing.
   - Configure Concurrency: Set `--concurrency 80` (or appropriate thread limit for the runtime) to allow multiple concurrent requests per container instance, drastically reducing infrastructure costs compared to single-concurrency Lambda.
   - Configure Maximum Instances: Always set `--max-instances` to prevent uncontrolled auto-scaling from exhausting downstream database connections or exceeding cloud budgets during DDoS attacks.
2. Secure Database Connectivity with Cloud SQL Auth Proxy:
   - Never expose Cloud SQL to the public internet.
   - Connect via Cloud Run's built-in Cloud SQL integration: configure `--add-cloudsql-instances project:region:instance` and connect via Unix domain socket (`/cloudsql/project:region:instance`).
3. Inject Secrets via Secret Manager:
   - Never pass plaintext passwords or API keys in `--set-env-vars`.
   - Mount secrets as environment variables directly from Google Secret Manager: `--set-secrets DB_PASSWORD=projects/PROJECT_ID/secrets/db-pass:latest`.
4. Dedicated Service Account with Least Privilege:
   - Create a dedicated Google Service Account for the Cloud Run service (`--service-account my-service@project.iam.gserviceaccount.com`).
   - Grant only specific roles: `roles/cloudsql.client`, `roles/secretmanager.secretAccessor`.

## Constraints / Rules
- Never deploy Cloud Run services using the default Compute Engine service account (`[project-number]-compute@developer.gserviceaccount.com`), which has broad editor permissions.
- Never run Cloud Run services without a configured `--max-instances` limit.
- Do not write persistent data to the local container filesystem; local container filesystems are ephemeral and memory-backed.

## Workflow
1. Build and push container image to Artifact Registry.
2. Provision dedicated Service Account and grant required IAM roles.
3. Configure secrets in Secret Manager.
4. Deploy to Cloud Run with concurrency, min/max instances, and Cloud SQL flags.
5. Verify health checks and auto-scaling behavior.

## Expected Output
Google Cloud deployment script (gcloud CLI or Terraform) configuring Cloud Run service parameters, Secret Manager bindings, Cloud SQL Unix sockets, and custom service accounts.

## Validation Checklist
- [ ] Is a dedicated service account assigned to the Cloud Run service?
- [ ] Is `--max-instances` configured to protect downstream resources?
- [ ] Are secrets mounted directly from Secret Manager?
- [ ] Is database connectivity routed via Unix domain socket or Private IP?
- [ ] Is cold start mitigated using `--min-instances` where necessary?

## Common Mistakes & Antipatterns
- Using the default service account, giving the containerized app permission to modify almost every resource in the GCP project.
- Setting `--concurrency 1` for a Node.js or Go application, forcing Cloud Run to launch a new container for every single concurrent request, inflating costs by 80x.
- Storing uploaded files in `/tmp` in the container, wondering why user files vanish when Cloud Run scales down or restarts.

## Concrete Real-World Example
Scenario: A web API deployed on Cloud Run suffers from 4-second cold starts, exposes plaintext DB passwords in the deploy command, and connects to Cloud SQL over the public internet.
Prompt: Author a production deployment script for this Cloud Run service resolving cold starts and security issues.
Application: The AI creates a dedicated service account with `cloudsql.client` and `secretAccessor`, sets `--min-instances 1` and `--concurrency 80`, mounts database credentials from Secret Manager, and routes database traffic through the native `/cloudsql/...` Unix socket.
