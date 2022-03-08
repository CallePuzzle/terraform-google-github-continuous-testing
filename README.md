** Service account

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 2.7, <4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_service_accounts"></a> [service\_accounts](#module\_service\_accounts) | terraform-google-modules/service-accounts/google | ~> 2.0 |

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.additional_secrets](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.gcp-credentials](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/actions_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_secrets"></a> [additional\_secrets](#input\_additional\_secrets) | n/a | `map` | `{}` | no |
| <a name="input_github_secret_gcp_names"></a> [github\_secret\_gcp\_names](#input\_github\_secret\_gcp\_names) | n/a | `list(string)` | <pre>[<br>  "PROJECT_ID",<br>  "REGION",<br>  "SA_KEY",<br>  "SA_EMAIL"<br>]</pre> | no |
| <a name="input_organization"></a> [organization](#input\_organization) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east1"` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | n/a | `string` | n/a | yes |
| <a name="input_sa_name"></a> [sa\_name](#input\_sa\_name) | n/a | `string` | n/a | yes |
| <a name="input_sa_roles"></a> [sa\_roles](#input\_sa\_roles) | n/a | `list(string)` | <pre>[<br>  "roles/viewer"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_email"></a> [email](#output\_email) | n/a |
| <a name="output_key"></a> [key](#output\_key) | n/a |
