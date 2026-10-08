---
name: "managed-identity-and-cloud-native"
description: "Architecting secure Azure cloud-native services utilizing User-Assigned Managed Identities, Azure Key Vault secret retrieval, and Azure App Service / Container Apps."
category: "cloud"
subcategory: "azure"
language: "bicep"
framework: "azure"
technology: "azure-cloud"
difficulty: "advanced"
tags: ["cloud", "azure", "managed-identity", "key-vault", "bicep", "security", "zero-trust"]
---

# Azure Cloud-Native Architecture with Managed Identities and Key Vault

## Purpose
Instruct AI agents to eliminate static credentials and connection strings in Azure deployments by enforcing Managed Identities, RBAC role assignments, and Azure Key Vault references.

## When to Use
Use when deploying web apps on Azure App Service, Azure Container Apps, or Azure Functions accessing Azure SQL, Cosmos DB, or Blob Storage.

## Inputs / Context
Azure services to connect, resource group topology, RBAC roles required, and Infrastructure-as-Code definitions (Bicep/ARM).

## Instructions
1. Eliminate Hardcoded Credentials using Managed Identities:
   - Enable User-Assigned Managed Identity on compute resources (App Service, Container Apps, VMs).
   - Use Azure AD (Entra ID) token-based authentication to connect to downstream services (Azure SQL, Cosmos DB, Azure Storage) rather than storing database usernames/passwords in connection strings.
2. Least-Privilege Azure RBAC Role Assignments:
   - Assign built-in Azure RBAC roles directly to the Managed Identity:
     * Azure Storage: `Storage Blob Data Contributor` (instead of using raw Storage Account Access Keys).
     * Service Bus: `Azure Service Bus Data Receiver` / `Sender`.
     * Key Vault: `Key Vault Secrets User`.
3. Secret Management via Azure Key Vault:
   - For third-party API keys that do not support Managed Identity (e.g., Stripe, SendGrid), store them in Azure Key Vault.
   - Configure App Service to reference secrets using Key Vault References: `@Microsoft.KeyVault(VaultName=myvault;SecretName=mysecret)`. The Azure platform resolves the secret automatically at runtime without custom code.
4. Network Isolation and Private Endpoints:
   - Disable public network access on Azure SQL and Storage Accounts.
   - Connect compute services to storage services using Azure Virtual Network (VNet) Integration and Private Endpoints with Private DNS Zones.

## Constraints / Rules
- Never commit Azure Storage Account Connection Strings or SQL credentials to repository code or configuration files.
- Never assign broad `Contributor` or `Owner` roles to Managed Identities; use granular Data Plane roles.
- Do not expose Azure Key Vault publicly without VNet / firewall restrictions.

## Workflow
1. Create User-Assigned Managed Identity via Bicep.
2. Assign RBAC roles (`Key Vault Secrets User`, `Storage Blob Data Contributor`) to identity.
3. Configure App Service / Container App with the Managed Identity.
4. Author Bicep templates provisioning VNet and Private Endpoints.
5. Connect in application code using `DefaultAzureCredential` from `@azure/identity`.

## Expected Output
Production Azure Bicep template and application code connecting to Azure resources securely using `DefaultAzureCredential` and Managed Identities with zero static secrets.

## Validation Checklist
- [ ] Are static credentials eliminated in favor of Managed Identity?
- [ ] Are RBAC role assignments granted with least-privilege data plane scopes?
- [ ] Are third-party secrets stored in Azure Key Vault?
- [ ] Is application code utilizing `DefaultAzureCredential`?
- [ ] Is public network access disabled on database and storage resources?

## Common Mistakes & Antipatterns
- Hardcoding `AccountKey=...` in Azure Storage connection strings in `appsettings.json`, allowing anyone with repo access to download all customer files.
- Granting `Key Vault Administrator` role to an application identity instead of `Key Vault Secrets User`.
- Storing client secrets in code to authenticate against Azure AD instead of leveraging Azure Managed Identity.

## Concrete Real-World Example
Scenario: An Azure App Service connects to Azure Blob Storage using a shared access key stored in plain text in an environment variable.
Prompt: Refactor this Azure deployment to use Managed Identity and Bicep with zero stored keys.
Application: The AI authors a Bicep template creating a User-Assigned Managed Identity, assigns the `Storage Blob Data Contributor` role on the storage account to that identity, binds it to the App Service, and updates the application code to connect using `BlobServiceClient(url, new DefaultAzureCredential())`.
