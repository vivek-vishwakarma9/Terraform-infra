
data "azurerm_subnet" "subnet_data" {
  name                 =  var.sub_name
  virtual_network_name = var.vn_name
  resource_group_name  = var.resource_group_name
}



data "azurerm_public_ip" "pip" {
  count               = var.pip_name != null ? 1 : 0
  name                = var.pip_name != null ? var.pip_name : "dummy"
  resource_group_name = var.resource_group_name
}

