#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "🚀 Creating FREE-AI-SKILLS-FOR-DEVELOPERS..."

# Root files
touch README.md LICENSE CONTRIBUTING.md CODE_OF_CONDUCT.md SECURITY.md ROADMAP.md CHANGELOG.md

# GitHub
mkdir -p .github/ISSUE_TEMPLATE
touch .github/ISSUE_TEMPLATE/new-skill.md
touch .github/ISSUE_TEMPLATE/skill-request.md
touch .github/ISSUE_TEMPLATE/bug-report.md
touch .github/PULL_REQUEST_TEMPLATE.md

# Docs
mkdir -p docs
touch docs/getting-started.md
touch docs/skill-format.md
touch docs/naming-conventions.md
touch docs/contribution-guide.md

# Templates
mkdir -p templates
touch templates/SKILL.md

# Main skill categories
categories=(
ui
ux
frontend
backend
logic
database
api
authentication
security
testing
debugging
performance
devops
mobile
game-development
ai
agents
automation
cloud
github
git
architecture
documentation
general
)

for category in "${categories[@]}"; do
    mkdir -p "skills/$category"
done

# UI
mkdir -p \
skills/ui/web \
skills/ui/mobile \
skills/ui/general

# UX
mkdir -p \
skills/ux/research \
skills/ux/design \
skills/ux/accessibility

# Frontend
mkdir -p \
skills/frontend/html \
skills/frontend/css \
skills/frontend/javascript \
skills/frontend/typescript \
skills/frontend/react \
skills/frontend/nextjs \
skills/frontend/vue \
skills/frontend/angular \
skills/frontend/svelte

# Backend
mkdir -p \
skills/backend/python \
skills/backend/javascript \
skills/backend/typescript \
skills/backend/java \
skills/backend/go \
skills/backend/rust \
skills/backend/php \
skills/backend/general

# Logic
mkdir -p \
skills/logic/problem-solving \
skills/logic/algorithms \
skills/logic/state-management \
skills/logic/validation \
skills/logic/error-handling \
skills/logic/business-logic

# Database
mkdir -p \
skills/database/sql \
skills/database/postgresql \
skills/database/mysql \
skills/database/mongodb \
skills/database/sqlite \
skills/database/supabase \
skills/database/firebase \
skills/database/redis

# API
mkdir -p \
skills/api/rest \
skills/api/graphql \
skills/api/websocket \
skills/api/grpc \
skills/api/webhooks

# Authentication
mkdir -p \
skills/authentication/oauth \
skills/authentication/jwt \
skills/authentication/sessions \
skills/authentication/passkeys \
skills/authentication/magic-links \
skills/authentication/permissions

# Security
mkdir -p \
skills/security/secure-coding \
skills/security/authentication \
skills/security/authorization \
skills/security/api-security \
skills/security/vulnerability-fixing

# Testing
mkdir -p \
skills/testing/unit \
skills/testing/integration \
skills/testing/e2e \
skills/testing/playwright \
skills/testing/jest \
skills/testing/vitest \
skills/testing/pytest

# Debugging
mkdir -p \
skills/debugging/errors \
skills/debugging/performance \
skills/debugging/crashes \
skills/debugging/troubleshooting

# Performance
mkdir -p \
skills/performance/frontend \
skills/performance/backend \
skills/performance/database \
skills/performance/mobile

# DevOps
mkdir -p \
skills/devops/docker \
skills/devops/linux \
skills/devops/nginx \
skills/devops/ci-cd \
skills/devops/github-actions \
skills/devops/deployment

# Mobile
mkdir -p \
skills/mobile/android/kotlin \
skills/mobile/android/java \
skills/mobile/android/jetpack-compose \
skills/mobile/android/xml \
skills/mobile/flutter \
skills/mobile/react-native \
skills/mobile/ios

# Game Development
mkdir -p \
skills/game-development/unity \
skills/game-development/unreal-engine \
skills/game-development/godot \
skills/game-development/threejs \
skills/game-development/web-games \
skills/game-development/game-design

# AI
mkdir -p \
skills/ai/prompting \
skills/ai/llm-integration \
skills/ai/rag \
skills/ai/embeddings \
skills/ai/structured-output \
skills/ai/tool-calling \
skills/ai/multimodal \
skills/ai/ai-evaluation

# Agents
mkdir -p \
skills/agents/planning \
skills/agents/tool-use \
skills/agents/memory \
skills/agents/workflows \
skills/agents/coding-agents \
skills/agents/multi-agent

# Automation
mkdir -p \
skills/automation/python \
skills/automation/javascript \
skills/automation/shell \
skills/automation/github \
skills/automation/browser

# Cloud
mkdir -p \
skills/cloud/aws \
skills/cloud/azure \
skills/cloud/google-cloud \
skills/cloud/general

# GitHub
mkdir -p \
skills/github/repositories \
skills/github/issues \
skills/github/pull-requests \
skills/github/actions \
skills/github/releases

# Git
mkdir -p \
skills/git/branching \
skills/git/merging \
skills/git/rebasing \
skills/git/conflict-resolution

# Architecture
mkdir -p \
skills/architecture/system-design \
skills/architecture/clean-architecture \
skills/architecture/microservices \
skills/architecture/scalability

# Documentation
mkdir -p \
skills/documentation/readme \
skills/documentation/api-docs \
skills/documentation/code-comments \
skills/documentation/technical-writing

# General
mkdir -p \
skills/general/code-review \
skills/general/refactoring \
skills/general/code-generation \
skills/general/project-planning \
skills/general/best-practices

# Basic README
cat > README.md <<'README'
# FREE AI SKILLS FOR DEVELOPERS

A free, open-source collection of reusable AI skills for developers.

## Categories

- UI / UX
- Frontend
- Backend
- Logic
- Database
- API
- Authentication
- Security
- Testing
- Debugging
- Performance
- DevOps
- Mobile
- Game Development
- AI
- Agents
- Automation
- Cloud
- GitHub
- Git
- Architecture
- Documentation
- General

## Goal

Build a large, community-driven library of high-quality AI skills that developers can use with modern AI coding assistants.

## License

Open source.
README

# Skill template
cat > templates/SKILL.md <<'SKILL'
---
name: Skill Name
description: Short description of what this skill does.
category: category
tags:
  - tag1
  - tag2
---

# Skill Name

## Purpose

Describe what this skill helps the AI accomplish.

## When to Use

Explain when this skill should be used.

## Instructions

1. Analyze the user's requirements.
2. Follow the existing project architecture.
3. Implement the requested solution.
4. Validate the result.
5. Explain important decisions.

## Rules

- Follow best practices.
- Keep the implementation clean.
- Avoid unnecessary dependencies.
- Preserve existing functionality.

## Expected Output

Describe what the AI should produce.

## Validation Checklist

- [ ] Requirements fulfilled
- [ ] Code is clean
- [ ] No unnecessary changes
- [ ] Errors handled
- [ ] Output validated
SKILL

# Git
git init
git add .
git commit -m "chore: initialize AI skills library"

echo ""
echo "========================================"
echo "✅ FREE AI SKILLS repository created!"
echo "========================================"
echo ""
echo "📁 Location:"
echo "$PWD"
echo ""
echo "📊 Folder count:"
find skills -type d | wc -l
echo ""
echo "📄 Files:"
find . -type f | wc -l
echo ""
echo "Next:"
echo "1. Add your GitHub remote"
echo "2. git push -u origin main"
echo ""
