output "subnet" {
  value = "${
    map(
      "name", "${azurerm_subnet.subnet.name}",
      "address_prefix", "${azurerm_subnet.subnet.address_prefix}",
    )
  }"
}

output "nsg" {
  value = "${
    map(
      "name", "${azurerm_network_security_group.nsg.*.name}",
    )
  }"
}

output "nsg_rules" {
  value = "${
    map(
      "name", "${azurerm_network_security_rule.nsg_rules.*.name}",
    )
  }"
}
