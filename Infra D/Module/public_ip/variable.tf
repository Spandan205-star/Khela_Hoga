variable "public_ip_name" {
  description = "Name of the public IP address"
  type        = string
  
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the public IP address"
  type        = string
  
}
variable "location" {
  description = "The Azure Region where the public IP address should exist"
  type        = string
}
variable "allocation_method" {
  description = "The allocation method for the public IP address"
  type        = string
  default     = "Static"
}