
data "azurerm_key_vault" "key_vault_server" {
  name                = "vivekkey1"
  resource_group_name = "vivek_rg1"
}


data "azurerm_key_vault_secret" "serveruser" {
  name         = "serveruser"
  key_vault_id = data.azurerm_key_vault.key_vault_server.id
}


data "azurerm_key_vault_secret" "serverpassword" {
  name         = "serverpassword"
  key_vault_id = data.azurerm_key_vault.key_vault_server.id
}

