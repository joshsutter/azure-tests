resource "azurerm_storage_account" "storage" {
  name                     = "${var.prefix}storage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = var.location1
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Set up access controls for the storage account
