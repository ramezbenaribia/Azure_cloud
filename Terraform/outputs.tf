output "Jenkins_server_address" {
  value = module.Azure_VM.Jenkins_server_address
}

output "aks_connection" {
  value = "az aks get-credentials --resource-group ${azurerm_resource_group.AKS_rg.name} --name ${var.cluster_name}"
}

output "CosmosDB" {
  value     = module.Azure_CosomosDB.CosmosDB
  sensitive = true

}


output "CosmosDB_URI" {
  value     = module.Azure_CosomosDB.CosmosDB_URI
  sensitive = true
}


output "CosmosDB_primary_key" {
  value     = module.Azure_CosomosDB.CosmosDB_primary_key
  sensitive = true
}



output "key-vault-id" {
  description = "Key Vault ID"
  value       = module.Azure_KeyVault.key-vault-id
}

output "key-vault-url" {
  description = "Key Vault URI"
  value       = module.Azure_KeyVault.key-vault-url
}
