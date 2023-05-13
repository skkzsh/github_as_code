locals {
  # TODO
  repositories = [
    {
      name : "github_as_code"
    },
    {
      name : "try-actions"
    },

#    {
#      name : "dsa-kotlin"
#    },
#
#    {
#      name : "ctci-kotlin"
#    },
#
#    {
#      name : "ctci"
#    },
#
#    {
#      name : "my_book_algorithm_solution"
#    },

    {
      name : "note"
      homepage_url : "https://github.com/skkzsh/note/wiki"
    },
    {
      name : "aws"
      homepage_url : "https://github.com/skkzsh/aws/wiki"
    },

    # {
    #   name : "misc"
    # },

    {
      name : "nginx"
      has_wiki : false
    },
  ]
}

module "repository" {
  for_each           = { for r in local.repositories : r.name => r }
  source             = "./modules/repository"
  repository_name    = each.key
  repository_options = each.value
}
