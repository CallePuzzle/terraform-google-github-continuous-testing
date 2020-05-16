/*
** Variables
*/
variable "project" {
  type = string
}

variable "region" {
  type = string
  default = "us-east1"
}

variable "sa_name" {
  type = string
}

variable "sa_roles" {
  type = list(string)
  default = ["roles/viewer"]
}

variable "organization" {
  type = string
}

variable "repository" {
  type = string
}

variable "github_secret_gcp_names" {
  type = list(string)
  default = [
    "PROJECT_ID",
    "REGION",
    "SA_KEY",
  ]
}

variable "additional_secrets" {
  type = map
  default = {}
}
