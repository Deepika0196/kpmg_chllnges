# Define Azure provider
provider "azurerm" {
  features {}
}

# Create resource group
resource "azurerm_resource_group" "ch1" {
  name     = "ch1-resource-group"
  location = "East US"  # Update with your desired location
}

# Create Azure Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "ch1-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"  # Update with your desired region
  resource_group_name = azurerm_resource_group.ch1_rg.name
}

# Create Azure Subnet for the app tier
resource "azurerm_subnet" "app_subnet" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.ch1_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes      = ["10.0.1.0/24"]  # Update with your desired subnet CIDR
}