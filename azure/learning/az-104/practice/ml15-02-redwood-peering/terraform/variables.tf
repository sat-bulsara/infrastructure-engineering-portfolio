variable "resource_group_name" {
  description = "Name of the Redwood connectivity resource group"
  type        = string
  default     = "rg-redwood-connectivity-uks-01"
}

variable "location" {
  description = "Azure region for the Redwood connectivity resources"
  type        = string
  default     = "UK South"
}

variable "common_tags" {
  description = "Common classification and lifecycle tags"
  type        = map(string)
  default = {
    owner       = "Sat"
    environment = "practice"
    workload    = "private-connectivity"
    expiry-date = "2026-09-19"
  }
}