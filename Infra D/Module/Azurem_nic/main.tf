resource "azurerm_network_interface" "nic7" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subid.id
    public_ip_address_id = data.azurerm_public_ip.publicid.id
    private_ip_address_allocation = "Dynamic"
  }
}
data "azurerm_subnet" "subid" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "publicid" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
}