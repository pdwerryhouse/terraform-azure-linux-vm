##    terraform-azure-linux-vm
##    Copyright (C) 2022 Paul Dwerryhouse <paul@dwerryhouse.com.au>
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <https://www.gnu.org/licenses/>.


resource "azurerm_public_ip" "ip" {
  name                         = "${var.name}-ip"
  resource_group_name          = var.resource_group.name
  location                     = var.resource_group.location
  allocation_method            = "Dynamic"
}

resource "azurerm_network_security_group" "sg" {
    name                = "${var.name}-sg"
    resource_group_name          = var.resource_group.name
    location                     = var.resource_group.location

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}

resource "azurerm_network_interface" "interface" {
  name                = "${var.name}-interface"
  resource_group_name          = var.resource_group.name
  location                     = var.resource_group.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "int_sg" {
    network_interface_id      = azurerm_network_interface.interface.id
    network_security_group_id = azurerm_network_security_group.sg.id
}

resource "azurerm_linux_virtual_machine" "instance" {
  name                = "${var.name}-instance"
  resource_group_name          = var.resource_group.name
  location                     = var.resource_group.location
  size                = var.instance_size
  admin_username      = var.username
  network_interface_ids = [
    azurerm_network_interface.interface.id,
  ]

  admin_ssh_key {
    username   = var.username
    public_key = file(var.ssh_key_file)
  }

  os_disk {
    caching              = var.disk_caching
    storage_account_type = var.disk_type
    disk_size_gb         = var.disk_size
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}

