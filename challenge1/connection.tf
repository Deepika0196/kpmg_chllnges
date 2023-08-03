# Create Azure Virtual Network Rule to allow access from app tier
resource "azurerm_sql_virtual_network_rule" "app_network_rule" {
  name                = "app-network-rule"
  server_name         = azurerm_sql_server.database_server.name
  resource_group_name = azurerm_resource_group.ch1_rg.name
  subnet_id           = azurerm_subnet.app_subnet.id
}

# Connect the web tier to the application tier
resource "azurerm_lb_backend_address_pool" "web_backend_pool" {
  name                = "web-backend-pool"
  loadbalancer_id     = azurerm_lb.web_lb.id
  resource_group_name = azurerm_resource_group.ch1_rg.name

  backend_addresses {
    ip_address = azurerm_virtual_machine.web_instances.*.private_ip_address
  }
}

# Connect the application tier to the database tier
resource "azurerm_virtual_machine_extension" "app_db_extension" {
  name                 = "app-db-extension"
  virtual_machine_id   = azurerm_virtual_machine.app_instances[0].id
  resource_group_name  = azurerm_resource_group.ch1_rg.name
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
        "commandToExecute": "sudo apt-get update && sudo apt-get install -y mysql-client"
    }
  SETTINGS
}

# Configure database connection string in the application tier
resource "azurerm_virtual_machine_extension" "app_db_connection" {
  name                 = "app-db-connection"
  virtual_machine_id   = azurerm_virtual_machine.app_instances[0].id
  resource_group_name  = azurerm_resource_group.ch1_rg.name
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
        "commandToExecute": "echo 'export DB_CONNECTION_STRING=<YOUR_DATABASE_CONNECTION_STRING>' >> /etc/environment"
    }
  SETTINGS
}