variable "resource_group_location" {
  default     = "France Central"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "RBA_MH_rg"
  description = "name of the resource group."
}




variable "redis_cache_name" {
  default     = "rba-mh-cache"
  description = "name of the redis ."
}


variable "redis_firewall_name" {
  default     = "rba-mh-firewall"
  description = "name of the redis firewall."
}



