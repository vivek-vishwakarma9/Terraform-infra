resource "azurerm_mssql_server" "sql-server" {
  name                         = var.server-name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.version_number
  administrator_login          = data.azurerm_key_vault_secret.serveruser.value
  administrator_login_password = data.azurerm_key_vault_secret.serverpassword.value
}

