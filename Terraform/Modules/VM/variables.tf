
variable "resource_group_location" {
  default     = "France Central"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "RBA_MH_rg"
  description = "name of the resource group."
}


variable "ANI_my_terraform_nic_id" {
  description = "name of the virtual machine."
}


variable "virtual_machine_name" {
  default     = "RBA_MH_Jenkins_VM"
  description = "name of the virtual machine."
}


variable "ssh_key_file" {
  default     = "/home/ramez/Desktop/Project_Cloud/Terraform/private_key.pem"
  description = "The path to ssh key file."
}
