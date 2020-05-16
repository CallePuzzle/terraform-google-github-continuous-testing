/*
** Providers
*/
provider "google" {
  project     = var.project
  region      = var.region
}
provider "github" {
  organization = var.organization
}
