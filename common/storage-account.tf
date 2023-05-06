data "azurerm_resource_group" "bsore-west2-hub" {
  name     = "bsore-WY-hub-rgrp"
}

data "azurerm_storage_account" "hub-sa" {
  name     = "bsorewyhubsa"
}

resource "azurerm_storage_account_network_rules" "network_rules" {
  storage_account_id         = data.azurerm_storage_account.hub-sa.id
  default_action             = "Deny"
  ip_rules                   = ["199.192.99.26"]
  virtual_network_subnet_ids = [data.azurerm_subnet.mgmt_subn.id]
  bypass                     = ["Metrics", "Logging", "AzureServices"]
}