terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.69"
    }
  }
}

provider "azurerm" {
  features {}
}