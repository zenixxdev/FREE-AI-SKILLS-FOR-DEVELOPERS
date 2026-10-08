---
name: "multi-region-disaster-recovery"
description: "Architecting multi-region high availability and disaster recovery strategies (Active-Active, Active-Passive, Pilot Light) with DNS failover, RPO/RTO budgeting, and data replication."
category: "cloud"
subcategory: "general"
language: "agnostic"
framework: "none"
technology: "cloud-architecture"
difficulty: "advanced"
tags: ["cloud", "disaster-recovery", "high-availability", "multi-region", "rpo-rto", "failover"]
---

# Cloud Multi-Region Disaster Recovery and High Availability

## Purpose
Provide AI agents with rigorous architectural principles for designing resilient multi-region cloud disaster recovery strategies tailored to Recovery Point Objective (RPO) and Recovery Time Objective (RTO) targets.

## When to Use
Use when designing enterprise cloud architectures, drafting business continuity plans, preparing for regional data center outages, or meeting regulatory uptime requirements.

## Inputs / Context
Target RTO (time to restore service), target RPO (acceptable data loss window), budget constraints, and database replication capabilities.

## Instructions
1. Define and Budget RPO and RTO Targets:
   - Recovery Point Objective (RPO): Maximum acceptable data loss measured in time (e.g., RPO = 15 minutes means up to 15 minutes of transactional data can be lost during an unrecoverable failure).
   - Recovery Time Objective (RTO): Maximum acceptable downtime to restore operations (e.g., RTO = 1 hour means service must be operational within 60 minutes).
2. Select the Appropriate Disaster Recovery Strategy:
   - Backup & Restore (RPO: hours, RTO: 24h+): Lowest cost. Daily/hourly backups replicated to a secondary region. Compute provisioned from scratch upon disaster.
   - Pilot Light (RPO: minutes, RTO: hours): Database is continuously replicated to secondary region. Core infrastructure is pre-configured, but compute instances remain idle or scaled to zero until disaster.
   - Warm Standby / Active-Passive (RPO: seconds, RTO: minutes): Scaled-down version of full environment runs continuously in secondary region. Traffic shifted upon failure.
   - Multi-Region Active-Active (RPO: 0, RTO: 0): Full environments run simultaneously in two or more regions. Traffic balanced dynamically. Requires distributed databases (e.g., Spanner, CockroachDB, DynamoDB Global Tables).
3. Automated DNS Health Checks and Failover:
   - Configure global DNS (Route 53, Cloudflare) with automated health checks monitoring edge health endpoints.
   - Failover routing automatically redirects traffic away from an unhealthy region within 30-60 seconds.
4. Database Replication and Split-Brain Prevention:
   - Implement asynchronous cross-region database replication for Active-Passive; ensure fencing mechanisms exist so both regions never attempt primary writes simultaneously (Split-Brain catastrophe).
5. Regularly Execute Chaos Engineering / DR Drills:
   - A disaster recovery plan that has never been tested is not a disaster recovery plan. Schedule semi-annual simulated regional failover drills.

## Constraints / Rules
- Never claim zero RTO/RPO without implementing Active-Active distributed consensus databases.
- Avoid multi-region Active-Active writes on standard relational databases (Postgres/MySQL) without conflict resolution or sharding.
- Do not configure automated failover without verifying database replication lag metrics.

## Workflow
1. Calculate RTO, RPO, and budget parameters with stakeholders.
2. Select DR model (Backup & Restore, Pilot Light, Warm Standby, Active-Active).
3. Establish cross-region asynchronous data replication and replication lag alarms.
4. Configure global DNS routing with automated health checks.
5. Create automated runbook scripts for failover and failback.
6. Conduct simulated regional isolation drill.

## Expected Output
Disaster Recovery architecture blueprint specifying RPO/RTO parameters, cross-region replication topology, DNS failover configurations, and failover runbooks.

## Validation Checklist
- [ ] Are RPO and RTO quantitatively defined and approved?
- [ ] Is cross-region database replication configured and monitored for lag?
- [ ] Are global DNS health checks configured for automated failover?
- [ ] Are split-brain protections implemented on the database tier?
- [ ] Has the failover process been tested through a simulated drill?

## Common Mistakes & Antipatterns
- Automatically failing over to a secondary region when the secondary database is 3 hours behind on replication, causing 3 hours of silent data loss.
- Designing Active-Active multi-region writes on a standard single-leader Postgres database, corrupting primary keys and sequence IDs across regions.
- Documenting a DR plan in a PDF that nobody tests until a real outage occurs, only to discover the secondary region AMI images are 2 years out of date.

## Concrete Real-World Example
Scenario: An enterprise SaaS application experiences a 12-hour outage when an entire cloud region suffers an electrical fire because no secondary region infrastructure existed.
Prompt: Design an Active-Passive (Warm Standby) disaster recovery plan with RPO < 1 minute and RTO < 10 minutes.
Application: The AI designs a Warm Standby architecture replicating Postgres to a secondary region using streaming replication, maintains a minimal 2-instance compute pool warm in the secondary region, configures Route 53 DNS failover based on HTTPS health checks, and scripts automated autoscaling to handle 100% traffic on failover.
