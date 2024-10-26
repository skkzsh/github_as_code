locals {
  repositories = [
    {
      name : "github_as_code"
      description : "GitHub as Code"
    },
    { name : "try-actions" },
    { name : "runner" },

    {
      name : "dsa-kotlin"
      description : "Data Structures and Algorithms with Kotlin"
    },
    {
      name : "ctci-kotlin"
      description : "CTCI with Kotlin"
      has_wiki : false
    },
    { name : "ctci" },
    {
      name : "my_book_algorithm_solution"
      description : "『問題解決力を鍛える!アルゴリズムとデータ構造』を解く"
    },

    {
      name : "llm-notebook"
      description : "Jupyter Notebook about LLM"
    },
    {
      name : "vector_db_container"
      description : "Vector database container"
    },

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

    {
      name : "isucon-playbook"
      description : "ISUCON 秘伝"
      visibility : "private"
    },
  ]
}

module "repository" {
  for_each           = { for r in local.repositories : r.name => r }
  source             = "./modules/repository"
  repository_name    = each.key
  repository_options = each.value
}
