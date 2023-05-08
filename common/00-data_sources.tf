data "azurerm_resource_group" "bsore-west2-hub" {
  name = "bsore-WY-hub-rgrp"
}

data "azurerm_storage_account" "hub-sa" {
  name                = "bsorewyhubsa"
  resource_group_name = data.azurerm_resource_group.bsore-west2-hub.name
}