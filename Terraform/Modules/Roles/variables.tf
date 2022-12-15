variable "resource_group_location" {
  default     = "France Central"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "RBA_MH_rg"
  description = "name of the resource group."
}


variable "user_assigned_identity" {
  default     = "rba-mh-user"
  description = "name of the user."
}

