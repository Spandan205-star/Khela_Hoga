variable "azurerm_key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
  
}
variable "azurerm_key_vault_location" {
  description = "The Azure Region where the Key Vault should exist."
  type        = string
}
variable "azurerm_key_vault_resource_group_name" {
  description = "The name of the Resource Group where the Key Vault should exist."
  type        = string
}