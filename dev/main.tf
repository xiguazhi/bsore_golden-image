terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~>2.4.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.55"
    }

  }
  backend "azurerm" {
    resource_group_name  = "bsore-wy-hub-rgrp"
    storage_account_name = "bsorewyhubsa"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

module "hub_vnet" {
  source = "../common"

}