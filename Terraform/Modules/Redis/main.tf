# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "redis_cache" {
  name                = var.redis_cache_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Standard"
}

resource "azurerm_redis_firewall_rule" "redis_firewall" {
  name                = var.redis_firewall_name
  redis_cache_name    = azurerm_redis_cache.redis_cache.name
  resource_group_name = var.resource_group_name
  start_ip            = "1.2.3.4"
  end_ip              = "2.3.4.5"
}
