resource "azurerm_subnet" "sub_net" {
  name                 = var.sub_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefix
}



