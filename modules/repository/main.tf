resource "github_repository" "this" {
  name         = var.repository_name
  description  = try(var.repository_options.description, null)
  topics       = try(var.repository_options.topics, null)
  homepage_url = try(var.repository_options.homepage_url, null)

  visibility = try(var.repository_options.visibility, null)

  has_wiki      = try(var.repository_options.visibility, null) == "private" ? null : try(var.repository_options.has_wiki, true)
  has_issues    = try(var.repository_options.has_issues, null)
  has_projects  = try(var.repository_options.has_projects, null)

  allow_rebase_merge = false
  allow_squash_merge = false

  allow_update_branch    = true
  delete_branch_on_merge = true

  vulnerability_alerts = true

  security_and_analysis {
    # advanced_security {
    #   status = "enabled"
    # }

    // free plan の private repository では secret scanning が使えない

    dynamic "secret_scanning" {
      for_each = try(var.repository_options.visibility, null) == "private" ? [] : [""]
      content {
        status = "enabled"
      }
    }

    dynamic "secret_scanning_push_protection" {
      for_each = try(var.repository_options.visibility, null) == "private" ? [] : [""]
      content {
        status = "enabled"
      }
    }
  }

  auto_init          = true
  archive_on_destroy = true

  lifecycle {
    prevent_destroy = true
  }
}
