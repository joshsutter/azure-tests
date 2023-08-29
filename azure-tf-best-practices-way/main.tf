provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

module "region1" {
  source = "./region1"
}

module "region2" {
  source = "./region2"
}
