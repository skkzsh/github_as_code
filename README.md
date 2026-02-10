# 備忘録

## Terraform Cloudの認証

1. GitHub で PAT を払い出す
1. Terraform Cloud で
   1. [Workspace variables](https://app.terraform.io/app/skkzsh/workspaces/github_as_code/variables) で [`GITHUB_TOKEN`](https://registry.terraform.io/providers/integrations/github/latest/docs#oauth--personal-access-token) を設定
   1. [`terraform apply`](https://app.terraform.io/app/skkzsh/workspaces/github_as_code/runs)

## Terraform の version up
1. `provider.tf` の `required_version` を上げる
1. Terraform Cloud で [Terraform Version](https://app.terraform.io/app/skkzsh/workspaces/github_as_code/settings/general) を上げる
1. (Optional) [.terraform-version](.terraform-version) を上げる

## provider の version up
1. `provider.tf` の `version` を上げる
1. `terraform init -upgrade`
