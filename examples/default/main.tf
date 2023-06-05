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

  disk_size       = var.compute_disk_size
  instance_size   = var.compute_instance_size
  name            = var.name
  rg_name         = data.azurerm_resource_group.example.name
  ssh_key_file    = var.ssh_key_file
  subnet_id       = module.network.subnet_id
  username        = var.compute_username
  #image_sku       = ""
}
