data "azurerm_key_vault" "key_vault" {
  name                = "vivek4"
  resource_group_name = "vivek_rg1"
}


data "azurerm_key_vault_secret" "username" {
  name         = "adminuser"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}


data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}


data "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}
