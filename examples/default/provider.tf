terraform {
  required_providers {
    azurerm = {
      source = "azurerm"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

