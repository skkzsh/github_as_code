provider "github" {
  token = var.github_token
}

terraform {
  required_version = "~> 1.3.6"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.1"
    }
  }

  cloud {
    organization = "skkzsh"
    workspaces {
      name = "github_as_code"
    }
  }
}
