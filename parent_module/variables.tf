# variable "location" {
#   type = string
# }

variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "virtual_network" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))

}
variable "subnets" {
  type = map(object({
    name                = string
    address_prefix      = list(string)
    resource_group_name = string
    vnet_name           = string
  }))

}

variable "NIC" {
  type = map(object({
    name                = string
    pip_name            = string
    resource_group_name = string
    vnet_name           = string
    sub_name            = string
    location            = string

  }))

}

variable "public_ip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string

  }))

}

variable "virtual_machine" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    publisher           = string
    offer               = string
    sku                 = string
    version_name        = string
    nic_name            = string
  }))

}

variable "sql_server" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    version_number      = string
  }))

}


variable "mssql_database" {
  type = map(object({
    database_name       = string
    server_name         = string
    resource_group_name = string
  }))

}

variable "network_security_group" {
  type = map(object({

    resource_group_name = string
    location            = string
    name                = string
    subnet_name         = string
    vnet_name           = string
  }))
}

variable "storage_account" {
  type = map(object({
    storage_name  = string
    resource_group_name = string
    location = string
    replication_type = string
    account_tier = string
    container_name = string
  }))
}

