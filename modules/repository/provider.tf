terraform {
  required_version = "~> 1.4.5"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.25"
    }
  }
}
