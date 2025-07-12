resource "azurerm_storage_account" "storage" {
  name                     = var.storage_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_replication_type = var.replication_type
  account_tier             = var.account_tier

}



resource "azurerm_storage_container" "example" {
  depends_on = [ azurerm_storage_account.storage ]
  name                  = var.container_name
  storage_account_id   = azurerm_storage_account.storage.id
  container_access_type = "private"
}


