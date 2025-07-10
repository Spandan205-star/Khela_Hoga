resource "azurerm_linux_virtual_machine" "vm7" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  
  location            = var.location
  size                = var.vm_size
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password = data.azurerm_key_vault_secret.password.value
  network_interface_ids = [data.azurerm_network_interface.nicid.id]
  disable_password_authentication = "false"
  



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  custom_data = base64encode(var.custom_data_path)
}

data "azurerm_network_interface" "nicid" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}


data "azurerm_key_vault" "keyvaultid" {
  name                = var.azurerm_key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  name         = var.azurerm_key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.keyvaultid.id
}

data "azurerm_key_vault_secret" "password" {
  name         = var.azurerm_key_vault_secret_password
  key_vault_id = data.azurerm_key_vault.keyvaultid.id
}