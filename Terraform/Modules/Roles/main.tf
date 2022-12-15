data "azurerm_subscription" "student_sub" {}

resource "azurerm_user_assigned_identity" "user_assigned_identity" {
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  name                = var.user_assigned_identity
}

resource "azurerm_role_assignment" "operator" {
  scope                = data.azurerm_subscription.student_sub.id
  role_definition_name = "Blueprint Operator"
  principal_id         = azurerm_user_assigned_identity.user_assigned_identity.principal_id
}

resource "azurerm_role_assignment" "owner" {
  scope                = data.azurerm_subscription.student_sub.id
  role_definition_name = "Owner"
  principal_id         = azurerm_user_assigned_identity.user_assigned_identity.principal_id
}
