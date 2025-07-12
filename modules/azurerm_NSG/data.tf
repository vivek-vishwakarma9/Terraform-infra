data "azurerm_subnet" "subnet_data" {
  name                 = var.sub_name
  virtual_network_name = var.vn_name
  resource_group_name  = var.resource_group_name
}
