resource "azurerm_resource_group" "redwood" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.common_tags
}

resource "azurerm_virtual_network" "application" {
  name                = "vnet-redwood-app-uks-01"
  resource_group_name = azurerm_resource_group.redwood.name
  location            = azurerm_resource_group.redwood.location
  address_space       = ["10.81.0.0/16"]
  tags                = var.common_tags
}

resource "azurerm_virtual_network" "security" {
  name                = "vnet-redwood-security-uks-01"
  resource_group_name = azurerm_resource_group.redwood.name
  location            = azurerm_resource_group.redwood.location
  address_space       = ["10.82.0.0/16"]
  tags                = var.common_tags
}

# Application subnet inside the Redwood application VNet.
resource "azurerm_subnet" "application" {
  name                 = "snet-redwood-app-uks-01"
  resource_group_name  = azurerm_resource_group.redwood.name
  virtual_network_name = azurerm_virtual_network.application.name
  address_prefixes     = ["10.81.1.0/24"]
}

resource "azurerm_subnet" "security_tools" {
  name                 = "snet-redwood-tools-uks-01"
  resource_group_name  = azurerm_resource_group.redwood.name
  virtual_network_name = azurerm_virtual_network.security.name
  address_prefixes     = ["10.82.1.0/24"]
}

# Connect the application VNet to the security VNet.
resource "azurerm_virtual_network_peering" "application_to_security" {
  name                         = "peer-application-to-security"
  resource_group_name          = azurerm_resource_group.redwood.name
  virtual_network_name         = azurerm_virtual_network.application.name
  remote_virtual_network_id    = azurerm_virtual_network.security.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# Connect the security VNet back to the application VNet.
resource "azurerm_virtual_network_peering" "security_to_application" {
  name                         = "peer-security-to-application"
  resource_group_name          = azurerm_resource_group.redwood.name
  virtual_network_name         = azurerm_virtual_network.security.name
  remote_virtual_network_id    = azurerm_virtual_network.application.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}
