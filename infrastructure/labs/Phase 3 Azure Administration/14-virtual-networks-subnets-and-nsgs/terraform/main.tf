# Create a disposable resource group for the Terraform networking variation.
resource "azurerm_resource_group" "networking" {
  name     = "rg-networking-tf-lab-uks-01"
  location = "UK South"

  tags = {
    owner       = "Sat"
    environment = "lab"
    workload    = "networking-terraform"
    expiry-date = "2026-09-29"
  }
}

# Create the private address boundary that contains all three workload tiers.
resource "azurerm_virtual_network" "networking" {
  name                = "vnet-networking-tf-lab-uks-01"
  resource_group_name = azurerm_resource_group.networking.name
  location            = azurerm_resource_group.networking.location
  address_space       = ["10.30.0.0/16"]
}

# Divide the VNet into separate web, application and management subnets.
resource "azurerm_subnet" "web" {
  name                 = "snet-web-tf-uks-01"
  resource_group_name  = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.networking.name
  address_prefixes     = ["10.30.1.0/24"]
}

resource "azurerm_subnet" "app" {
  name                 = "snet-app-tf-uks-01"
  resource_group_name  = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.networking.name
  address_prefixes     = ["10.30.2.0/24"]
}

resource "azurerm_subnet" "management" {
  name                 = "snet-management-tf-uks-01"
  resource_group_name  = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.networking.name
  address_prefixes     = ["10.30.3.0/24"]
}

# Create a dedicated NSG for each subnet security boundary.
resource "azurerm_network_security_group" "web" {
  name                = "nsg-web-tf-uks-01"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name

  tags = azurerm_resource_group.networking.tags
}

resource "azurerm_network_security_group" "app" {
  name                = "nsg-app-tf-uks-01"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name

  tags = azurerm_resource_group.networking.tags
}

resource "azurerm_network_security_group" "management" {
  name                = "nsg-management-tf-uks-01"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name

  tags = azurerm_resource_group.networking.tags
}

# Attach each NSG to its matching subnet so its rules are enforced there.
resource "azurerm_subnet_network_security_group_association" "web" {
  subnet_id                 = azurerm_subnet.web.id
  network_security_group_id = azurerm_network_security_group.web.id
}

resource "azurerm_subnet_network_security_group_association" "app" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app.id
}

resource "azurerm_subnet_network_security_group_association" "management" {
  subnet_id                 = azurerm_subnet.management.id
  network_security_group_id = azurerm_network_security_group.management.id
}

# Permit HTTPS from the Internet while explicitly denying unencrypted HTTP.
resource "azurerm_network_security_rule" "allow_https_web" {
  name                        = "allow-https-web"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.networking.name
  network_security_group_name = azurerm_network_security_group.web.name
}

resource "azurerm_network_security_rule" "deny_http_web" {
  name                        = "deny-http-web"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "10.30.1.0/24"
  resource_group_name         = azurerm_resource_group.networking.name
  network_security_group_name = azurerm_network_security_group.web.name
}

# Permit the required web-to-app flow, then deny other VNet traffic.
resource "azurerm_network_security_rule" "allow_web_to_app" {
  name                        = "allow-web-to-app"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8080"
  source_address_prefix       = "10.30.1.0/24"
  destination_address_prefix  = "10.30.2.0/24"
  resource_group_name         = azurerm_resource_group.networking.name
  network_security_group_name = azurerm_network_security_group.app.name
}

resource "azurerm_network_security_rule" "deny_other_vnet_to_app" {
  name                        = "deny-other-vnet-to-app"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "10.30.2.0/24"
  resource_group_name         = azurerm_resource_group.networking.name
  network_security_group_name = azurerm_network_security_group.app.name
}

# Deny VNet-originated inbound traffic to the isolated management subnet.
resource "azurerm_network_security_rule" "deny_vnet_to_management" {
  name                        = "deny-vnet-to-management"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "10.30.3.0/24"
  resource_group_name         = azurerm_resource_group.networking.name
  network_security_group_name = azurerm_network_security_group.management.name
}
