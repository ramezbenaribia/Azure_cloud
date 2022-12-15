variable "resource_group_name" {
  default     = "rba_mh_aks_rg"
  description = "RG name in Azure"
}

variable "location" {
  default     = "West Europe"
  description = "Resources location in Azure"
}

variable "azurerm_cosmosdb_name" {
  default     = "rba-mh-cosomos-db"
  description = "Cosmos DB name"
}



variable "system_node_count" {
  default     = 3
  description = "Number of AKS worker nodes"
}

variable "acr_name" {
  default     = "RBA_MHacr"
  description = "ACR name"
}
