variable "location" {
  description = "Azure region used by the Project 15 lab."
  type        = string
  default     = "UK South"
}

variable "hub_resource_group_name" {
  description = "Resource group containing shared connectivity resources."
  type        = string
  default     = "rg-connectivity-hub-lab-uks-01"
}

variable "spoke_resource_group_name" {
  description = "Resource group containing application-spoke resources."
  type        = string
  default     = "rg-application-spoke-lab-uks-01"
}

variable "hub_vnet_name" {
  description = "Name of the shared-connectivity hub VNet."
  type        = string
  default     = "vnet-connectivity-hub-uks-01"
}

variable "spoke_vnet_name" {
  description = "Name of the application-spoke VNet."
  type        = string
  default     = "vnet-application-spoke-uks-01"
}

variable "storage_account_name" {
  description = "Globally unique name of the storage account used for private connectivity testing."
  type        = string
  default     = "stsatprivateuks01"
}

variable "common_tags" {
  description = "Governance tags applied to Project 15 resources."
  type        = map(string)

  default = {
    owner       = "Sat"
    environment = "lab"
    workload    = "private-connectivity"
    expiry-date = "2026-09-30"
  }
}
