# Address space selected for Northstar's isolated storage network.
variable "vnet_address_space" {
  description = "Address space assigned to the Northstar storage VNet."
  type        = list(string)
  default     = ["10.70.0.0/16"]
}

# Subnet reserved for private endpoints.
variable "private_endpoint_subnet_prefixes" {
  description = "Address prefixes assigned to the private endpoint subnet."
  type        = list(string)
  default     = ["10.70.1.0/24"]
}
