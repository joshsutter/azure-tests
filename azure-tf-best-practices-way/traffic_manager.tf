resource "azurerm_traffic_manager_profile" "tm" {
  name             = "${var.prefix}-tm"
  resource_group_name = azurerm_resource_group.example.name
  traffic_routing_method = "Performance"

  monitor_config {
    protocol = "http"
    port     = 80
    path     = "/"
  }

  dns_config {
    relative_name = "example"
    ttl           = 60
  }

  # Define endpoints
}
