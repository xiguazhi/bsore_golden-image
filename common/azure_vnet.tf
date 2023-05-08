locals {
  subnets = [for subnet in tomap(var.subnets) : {
    name   = subnet.name
    prefix = subnet.prefix
  }]

}

resource "azurerm_virtual_network" "vnet" {
  name                = "bsore-na26-wy-hub-vnet"
  location            = azurerm_resource_group.bsore-west2-hub.location
  resource_group_name = azurerm_resoure_group.bsore-west2-hub.name
  address_space       = [for subnet in var.subnets : subnet.prefix]
}


resource "azurerm_subnet" "sub" {
  for_each             = local.subnets
  name                 = each.value.name
  address_prefixes     = [each.value.prefix]
  resource_group_name  = azurerm_resource_group.bsore-west2-hub.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_public_ip" "ip" {
    name = "bsore-wy-hub-ip"
    location = azurerm_resource_group.bsore-west2-hub.location
    resource_group_name = azurerm_resource_group.bsore-west2-hub.name
    allocation_method = "Dynamic"
}

resource "azurerm_local_networK_gateway" "home" {
  name = "bsore-wy-hub-lng"
  resource_group_name = azurerm_resource_group.bsore-west2-hub.name
  location = azurerm_resource_group.bsore-west2-hub.location
  gateway_address = "199.192.99.26"
  address_space = ["10.0.0.0/18"]
}

resource "azurerm_virtual_network_gateway" "s2s" {
  name = "bsore-wy-hub-vgw"
  location = azurerm_resource_group.bsore-west2-hub.location
  resource_group_name = azurerm_resource_group.bsore-west2-hub.name
  type = "Vpn"
  vpn_type = "RouteBased"
  active_active = false
  enable_bgp = true
  sku = "Basic"
  
  bgp_settings {
    asn = "65515"
  }
  
  ip_configuration {
    name = "vnetGatewayConfig"
    public_ip_address_id = azurerm_public_ip.ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.sub["bsore-Gateway"].id
  }
}