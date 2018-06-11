output "subnet" {
  value = "${
    map(
      "name", "${azurerm_subnet.vnet_subnets.name}",
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
