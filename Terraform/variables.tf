variable "resource_group_location" {
  default     = "France Central"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "RBA_MH_cloud_rg"
  description = "name of the resource group."
}



# Network variables
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

# VM variables

variable "virtual_machine_name" {
  default     = "RBA_MH_Jenkins_VM"
  description = "name of the virtual machine."
}

variable "ssh_key_file" {
  default     = "/home/ramez/Desktop/Project_Cloud/Terraform/private_key.pem"
  description = "The path to ssh key file."
}


# AKS variables


variable "resource_group_location_for_AKS" {
  default     = "West Europe"
  description = "Location of the resource group created for."
}

variable "resource_group_name_for_AKS" {
  default     = "RBA_MH_aks_rg"
  description = "name of the resource group."
}


variable "cluster_name" {
  default     = "RBA-MH-cluster"
  description = "name of the cluster."
}


variable "kubernetes_version" {
  default     = "1.21.2"
  description = "the version of kubernetes."
}


variable "system_node_count" {
  default     = 1
  description = "the number of nodes."
}


# ACR variables

variable "acr_name" {
  default     = "RbaMhAcr"
  description = "the name of ACR."
}


# Cosmos DB variables


variable "azurerm_cosmosdb_name" {
  default     = "rba-mh-cosomos-db"
  description = "Cosmos DB name"
}


# Roles variables

variable "user_assigned_identity" {
  default     = "rba-mh-user"
  description = "name of the user."
}


# Redis variables


variable "redis_cache_name" {
  default     = "rba-mh-cache"
  description = "name of the redis ."
}


variable "redis_firewall_name" {
  default     = "rba_mh_firewall"
  description = "name of the resource group."
}



# pubsub variables


variable "pubsub_name" {
  default     = "rba-mh-webpubsub"
  description = "name of the pubsub."
}

# key vault variables

variable "key_vault_name" {
  default     = "rbamhkeyvault"
  description = "name of the key vault."
}
