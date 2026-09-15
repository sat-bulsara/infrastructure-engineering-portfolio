# Deployment scope and location.
variable "location" {
  type        = string
  description = "Azure deployment region"
}

variable "resource_group_name" {
  type = string
}

# Virtual network naming and address space.
variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

# Workload subnet naming and address range.
variable "subnet_name" {
  type = string
}

variable "subnet_address_prefixes" {
  type = list(string)
}

# Network security and VM interface names.
variable "nsg_name" {
  type = string
}

variable "nic_name" {
  type = string
}

# Linux virtual machine settings.
variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

# Local path to the public half of the SSH key pair.
variable "ssh_public_key_path" {
  type = string
}

# Separate managed disk used for application data.
variable "data_disk_name" {
  type = string
}

# Shared ownership, environment and lifecycle metadata.
variable "common_tags" {
  type = map(string)
}
