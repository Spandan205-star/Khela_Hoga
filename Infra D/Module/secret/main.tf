resource "azurerm_key_vault_secret" "secretu" {
  name         = var.azurerm_key_vault_secret_name
  value        = var.azurerm_key_vault_secret_value_username
  key_vault_id = data.azurerm_key_vault.keyvaultid.id
}

resource "azurerm_key_vault_secret" "secretp" {
  name         = var.azurerm_key_vault_secret_password
  value        = var.azurerm_key_vault_secret_value_password
  key_vault_id = data.azurerm_key_vault.keyvaultid.id
}


data "azurerm_key_vault" "keyvaultid" {
  name                = var.azurerm_key_vault_name
  resource_group_name = var.resource_group_name
}