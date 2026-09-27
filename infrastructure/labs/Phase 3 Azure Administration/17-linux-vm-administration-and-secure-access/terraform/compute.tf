resource "azurerm_linux_virtual_machine" "docworker" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.cedar.name
  location            = azurerm_resource_group.cedar.location
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.docworker.id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(pathexpand(var.ssh_public_key_path))
  }

  disable_password_authentication = true

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "24.04.202609040"
  }

  custom_data = filebase64("${path.module}/../cloud-init/cedar-docworker.yaml")

  identity {
    type = "SystemAssigned"
  }

  boot_diagnostics {}

  tags = var.common_tags
}

resource "azurerm_managed_disk" "docworker_data" {
  name                          = var.data_disk_name
  location                      = azurerm_resource_group.cedar.location
  resource_group_name           = azurerm_resource_group.cedar.name
  storage_account_type          = "Standard_LRS"
  create_option                 = "Empty"
  disk_size_gb                  = 8
  public_network_access_enabled = false
  network_access_policy         = "DenyAll"
  tags                          = var.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "docworker_data" {
  managed_disk_id    = azurerm_managed_disk.docworker_data.id
  virtual_machine_id = azurerm_linux_virtual_machine.docworker.id
  lun                = 0
  caching            = "ReadWrite"
}