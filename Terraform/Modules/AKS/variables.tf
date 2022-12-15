variable "resource_group_name" {
  default     = "rba_mh_aks_rg"
  description = "RG name in Azure"
}

variable "location" {
  default     = "West Europe"
  description = "Resources location in Azure"
}

variable "cluster_name" {
  default     = "terraform-aks"
  description = "AKS name in Azure"
}



variable "system_node_count" {
  default     = 3
  description = "Number of AKS worker nodes"
}
