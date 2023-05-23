locals {
  hubvnet = [
    {
      name   = "GatewaySubnet"
      prefix = "10.0.90.0/24"
    },
    {
      name   = "bsore-FrontEnd"
      prefix = "10.0.80.0/24"
    }
  ]
  subnets = { for subnet in var.subnets : subnet.name => { name : subnet.name, prefix : subnet.prefix } }

}

resource "azurerm_virtual_network" "vnet" {
  name                = "bsore-na26-wy-hub-vnet"
  location            = data.azurerm_resource_group.bsore-west2-hub.location
  resource_group_name = data.azurerm_resource_group.bsore-west2-hub.name
  address_space       = [for subnet in var.subnets : subnet.prefix]
}


resource "azurerm_subnet" "sub" {
  for_each             = local.subnets
  name                 = each.value.name
  address_prefixes     = [each.value.prefix]
  resource_group_name  = data.azurerm_resource_group.bsore-west2-hub.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_public_ip" "ip" {
  name                = "bsore-wy-hub-ip"
  location            = data.azurerm_resource_group.bsore-west2-hub.location
  resource_group_name = data.azurerm_resource_group.bsore-west2-hub.name
  allocation_method   = "Dynamic"
}

resource "azurerm_local_network_gateway" "home" {
  name                = "bsore-wy-hub-lng"
  resource_group_name = data.azurerm_resource_group.bsore-west2-hub.name
  location            = data.azurerm_resource_group.bsore-west2-hub.location
  gateway_address     = "199.192.99.26"
  address_space       = ["10.0.0.0/18"]
}

resource "azurerm_virtual_network_gateway" "s2s" {
  name                = "bsore-wy-hub-vgw"
  location            = data.azurerm_resource_group.bsore-west2-hub.location
  resource_group_name = data.azurerm_resource_group.bsore-west2-hub.name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  active_active       = false
  enable_bgp          = false
  sku                 = "Basic"

  bgp_settings {
    asn = "65515"
  }

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.sub["GatewaySubnet"].id
  }
}

resource "azurerm_virtual_network_gateway_connection" "onprem" {
  name                       = "bsore-wy-hub-vgwconn"
  location                   = data.azurerm_resource_group.bsore-west2-hub.location
  resource_group_name        = data.azurerm_resource_group.bsore-west2-hub.name
  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.s2s.id
  local_network_gateway_id   = azurerm_local_network_gateway.home.id
  shared_key                 = var.shared_key
}