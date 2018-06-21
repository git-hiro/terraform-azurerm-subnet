variable "vnet" {
  default = {
    resource_group_name = ""
    name                = ""
  }
}

variable "nsg" {
  default = {
    resource_group_name = ""
    name                = ""
  }
}

variable "subnet" {
  default = {
    name              = ""
    address_prefix    = ""
    service_endpoints = ""
  }
}
