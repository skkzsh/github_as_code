provider "github" {
}

terraform {
  required_version = "~> 1.9"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.2"
    }
  }

  cloud {
    organization = "skkzsh"
    workspaces {
      name = "github_as_code"
    }
  }
}
