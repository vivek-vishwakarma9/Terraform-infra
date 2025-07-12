
module "resource_groups" {
  source                 = "../modules/azurerm_resource_group"
  for_each               = var.resource_groups
  azurerm_resource_group = each.value.name
  location               = each.value.location
}


module "virtual_network" {
  depends_on          = [module.resource_groups]
  for_each            = var.virtual_network
  source              = "../modules/azurerm_virtual_network"
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}

module "subnet" {
  depends_on          = [module.virtual_network]
  for_each            = var.subnets
  source              = "../modules/azurerm_subnet"
  sub_name            = each.value.name
  resource_group_name = each.value.resource_group_name
  vnet_name           = each.value.vnet_name
  address_prefix      = each.value.address_prefix

}


module "NIC" {
  depends_on          = [module.subnet]
  for_each            = var.NIC
  source              = "../modules/azurerm_nic"
  nic_name            = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  vn_name             = each.value.vnet_name
  sub_name            = each.value.sub_name
  pip_name            = each.value.pip_name

}



module "Public_ip" {
  depends_on          = [module.resource_groups]
  source              = "../modules/azurerm_public_IP"
  for_each            = var.public_ip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

}



module "virtual_machine" {
  depends_on          = [module.resource_groups, module.NIC]
  for_each            = var.virtual_machine
  source              = "../modules/azurerm_virtual_machine"
  vm_name             = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  publisher           = each.value.publisher
  offer               = each.value.offer
  sku                 = each.value.sku
  version_name        = each.value.version_name
  nic_name            = each.value.nic_name
}


module "sql_server" {
  depends_on          = [module.resource_groups]
  for_each            = var.sql_server
  source              = "../modules/azurerm_sql_server"
  server-name         = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  version_number      = each.value.version_number
}


module "mssql_database" {
  depends_on        = [module.sql_server]
  for_each          = var.mssql_database
  source            = "../modules/azurerm_mssq_database"
  sql_database_name = each.value.database_name
  sql_server_name     = each.value.server_name
  resource_group_name = each.value.resource_group_name
}


module "network_security_grop" {
  depends_on          = [module.subnet, module.resource_groups]
  for_each            = var.network_security_group
  source              = "../modules/azurerm_NSG"
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  nsg_name            = each.value.name
  sub_name = each.value.subnet_name
  vn_name  = each.value.vnet_name
}


module "storage_account" {
  depends_on = [ module.resource_groups ]
  for_each            = var.storage_account
  source              = "../modules/azurerm_storage_account"
  storage_name        = each.value.storage_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  replication_type    = each.value.replication_type
  account_tier        = each.value.account_tier
  container_name = each.value.container_name

}


