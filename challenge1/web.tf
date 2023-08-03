# Create Azure Load Balancer for web tier
resource "azurerm_lb" "web_lb" {
  name                = "web-lb"
  location            = "eastus"  # Update with your desired region
  resource_group_name = azurerm_resource_group.ch1_rg.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.web_lb_public_ip.id
  }
}

# Create Azure Virtual Machines for web tier
resource "azurerm_virtual_machine" "web_instances" {
  count                 = 2  # Update with the desired number of instances
  name                  = "web-vm-${count.index}"
  location              = "eastus"  # Update with your desired region
  resource_group_name   = azurerm_resource_group.ch1_rg.name
  network_interface_ids = [azurerm_network_interface.web_nic.id]
  vm_size               = "Standard_B1s"  # Update with your desired VM size
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}