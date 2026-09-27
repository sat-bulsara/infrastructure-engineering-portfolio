resource "azurerm_resource_group" "cedar" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.common_tags
}


resource "azurerm_virtual_network" "cedar" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.cedar.name
  location            = azurerm_resource_group.cedar.location
  address_space       = var.vnet_address_space
  tags                = var.common_tags
}

resource "azurerm_subnet" "workload" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.cedar.name
  virtual_network_name = azurerm_virtual_network.cedar.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_network_security_group" "workload" {
  resource_group_name = azurerm_resource_group.cedar.name
  name                = var.nsg_name
  location            = azurerm_resource_group.cedar.location
  tags                = var.common_tags
}

resource "azurerm_subnet_network_security_group_association" "workload" {
  subnet_id                 = azurerm_subnet.workload.id
  network_security_group_id = azurerm_network_security_group.workload.id
}


resource "azurerm_network_interface" "docworker" {
  name                  = var.nic_name
  location              = azurerm_resource_group.cedar.location
  resource_group_name   = azurerm_resource_group.cedar.name
  ip_forwarding_enabled = false
  tags                  = var.common_tags
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.workload.id
    private_ip_address_allocation = "Dynamic"
  }
}