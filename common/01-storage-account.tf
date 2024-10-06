resource "azurerm_storage_account_network_rules" "network_rules" {
  storage_account_id = data.azurerm_storage_account.hub-sa.id
  default_action     = "Deny"
  ip_rules           = ["199.192.99.26"]
  bypass             = ["Metrics", "Logging", "AzureServices"]
}