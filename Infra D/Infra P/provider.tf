terraform {
  required_version = ">= 1.4.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "2266ad84-1142-42c3-ba58-b1ebdb118aaf"
}



