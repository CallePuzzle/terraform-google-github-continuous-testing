/*
** Outpus
*/
output "email" {
  sensitive = true
  value = module.service_accounts.email
}

output "key" {
  sensitive = true
  value = module.service_accounts.key
}
