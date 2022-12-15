resource "azurerm_cosmosdb_account" "db" {
  name                = var.azurerm_cosmosdb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  # key_vault_key_id    = azurerm_key_vault_key.generated.versionless_id

  enable_automatic_failover = true
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

}

