# terraform-azure-linux-vm

Module to create an Linux Virtual Machine in Azure.


## Example

```
module "public_compute" {
  source = "github.com/pdwerryhouse/terraform-azure-linux-vm?ref=0.0.6"

  name = "my_linux_instance"

  resource_group = {
    name     = data.azurerm_resource_group.example.name
    location = data.azurerm_resource_group.example.location
  }

  ssh_key_file = "/path/to/ssh/public/key"
  subnet_id    = data.azurerm_subnet.example.id
  username     = "admin"
}
```
