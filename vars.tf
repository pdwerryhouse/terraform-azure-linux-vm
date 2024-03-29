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

variable "disk_caching" { default = "ReadWrite" }
variable "disk_type" { default = "Standard_LRS" }
variable "disk_size" { default = "20" }
variable "instance_size" { default = "Standard_F2" }
variable "name" {}
variable "ssh_key_file" {}
variable "subnet_id" {}
variable "username" {}
variable "image_publisher" { default = "Canonical" }
variable "image_offer" { default = "UbuntuServer" }
variable "image_sku" { default = "18.04-LTS" }
variable "image_version" { default = "latest" }

variable "public_ip_enabled" {
  description = "Set to false to disable a public IP address"
  type        = bool
  default     = true
}

variable "resource_group" {
  type = map(string)
}
