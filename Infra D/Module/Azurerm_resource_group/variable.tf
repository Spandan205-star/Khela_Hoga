variable "azurerm_resource_group_name" {
  description = "The name of the resource group."
  type        = string
  
}
variable "azurerm_resource_group_location" {
  description = "The Azure Region where the resource group should exist."
  type        = string
  default     = "West Europe"
}