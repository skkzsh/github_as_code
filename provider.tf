provider "github" {
}

terraform {
  required_version = "~> 1.14"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.10"
    }
  }

  cloud {
    organization = "skkzsh"
    workspaces {
      name = "github_as_code"
    }
  }
}
