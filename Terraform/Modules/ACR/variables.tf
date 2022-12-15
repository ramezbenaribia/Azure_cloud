variable "resource_group_name" {
  default     = "rba_mh_aks_rg"
  description = "RG name in Azure"
}

variable "location" {
  default     = "West Europe"
  description = "Resources location in Azure"
}

variable "acr_name" {
  default     = "RBA_MHacr"
  description = "ACR name"
}

variable "aks_cluster_id" {
  description = "AKS Cluster ID"
}

