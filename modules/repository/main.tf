resource "github_repository" "this" {
  name = var.repository_name
  description = try(var.repository_options.description, null)

  vulnerability_alerts = true
  has_projects         = false # TODO
  has_downloads        = true  # TODO

  has_wiki     = try(var.repository_options.has_wiki, true)
  has_issues   = try(var.repository_options.has_issues, null)
  homepage_url = try(var.repository_options.homepage_url, null)

  allow_rebase_merge = false
  allow_squash_merge = false

  security_and_analysis {
#    advanced_security {
#      status = "enabled"
#    }

    secret_scanning {
      status = "enabled"
    }

    secret_scanning_push_protection {
      status = "enabled"
   }
}

  lifecycle {
    prevent_destroy = true
  }
}
