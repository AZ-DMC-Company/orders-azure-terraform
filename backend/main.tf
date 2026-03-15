terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  workload = "orders"
  env      = "dev"
  region   = "westus2"
}

resource "azurerm_resource_group" "rg_tf_state" {
  name     = "${local.workload}-rg-tfstate-${local.env}-${local.region}-01"
  location = "westus2"
}

resource "azurerm_storage_account" "tf_state" {
  name                     = "orderssttfdev01"
  resource_group_name      = azurerm_resource_group.rg_tf_state.name
  location                 = azurerm_resource_group.rg_tf_state.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tf_state" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tf_state.name
  container_access_type = "private"
}