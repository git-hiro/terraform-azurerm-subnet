variable "subnet" {
  default = {
    vnet_resource_group_name = ""
    vnet_name                = ""

    name           = ""
    address_prefix = ""
  }
}

variable "nsg" {
  default = {
    required = false

    resource_group_name = ""

    name     = ""
    location = ""
  }
}

variable "nsg_rules" {
  default = []
}
