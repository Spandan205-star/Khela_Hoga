variable "network_interface_name" {}
variable "location" {}
variable "resource_group_name" {}
  

variable "virtual_network_name" {
  
}
variable "subnet_name" {
  description = "The name of the subnet within the virtual network."
}
variable "public_ip_name" {
  description = "The name of the public IP address to associate with the network interface."
}