
resource "azurerm_web_pubsub" "pubsub" {
  name                = var.pubsub_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  sku      = "Standard_S1"
  capacity = 1

  public_network_access_enabled = false

  live_trace {
    enabled                   = true
    messaging_logs_enabled    = true
    connectivity_logs_enabled = false
  }

  identity {
    type = "SystemAssigned"
  }
}
