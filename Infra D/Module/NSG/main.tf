resource "azurerm_network_security_group" "nsg7" {
  name                = var.azurerm_network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "test1234"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = data.azurerm_subnet.subid.id
  network_security_group_id = azurerm_network_security_group.nsg7.id
}

data "azurerm_subnet" "subid" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}