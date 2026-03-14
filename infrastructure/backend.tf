terraform {
  backend "azurerm" {
    resource_group_name  = "rg-ricvera-dev-eastus-01"
    storage_account_name = "tfstatericveradev02"
    container_name       = "tfstate-ricvera-dev"
    key                  = "dev-infrastructure.tfstate"
  }
}