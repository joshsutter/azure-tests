resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location1
  resource_group_name = azurerm_resource_group.example.name
}

# Define subnets, NSGs, etc.

resource "azurerm_network_interface" "nic" {
  # Define NIC configuration
}
