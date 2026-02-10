locals {
  repositories = [
    {
      name : "github_as_code"
      description : "GitHub as Code"
    },
    {
      name : "try-actions"
      visibility : "private"
    },
    {
      name : "common-actions"
      visibility : "private"
    },
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
      name : "qiita"
      homepage_url : "https://qiita.com/skkzsh"
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
      has_issues: true
      has_projects: true
    },
    {
      name : "isucon14"
      description : "ISUCON14"
      visibility : "private"
      has_issues: true
      has_projects: true
    },
    {
      name : "isucon12f"
      description : "ISUCON12 本選"
      has_issues: true
      has_projects: true
    },
    {
      name : "isucon12q"
      description : "ISUCON12 予選"
      has_issues: true
      has_projects: true
    },
    {
      name : "isucon11q"
      description : "ISUCON11 予選"
      has_issues: true
      has_projects: true
    },
  ]
}

module "repository" {
  for_each           = { for r in local.repositories : r.name => r }
  source             = "./modules/repository"
  repository_name    = each.key
  repository_options = each.value
}
