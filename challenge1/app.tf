# Create Azure Virtual Machines for app tier
resource "azurerm_virtual_machine" "app_instances" {
  count                 = 2  # Update with the desired number of instances
  name                  = "app-vm-${count.index}"
  location              = "eastus"  # Update with your desired region
  resource_group_name   = azurerm_resource_group.ch1_rg.name
  network_interface_ids = [azurerm_network_interface.app_nic.id]
  vm_size               = "Standard_B2s"  # Update with your desired VM size
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}