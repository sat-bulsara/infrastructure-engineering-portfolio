# Existing hub resource group that Terraform will adopt.
resource "azurerm_resource_group" "hub" {
  name     = var.hub_resource_group_name
  location = var.location
  tags     = var.common_tags
}

# Existing application-spoke resource group that Terraform will adopt.
resource "azurerm_resource_group" "spoke" {
  name     = var.spoke_resource_group_name
  location = var.location
  tags     = var.common_tags
}

# Existing hub VNet that Terraform will adopt.
resource "azurerm_virtual_network" "hub" {
  name                = var.hub_vnet_name
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
  address_space       = ["10.40.0.0/16"]
  tags                = var.common_tags
}

# Existing private-endpoint subnet that Terraform will adopt.
resource "azurerm_subnet" "private_endpoints" {
  name                 = "snet-private-endpoints-uks-01"
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.40.1.0/24"]
}

# New vnet administered in Terraform.
resource "azurerm_virtual_network" "spoke" {
  name                = var.spoke_vnet_name
  resource_group_name = azurerm_resource_group.spoke.name
  location            = azurerm_resource_group.spoke.location
  address_space       = ["10.50.0.0/16"]
  tags                = var.common_tags
}

# Application subnet in the spoke VNet for private application workloads.
resource "azurerm_subnet" "application" {
  name                 = "snet-application-uks-01"
  resource_group_name  = azurerm_resource_group.spoke.name
  virtual_network_name = azurerm_virtual_network.spoke.name
  address_prefixes     = ["10.50.1.0/24"]
}

# Connect the hub VNet to the application spoke VNet.
resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = "peer-hub-to-spoke"
  resource_group_name       = azurerm_resource_group.hub.name
  virtual_network_name      = azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.spoke.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# Connect the application spoke VNet back to the hub VNet.
resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = "peer-spoke-to-hub"
  resource_group_name       = azurerm_resource_group.spoke.name
  virtual_network_name      = azurerm_virtual_network.spoke.name
  remote_virtual_network_id = azurerm_virtual_network.hub.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# Storage service used to test private endpoint connectivity from the hub and spoke VNets.
# The final configuration disables public network access after private connectivity is verified.
resource "azurerm_storage_account" "private" {
  name                            = var.storage_account_name
  resource_group_name             = azurerm_resource_group.hub.name
  location                        = azurerm_resource_group.hub.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  account_kind                    = "StorageV2"
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = false
  tags                            = var.common_tags
}

# Private endpoint that gives the storage blob service a private IP in the hub VNet.
resource "azurerm_private_endpoint" "storage_blob" {
  name                = "pep-storage-blob-uks-01"
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
  subnet_id           = azurerm_subnet.private_endpoints.id
  tags                = var.common_tags

  private_service_connection {
    name                           = "psc-storage-blob-uks-01"
    private_connection_resource_id = azurerm_storage_account.private.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  # Register the endpoint's private IP in the Blob Storage private DNS zone.
  private_dns_zone_group {
    name                 = "pdzg-storage-blob"
    private_dns_zone_ids = [azurerm_private_dns_zone.storage_blob.id]
  }
}

# Private DNS zone that maps Azure Blob Storage names to private endpoint addresses.
resource "azurerm_private_dns_zone" "storage_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.hub.name
  tags                = var.common_tags
}

# Allow resources in the hub VNet to resolve records in the private DNS zone.
resource "azurerm_private_dns_zone_virtual_network_link" "storage_blob_hub" {
  name                  = "link-storage-blob-hub"
  resource_group_name   = azurerm_resource_group.hub.name
  private_dns_zone_name = azurerm_private_dns_zone.storage_blob.name
  virtual_network_id    = azurerm_virtual_network.hub.id
  registration_enabled  = false
  tags                  = var.common_tags
}

# Allow resources in the peered application spoke to use the same private DNS zone.
resource "azurerm_private_dns_zone_virtual_network_link" "storage_blob_spoke" {
  name                  = "link-storage-blob-spoke"
  resource_group_name   = azurerm_resource_group.hub.name
  private_dns_zone_name = azurerm_private_dns_zone.storage_blob.name
  virtual_network_id    = azurerm_virtual_network.spoke.id
  registration_enabled  = false
  tags                  = var.common_tags
}
