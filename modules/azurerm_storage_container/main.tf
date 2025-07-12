# resource "azurerm_storage_container" "example" {
#   depends_on = [ azurerm_storage_account.storage ]
#   name                  = var.container_name
#   storage_account_id   = azurerm_storage_account.storage.id
#   container_access_type = "private"
# }


