# import 用のファイル

locals {
  repos = [ # importしたいリポジトリに応じて適宜編集する
    # "github_as_code", # 例
    "isucon12q",
    "isucon11q",
  ]
}

import {
  for_each = local.repos
  to       = module.repository[each.value].github_repository.this
  id       = each.value
}

# import {
#   for_each = {
#     for p in setproduct(local.repos, local.envs) : join("-", p) => {
#       repo : p[0],
#       env : p[1],
#     }
#   }
#   to = module.repository["${each.value.repo}"].github_repository_environment.this[each.value.env]
#   id = "${each.value.repo}:${each.value.env}"
# }
