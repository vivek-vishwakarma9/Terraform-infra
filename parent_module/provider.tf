terraform {
  backend "azurerm" {
    resource_group_name  = "vivek_rg1"
    storage_account_name = "vivekstate"
    container_name       = "tfstatfile"
    key                  = "dev.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
  subscription_id = "a8178814-0624-43ce-a024-8c39ef46979b"
}
