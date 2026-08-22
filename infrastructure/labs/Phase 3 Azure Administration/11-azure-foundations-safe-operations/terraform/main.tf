resource "azurerm_resource_group" "foundations" {
  name     = "rg-az104-foundations-tf-lab-uks-01"
  location = "UK South"

  tags = {
    owner       = "Sat"
    environment = "lab"
    workload    = "az104-foundations-terraform"
    expiry-date = "2026-09-28"
  }
}

resource "azurerm_management_lock" "prevent_delete" {
  name       = "lock-prevent-delete"
  scope      = azurerm_resource_group.foundations.id
  lock_level = "CanNotDelete"
  notes      = "Prevents accidental deletion of the Terraform foundations variation."
}
