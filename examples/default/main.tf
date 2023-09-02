data "azurerm_resource_group" "example" {
  name = var.rg_name
}

module "network" {
  source = "github.com/pdwerryhouse/terraform-azure-network?ref=0.0.1"

  name            = var.name
  env             = var.env
  cidr_block      = var.cidr_block
  rg_name         = data.azurerm_resource_group.example.name
}

module "compute" {
  source = "../.."

  name            = "my_linux_instance"
  rg_name         = data.azurerm_resource_group.example.name
  ssh_key_file    = "/path/to/ssh/public/key"
  subnet_id       = module.network.subnet_id
  username        = "admin"
}
