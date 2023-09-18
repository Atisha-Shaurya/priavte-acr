terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

# Create azure resource group
resource "azurerm_resource_group" "acr_resource_group" {
  name     = var.azure_resource_group
  location = var.location
  tags     = var.tags
}

# Create azure container registry
resource "azurerm_container_registry" "acr" {
  name                          = var.acr_name
  location                      = var.location
  resource_group_name           = azurerm_resource_group.acr_resource_group.name
  admin_enabled                 = true
  sku                           = var.acr_sku
  public_network_access_enabled = true
  tags                          = var.tags 
}
