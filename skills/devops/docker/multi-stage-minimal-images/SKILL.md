---
name: "multi-stage-minimal-images"
description: "Constructing secure, lightweight multi-stage Dockerfiles utilizing Alpine or distroless base images, non-root users, build cache mounts, and minimal attack surfaces."
category: "devops"
subcategory: "docker"
language: "dockerfile"
framework: "none"
technology: "docker"
difficulty: "intermediate"
tags: ["devops", "docker", "containers", "multi-stage", "distroless", "security", "hardening"]
---

# Multi-Stage Dockerfiles, Security Hardening, and Minimal Images

## Purpose
Instruct AI agents to author enterprise-grade Dockerfiles that shrink container image sizes from gigabytes to megabytes, accelerate build pipelines, and enforce zero-root container security.

## When to Use
Use when containerizing applications for production, optimizing slow Docker build times, or remediating container security scan vulnerabilities.

## Inputs / Context
Application source code, runtime dependencies, build tools, package manager, and exposed ports.

## Instructions
1. Structure Dockerfiles with Multi-Stage Builds:
   - Stage 1 (Builder): Use a full SDK/toolchain image to compile dependencies and binaries.
   - Stage 2 (Runner): Copy only the final compiled artifact and production runtime dependencies into a minimal, stripped runner image (such as `gcr.io/distroless` or `alpine`).
2. Run as a Non-Root User:
   - Never run container processes as the default `root` user (UID 0).
   - Create an explicit system user and group (e.g., `RUN addgroup -S appgroup && adduser -S appuser -G appgroup`) and declare `USER appuser` before the entrypoint.
3. Optimize Layer Caching with BuildKit Cache Mounts:
   - Leverage `RUN --mount=type=cache,target=/root/.cache` or `/root/.npm` to persist package manager caches between CI builds.
   - Copy dependency definition manifests (`package.json`, `go.mod`, `pom.xml`, `requirements.txt`) and install dependencies BEFORE copying the rest of application source code.
4. Minimize Image Attack Surface:
   - Eliminate build tools, package managers (`apk`, `apt`), compilers, and shell binaries (`/bin/sh`, `/bin/bash`) from the final runtime container.
5. Handle Process Lifecycle (`PID 1`) and Zombie Reaping:
   - Use `dumb-init` or Tini (`ENTRYPOINT ["tini", "--", "..."]`) to properly forward OS signals (`SIGTERM`, `SIGINT`) and reap zombie child processes if not using a system orchestrator.
6. Configure Container Health Checks:
   - Define a native `HEALTHCHECK` instruction to verify process readiness without external agents.
7. Include `.dockerignore`: Exclude `node_modules`, `.git`, `.env`, build artifacts, and test files.

## Constraints / Rules
- Never commit or run containers as `root` in production.
- Never include secret API keys, credentials, or `.env` files in Docker images; use BuildKit secret mounts (`--mount=type=secret`).
- Avoid using the `latest` tag in `FROM` directives; pin specific SHA digests or semantic versions.

## Workflow
1. Draft `.dockerignore` to exclude local artifacts and secrets.
2. Author Stage 1 (Builder) installing build dependencies and compiling code.
3. Author Stage 2 (Runner) using a minimal distroless/alpine base.
4. Create and switch to non-root user.
5. Add PID 1 init process wrapper and healthcheck instruction.
6. Scan final image with Trivy to verify zero critical/high CVEs.

## Expected Output
Hardened, multi-stage Dockerfile producing a minimal, non-root, production-ready container image.

## Validation Checklist
- [ ] Does the Dockerfile use multi-stage builds?
- [ ] Does the final image run as an unprivileged non-root user?
- [ ] Are build tools and package managers excluded from the runner image?
- [ ] Is `.dockerignore` defined to exclude `.git` and secrets?
- [ ] Does vulnerability scanning (Trivy/Snyk) report 0 critical CVEs?

## Common Mistakes & Antipatterns
- Copying the entire project directory (`COPY . .`) before running `npm install` or `pip install`, completely invalidating Docker's layer cache on every minor code edit.
- Leaving compiler tools (`gcc`, `python3-dev`, `make`) in the final production container, bloating image size by 800MB and introducing CVEs.
- Running Node.js or Python directly as PID 1, preventing the container from responding to `SIGTERM` signals and causing 10-second delays on every deployment.

## Concrete Real-World Example
Scenario: A Node.js Docker image is 1.4 GB in size, runs as root, and contains 45 known CVE vulnerabilities due to leftover build packages.
Prompt: Optimize and harden this Node.js Dockerfile into a production-ready, minimal container.
Application: The AI creates a multi-stage Dockerfile using Alpine, installs dependencies with cache mounts, builds the output, copies only `/app/dist` and production node_modules into a minimal Distroless image, assigns an unprivileged `appuser`, and configures `dumb-init`, shrinking image size to 85MB with 0 CVEs.
