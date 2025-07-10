module "resource_group" {
  source = "../Module/Azurerm_resource_group"
    azurerm_resource_group_name = "rg-Infra-P"
   azurerm_resource_group_location           = "West Europe"
}

module "vnet" {
    depends_on = [module.resource_group ]
  source = "../Module/Azurerm_vnet"
  resource_group_name = "rg-Infra-P"
  vnet_name            = "vnet-Infra-P"

  address_space        = ["10.0.0.0/16"]
  location            = "West Europe"
  
}

module "subnet" {
  depends_on = [ module.vnet ]
  source = "../Module/Azurem_subnet"
  resource_group_name = "rg-Infra-P"
  
 virtual_network_name  = "vnet-Infra-P"
  
  subnet_name          = "subnet-Infra-P"
  address_prefixes     = ["10.0.1.0/24"]
}

module "vm" {
    depends_on = [ module.subnet,module.nic,module.azurerm_key_vault_secret_name ]
    source = "../Module/Azurerm_vm"
    resource_group_name = "rg-Infra-P"
  
    vm_name              = "vm-Infra-P"
    location             = "West Europe"
    vm_size               = "Standard_B1ms"
    azurerm_key_vault_name = "kv-Infra-kk"
    azurerm_key_vault_secret_name = "vm-Infra-P-username"
    azurerm_key_vault_secret_password = "vm-Infra-P-password"
    nic_name = "nic-Infra-P"
    custom_data_path = "../script/nginx.sh"
}

module "nic" {
    depends_on = [module.subnet, module.public_ip]
    source = "../Module/Azurem_nic"
    resource_group_name = "rg-Infra-P"
    virtual_network_name  = "vnet-Infra-P"
    subnet_name          = "subnet-Infra-P"
    network_interface_name  = "nic-Infra-P"
    location             = "West Europe"
    public_ip_name = "ifravmp"
  
}

module "public_ip" {
    depends_on = [ module.resource_group ]
    source = "../Module/public_ip"
    resource_group_name = "rg-Infra-P"
    public_ip_name      = "ifravmp"
    location            = "West Europe"
    allocation_method   = "Static"
}

module "keyvaultid" {
  depends_on = [ module.resource_group ]
  source = "../Module/Azurem_keyvault"
  azurerm_key_vault_resource_group_name = "rg-Infra-P"
  azurerm_key_vault_name = "kv-Infra-kk"
  azurerm_key_vault_location = "West Europe"
  
}

module "azurerm_key_vault_secret_name" {
  depends_on = [ module.keyvaultid ]
  source = "../Module/secret"
  resource_group_name = "rg-Infra-P"
  azurerm_key_vault_name = "kv-Infra-kk"
  azurerm_key_vault_secret_value_username = "cool"
  azurerm_key_vault_secret_value_password = "P@ssw0rd1234!"
  azurerm_key_vault_secret_name = "vm-Infra-P-username"
  azurerm_key_vault_secret_password = "vm-Infra-P-password"
  
}

module "nsg" {
  depends_on = [ module.subnet ]
  source = "../Module/NSG"
  azurerm_network_security_group_name = "nsg-Infra-P"
  location = "West Europe"
  resource_group_name = "rg-Infra-P"
  virtual_network_name = "vnet-Infra-P"
  subnet_name = "subnet-Infra-P"
}



