# メモ 
- `terraform import 'module.repository["github_as_code"].github_repository.this' github_as_code` (ローカル)
- Terraform Cloud から　`terraform apply` 

# ローカルでterraformする準備
ローカルに `terraform.tfvars` を以下の形式で作成し, 右辺には PAT の値を入れる

```terraform
github_token = "ghp_*******************"
```
