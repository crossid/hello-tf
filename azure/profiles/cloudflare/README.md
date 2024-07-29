# cloudflare

This profile deploys the services as container apps and uses Cloudflare as a proxy.

The following resources are provisioned:

- A resouce group to organize our resources.
- A VNet with a subnet for isolating container apps from the public internet.
- Container Apps Environment.
- Container apps instances for API and UI.
- Storage account and a share to store the cloudflare's configurations.

## run (locally)

Initialize the backend and provider plugins:

```
terraform init
```

Copy `template.tfvars` to `<myvars.tfvar>` and set vars (skip _POST apply variables_), then run the following to create infra:

```
cd ./profiles/cloudflare
terraform plan -var-file=../../envs/cloudflare/<myvars>.tfvars
terraform apply -var-file=../../envs/cloudflare/<myvars>.tfvars
```

## Verficiations

- API deployment should be active. `az containerapp revision list -n ca-api-yzcyyjgzntfkm -g rg-usint --output table`
- Ensure DB schema properly created `psql postgresql://citus:password@psql-azure-cluster....azure.com:5432/citus`

## TODO

- Communication between DB and API should be via a private links (https://github.com/crossid/accessbot-infra/issues/1)
