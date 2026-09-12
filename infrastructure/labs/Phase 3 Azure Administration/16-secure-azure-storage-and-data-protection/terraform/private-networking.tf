# Read the existing resource group created earlier with Azure CLI.
data "azurerm_resource_group" "northstar" {
  name = "rg-northstar-storage-lab-uks-01"
}

# Read the existing storage account without trying to create another one.
data "azurerm_storage_account" "northstar" {
  name                = "stnorthstardocsuks01"
  resource_group_name = data.azurerm_resource_group.northstar.name
}

# Create the private network used to reach Northstar's storage account.
resource "azurerm_virtual_network" "northstar" {
  name                = "vnet-northstar-storage-uks-01"
  resource_group_name = data.azurerm_resource_group.northstar.name
  location            = data.azurerm_resource_group.northstar.location
  address_space       = var.vnet_address_space
  tags                = data.azurerm_resource_group.northstar.tags
}

# Reserve a dedicated subnet for private endpoints.
resource "azurerm_subnet" "private_endpoints" {
  name                 = "snet-private-endpoints-uks-01"
  resource_group_name  = data.azurerm_resource_group.northstar.name
  virtual_network_name = azurerm_virtual_network.northstar.name
  address_prefixes     = var.private_endpoint_subnet_prefixes
}

# Provide private DNS resolution for Azure Blob Storage endpoints.
resource "azurerm_private_dns_zone" "storage_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = data.azurerm_resource_group.northstar.name
  tags                = data.azurerm_resource_group.northstar.tags
}

# Make the private Blob DNS zone available to clients in the Northstar VNet.
resource "azurerm_private_dns_zone_virtual_network_link" "storage_blob" {
  name                  = "link-northstar-storage-blob"
  resource_group_name   = data.azurerm_resource_group.northstar.name
  private_dns_zone_name = azurerm_private_dns_zone.storage_blob.name
  virtual_network_id    = azurerm_virtual_network.northstar.id
  registration_enabled  = false
  tags                  = data.azurerm_resource_group.northstar.tags
}

# Expose Northstar's Blob service through a private IP in the VNet.
resource "azurerm_private_endpoint" "storage_blob" {
  name                = "pep-northstar-storage-blob-uks-01"
  resource_group_name = data.azurerm_resource_group.northstar.name
  location            = data.azurerm_resource_group.northstar.location
  subnet_id           = azurerm_subnet.private_endpoints.id
  tags                = data.azurerm_resource_group.northstar.tags

  private_service_connection {
    name                           = "psc-northstar-storage-blob"
    private_connection_resource_id = data.azurerm_storage_account.northstar.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "pdzg-northstar-storage-blob"
    private_dns_zone_ids = [azurerm_private_dns_zone.storage_blob.id]
  }
}