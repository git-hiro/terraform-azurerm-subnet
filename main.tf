data "azurerm_network_security_group" "nsg" {
  count = "${var.nsg["required"] ? 1 : 0}"

  resource_group_name = "${var.nsg["resource_group_name"]}"
  name                = "${var.nsg["name"]}"
}

resource "azurerm_subnet" "subnet" {
  resource_group_name  = "${var.vnet["resource_group_name"]}"
  virtual_network_name = "${var.vnet["name"]}"

  name           = "${var.subnet["name"]}"
  address_prefix = "${var.subnet["address_prefix"]}"

  service_endpoints         = ["${compact(split(",", var.subnet["service_endpoints"]))}"]
  network_security_group_id = "${join("", data.azurerm_network_security_group.nsg.*.id)}"
}
