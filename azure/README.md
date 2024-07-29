# Azure

Infrastructure for deploying AccessBot in Azure.

## Prerequisites

- Azure Subscription: You need to have access to an Azure subscription.
- Azure CLI or Service Principal: Terraform needs to authenticate with Azure. This can be done using Azure CLI logged in locally or by setting up a service principal for programmatic access. (e.g., `az` installed and authenticated. (`az account show`))
- Terraform Installed: Make sure Terraform is installed on your machine.

## Profiles

Choose one of the following depoyment profiles:

- [profiles/cloudflare](profiles/cloudflare/README.md) - Creates infrastructure and use Cloudflare as a proxy.

## Troubleshooting

Problem: MissingSubscriptionRegistration: The subscription is not registered to use namespace 'Microsoft.App'. See https://aka.ms/rps-not-found for how to register subscriptions.

Solution: `az provider register -n Microsoft.App`

## References

- [Azure Container Apps with Cloudflare Blog](medium.com/@asafshakarzy/deploy-and-protect-azure-container-apps-aca-with-cloudflare-024a42836317)
