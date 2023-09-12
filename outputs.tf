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

output "id" { value = azurerm_linux_virtual_machine.instance.id }
output "public_ip_address" {
  value = var.public_ip_enabled == true ? azurerm_linux_virtual_machine.instance.public_ip_address : null
}
output "private_ip_address" { value = azurerm_linux_virtual_machine.instance.private_ip_address }
output "virtual_machine_id" { value = azurerm_linux_virtual_machine.instance.virtual_machine_id }
