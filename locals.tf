locals {
  nic_names = [for i in range(length(var.locations)) : "${var.prefix}-nic-${i}"]

  nsg_rules = [
    {
      name                         = "Allow_HTTP"
      priority                     = 100
      direction                    = "Inbound"
      access                       = "Allow"
      protocol                     = "Tcp"
      source_port_range            = "*"
      destination_port_range       = "80"
      source_address_prefixes      = ["0.0.0.0/0"]
      destination_address_prefixes = ["0.0.0.0/0"]
    },
    {
      name                         = "Allow_HTTPS"
      priority                     = 101
      direction                    = "Inbound"
      access                       = "Allow"
      protocol                     = "Tcp"
      source_port_range            = "*"
      destination_port_range       = "443"
      source_address_prefixes      = ["0.0.0.0/0"]
      destination_address_prefixes = ["0.0.0.0/0"]
    },
    {
      name                         = "Allow_SSH"
      priority                     = 102
      direction                    = "Inbound"
      access                       = "Allow"
      protocol                     = "Tcp"
      source_port_range            = "*"
      destination_port_range       = "22"
      source_address_prefixes      = ["0.0.0.0/0"]
      destination_address_prefixes = ["0.0.0.0/0"]
    }
  ]
}
