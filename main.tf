resource "azurerm_subnet" "subnet" {
  resource_group_name  = "${var.subnet["vnet_resource_group_name"]}"
  virtual_network_name = "${var.subnet["vnet_name"]}"

  name = "${var.subnet["name"]}"

  address_prefix            = "${var.subnet["address_prefix"]}"
  network_security_group_id = "${azurerm_network_security_group.nsg.id}"
}

resource "azurerm_network_security_group" "nsg" {
  count = "${var.nsg["required"] ? 1 : 0}"

  resource_group_name = "${var.nsg["resource_group_name"]}"

  name     = "${var.nsg["name"]}"
  location = "${var.nsg["location"]}"
}

resource "azurerm_network_security_rule" "nsg_rules" {
  count = "${var.nsg["required"] ? length(var.nsg_rules) : 0}"

  resource_group_name         = "${var.nsg["resource_group_name"]}"
  network_security_group_name = "${azurerm_network_security_group.nsg.name}"

  name     = "${lookup(var.nsg_rules[count.index], "name")}"
  priority = "${lookup(var.nsg_rules[count.index], "priority")}"

  access    = "${lookup(var.nsg_rules[count.index], "access")}"
  direction = "${lookup(var.nsg_rules[count.index], "direction")}"
  protocol  = "${lookup(var.nsg_rules[count.index], "protocol")}"

  source_address_prefix      = "${lookup(var.nsg_rules[count.index], "source_address_prefix")}"
  source_port_range          = "${lookup(var.nsg_rules[count.index], "source_port_range")}"
  destination_address_prefix = "${lookup(var.nsg_rules[count.index], "destination_address_prefix")}"
  destination_port_range     = "${lookup(var.nsg_rules[count.index], "destination_port_range")}"

  depends_on = [
    "azurerm_network_security_group.nsg",
  ]
}
