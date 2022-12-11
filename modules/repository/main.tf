resource "github_repository" "this" {
  name = var.repository_name

  vulnerability_alerts = true
  has_projects         = false # TODO
  has_downloads        = true  # TODO

  has_wiki     = try(var.repository_options.has_wiki, true)
  has_issues   = try(var.repository_options.has_issues, null)
  homepage_url = try(var.repository_options.homepage_url, null)

  lifecycle {
    prevent_destroy = true
  }
}
