variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  
}
variable "location" {
  description = "The Azure region where the resource group is located."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}
variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_F2"
}

variable "nic_name" {
  description = "The name of the network interface."
  type        = string
}

variable "azurerm_key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
  
}

variable "azurerm_key_vault_secret_name" {
  description = "The name of the Azure Key Vault secret to create."
  type        = string
  
}

variable "azurerm_key_vault_secret_password" {
  description = "The name of the Azure Key Vault secret to create."
  type        = string
  
}

variable "custom_data_path" {
  
}
