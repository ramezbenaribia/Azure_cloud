# Used to group resources
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "VM_network" {
  source                  = "./Modules/Network"
  resource_group_location = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  virtual_network_name    = var.virtual_network_name
  subnet_name             = var.subnet_name
  public_ip_name          = var.public_ip_name
  security_group_name     = var.security_group_name
  network_interface_name  = var.network_interface_name
}


module "Azure_VM" {
  source                  = "./Modules/VM"
  resource_group_location = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  ANI_my_terraform_nic_id = module.VM_network.ANI_my_terraform_nic_id
  virtual_machine_name    = var.virtual_machine_name
  ssh_key_file            = var.ssh_key_file
}




resource "azurerm_resource_group" "AKS_rg" {
  name     = var.resource_group_name_for_AKS
  location = var.resource_group_location_for_AKS
}



module "Azure_AKS" {
  source              = "./Modules/AKS"
  resource_group_name = azurerm_resource_group.AKS_rg.name
  location            = azurerm_resource_group.AKS_rg.location
  cluster_name        = var.cluster_name
  system_node_count   = var.system_node_count
}

module "Azure_ACR" {
  source              = "./Modules/ACR"
  resource_group_name = azurerm_resource_group.AKS_rg.name
  location            = azurerm_resource_group.AKS_rg.location
  acr_name            = var.acr_name
  aks_cluster_id      = module.Azure_AKS.aks_cluster_id
}




module "Azure_Roles" {
  source                  = "./Modules/Roles"
  resource_group_name     = azurerm_resource_group.AKS_rg.name
  resource_group_location = azurerm_resource_group.AKS_rg.location
  user_assigned_identity  = var.user_assigned_identity
}




module "Azure_PubSub" {
  source                  = "./Modules/PubSub"
  resource_group_name     = azurerm_resource_group.AKS_rg.name
  resource_group_location = azurerm_resource_group.AKS_rg.location
  pubsub_name             = var.pubsub_name
}



module "Azure_KeyVault" {
  source                  = "./Modules/KeyVault"
  resource_group_name     = azurerm_resource_group.AKS_rg.name
  resource_group_location = azurerm_resource_group.AKS_rg.location
  key_vault_name          = var.key_vault_name
}


module "Azure_CosomosDB" {
  source                = "./Modules/CosmosDB"
  resource_group_name   = azurerm_resource_group.AKS_rg.name
  location              = azurerm_resource_group.AKS_rg.location
  azurerm_cosmosdb_name = var.azurerm_cosmosdb_name
}
module "Azure_Redis" {
  source                  = "./Modules/Redis"
  resource_group_name     = azurerm_resource_group.AKS_rg.name
  resource_group_location = azurerm_resource_group.AKS_rg.location
  redis_cache_name        = var.redis_cache_name
  redis_firewall_name     = var.redis_firewall_name
}

