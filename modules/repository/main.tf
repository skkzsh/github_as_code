resource "github_repository" "this" {
  name         = var.repository_name
  description  = try(var.repository_options.description, null)
  topics       = try(var.repository_options.topics, null)
  homepage_url = try(var.repository_options.homepage_url, null)

  has_wiki      = try(var.repository_options.has_wiki, true)
  has_issues    = try(var.repository_options.has_issues, null)
  has_projects  = false # TODO
  has_downloads = true  # TODO

  allow_rebase_merge = false
  allow_squash_merge = false

  allow_update_branch    = true
  delete_branch_on_merge = true

  vulnerability_alerts = true

  security_and_analysis {
    # advanced_security {
    #   status = "enabled"
    # }

    secret_scanning {
      status = "enabled"
    }

    secret_scanning_push_protection {
      status = "enabled"
    }
  }

  # TODO
  # auto_init          = true
  # archive_on_destroy = true

  lifecycle {
    prevent_destroy = true
  }
}

# TODO
# resource "terraform_data" "initial_commit" {
#   provisioner "local-exec" {
#     command = <<EOT
#       git clone https://github.kddi.com/${data.github_user.current.id}/${github_repository.this.name}.git
#       cd ${github_repository.this.name}
#       git commit --allow-empty -m "Create repository"
#       git push -u origin main
#       # rm -rf ${github_repository.this.name}
#     EOT
#   }
#
#   triggers_replace = {
#     repository_name = github_repository.this.name
#   }
#
#   depends_on = [github_repository.this]
# }
