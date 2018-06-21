output "subnet" {
  value = "${
    map(
      "name", "${azurerm_subnet.subnet.name}",
      "address_prefix", "${azurerm_subnet.subnet.address_prefix}",
    )
  }"
}
