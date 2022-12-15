
output "CosmosDB" {
  value     = azurerm_cosmosdb_account.db
  sensitive = true
}


output "CosmosDB_URI" {
  value = azurerm_cosmosdb_account.db.endpoint
  # sensitive = true
}


output "CosmosDB_primary_key" {
  value = azurerm_cosmosdb_account.db.primary_key
  # sensitive = true
}

