variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "udacity-project"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created"
  default = "East US"
}

variable "resource_group" {
  description = "The resource_group name."
  default = "Azuredevops"
}

variable "username" {
  description = "The username for VM."
  default = "AzureUser"
}

variable "tenant_id" {
  description = "The tenant_id  of cloud."
  default = "05bf8720-6210-4dca-9889-7db4621249e7"
}

variable "subscription_id" {
  description = "The subscription_id of cloud."
  default = "eff80a37-dfc5-414b-bfa5-e803f7ab83c3"
}

variable "client_id" {
  description = "The client_id of cloud."
  default = "0a8a9d69-8fe8-405e-95a4-432b7ea777cd"
}

variable "client_secret" {
  description = "The client_secret of cloud."
  default = "RDrhQmFbpaNQcSFVwC4B3ps_0jy7PgMMjI"
}

variable "password" {
  description = "The password for VM."
  default = "Udacity@1234"
}

variable "number_of_vms" {
  description = "Number of VMs"
  type        = number
  default     = 3
}