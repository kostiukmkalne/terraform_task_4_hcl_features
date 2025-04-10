resource "azurerm_virtual_machine" "main" {
  depends_on = [azurerm_network_interface.main]
  count      = length(var.locations)

  name                  = "${var.prefix}-vm-${count.index}"
  location              = var.locations[count.index]
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.main[local.nic_names[count.index]].id]
  vm_size = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname${count.index}"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = var.environment
    owner       = "testadmin"
  }
  lifecycle {
    prevent_destroy = true
  }
}