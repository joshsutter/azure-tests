resource "azurerm_lb" "lb" {
  name                = "${var.prefix}-lb"
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location1
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

# Define backend pool and load balancer rules
