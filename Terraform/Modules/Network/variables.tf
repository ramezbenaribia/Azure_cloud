variable "resource_group_location" {
  default     = "France Central"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "RBA_MH_rg"
  description = "name of the resource group."
}


variable "virtual_network_name" {
  default     = "RBA_MH_acctvn"
  description = "name of the virtual network."
}

variable "subnet_name" {
  default     = "RBA_MH_acctsub"
  description = "name of the subnet."
}


variable "public_ip_name" {
  default     = "RBA_MH_publicIPForLB"
  description = "name of the public IP."
}



variable "security_group_name" {
  default     = "RBA_MH_SecurityGroup"
  description = "name of the Security Group."
}

variable "network_interface_name" {
  default     = "RBA_MH_NIC"
  description = "name of the network interface."
}

