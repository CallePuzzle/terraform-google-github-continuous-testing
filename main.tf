/*
** Service account
*/
locals {
  project_roles = [
    for role in var.sa_roles:
    "${var.project}=>${role}"
  ]
}

module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 2.0"
  project_id    = var.project
  generate_keys = true
  names         = [var.sa_name]
  project_roles = local.project_roles
}

/*
** Secrets
*/
locals {
  credentials = [
    var.project,
    var.region,
    base64encode(module.service_accounts.key),
  ]
  gcp_credentials = zipmap(var.github_secret_gcp_names, local.credentials)
}

resource "github_actions_secret" "gcp-credentials" {
  for_each = local.gcp_credentials
  provider = github
  repository = var.repository
  secret_name      = each.key
  plaintext_value  = each.value

  depends_on = [module.service_accounts]
}

resource "github_actions_secret" "additional_secrets" {
  for_each = var.additional_secrets
  provider = github
  repository = var.repository
  secret_name      = each.key
  plaintext_value  = each.value

  depends_on = [module.service_accounts]
}
