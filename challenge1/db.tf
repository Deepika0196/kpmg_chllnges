# Create Azure SQL Database for the data layer
resource "azurerm_sql_server" "database_server" {
  name                         = "database-server"
  resource_group_name          = azurerm_resource_group.ch1.name
  location                     = azurerm_resource_group.ch1.location
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = "password123"
}

resource "azurerm_sql_database" "database" {
  name                         = "ch1-db"
  resource_group_name          = azurerm_resource_group.ch1.name
  location                     = azurerm_resource_group.ch1.location
  server_name                  = azurerm_sql_server.database_server.name
  edition                      = "Basic"
  requested_service_objective_name = "Basic"
  collation                    = "SQL_Latin1_General_CP1_CI_AS"
}