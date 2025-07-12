
resource_groups = {
  rg1 = {
    name     = "vivek_rg1"
    location = "East US"
  }
}

virtual_network = {
  vnet = {
    name                = "vnet1"
    location            = "east us"
    resource_group_name = "vivek_rg1"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  frontend = {
    name                = "frontend_subnet"
    address_prefix      = ["10.0.1.0/24"]
    resource_group_name = "vivek_rg1"
    vnet_name           = "vnet1"
  }
  backend = {
    name                = "backend_subnet"
    address_prefix      = ["10.0.2.0/24"]
    resource_group_name = "vivek_rg1"
    vnet_name           = "vnet1"
  }
}

NIC = {
  frontend = {
    name                = "frontend_nic"
    pip_name            = "frontend_pip"
    resource_group_name = "vivek_rg1"
    vnet_name           = "vnet1"
    sub_name            = "frontend_subnet"
    location            = "east us"
  }
  backend = {
    name = "backend_nic"
    pip_name = null
    resource_group_name = "vivek_rg1"
    vnet_name           = "vnet1"
    sub_name            = "backend_subnet"
    location            = "east us"
  }
}

public_ip = {
  frontend_pip = {
    name                = "frontend_pip"
    resource_group_name = "vivek_rg1"
    location            = "east us"
  }
}

virtual_machine = {
  frontend = {
    name                = "frontend-vm"
    resource_group_name = "vivek_rg1"
    location            = "east us"
    size                = "Standard_D2s_v3"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-focal"
    sku                 = "20_04-lts"
    version_name        = "latest"
    nic_name            = "frontend_nic"
  }

  backend = {
    name                = "backend-vm"
    resource_group_name = "vivek_rg1"
    location            = "east us"
    size                = "Standard_D2s_v3"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-focal"
    sku                 = "20_04-lts"
    version_name        = "latest"
    nic_name            = "backend_nic"
  }
}

sql_server = {
  sql_server = {
    name                = "vivek-server"
    resource_group_name = "vivek_rg1"
    location            = "central us"
    version_number      = "12.0"
  }
}

mssql_database = {
  mssql_db = {
    database_name       = "vivek-db"
    server_name         = "vivek-server"
    resource_group_name = "vivek_rg1"
    subnet_name         = "backend_subnet"
  }
}

network_security_group = {
  nsg = {
    resource_group_name = "vivek_rg1"
    location            = "east us"
    name                = "network_security"
    vnet_name           = "vnet1"
    subnet_name         = "frontend_subnet"
  }
}

storage_account = {
  storage_account = {
    storage_name = "vivekstate"
    resource_group_name = "vivek_rg1"
    location = "east us"
    replication_type = "LRS"
    account_tier = "Standard"
    container_name = "tfstatfile"
  }
}

