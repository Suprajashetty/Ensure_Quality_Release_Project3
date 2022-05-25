resource "azurerm_network_interface" "test" {
  name                = "udacity_NIC"
  location            = "eastus"
  resource_group_name = "Azuredevops"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "myvm"
  location            = "eastus"
  resource_group_name = "Azuredevops"
  size                = "Standard_B1s"
  admin_username      = "AzureUser"
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = "AzureUser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDC+GDJIACIJ8LfQrlix4roP29pxj48blXcJ9QKGh9g3oS5IDTK+KuQWeNtq82XrXFWAwdi0we94LEdL8CaVRIr2FkaEmjZkT9A73jHzXEqFBjpYGPWAW6+vbIr3OXa5Vhkgo6CPqymrFB37l87rNoWytXTgdWB94ahfj0vjLLixzsayTBtYRY8/8vIwLvPaBgf2C3mxlvgMnO2d6WcwfXNWtLjlGvoSIbOEcEyP6ylkknKNOsQZyFBSdBTE/p0WmUUc9VjtV3xoc+LBAEFFMiop9cquru7TJ095YFM1HGDus/8zWQuLFXCsZGQU/iVK2IaoqeFI3lZMe86D+BAvxj1 odl_user@cc-aed5dc39-8669c9c64-6j27k"

    #file(var.public_key_path)
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
