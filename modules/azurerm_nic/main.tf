resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_data.id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id = data.azurerm_public_ip.pip.id
    public_ip_address_id = var.pip_name != null ? data.azurerm_public_ip.pip[0].id : null
  }
}


