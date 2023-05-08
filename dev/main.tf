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
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "hub_vnet" {
  source           = "../common"
  node_count       = 3
  environment      = "dev"
  vsphere_user     = var.vsphere_user
  vsphere_password = var.vsphere_password
  subnets = [
    {
      name   = "bsore-Gateway"
      prefix = "10.0.70.0/24"
    },
    {
      name   = "bsore-FrontEnd"
      prefix = "10.0.80.0/24"
    }
  ]
}