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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf6GlXttxn6GQthm3uOL4Z9UNFFTJTGXIKSfHvVVZx/OH4ZEVoYOOfvc1uTFDp4vMRFYl8FGvaN2hLUk0wbHDWI+Z8640OoKm2yfbavR9uF1K0Dgn/UhdrBS8qR0uQJptnBJfm/05IKpIMRvJBveDWgvqd9wlMr1RrxPsg6bQaJL+Qy+NKalfOLlCgxLP6npFt58h+URQnMVPRl3eO87HDRmREDsZEVM0H4GFDYJV3Z9j9pVWMaFlBPlAxC9JDFIpXybrWIGETJXe4yJr1gXVNZ5JcHzQpsZb9GhYXu2DhTN0HBxsah/z/naq7GJ16frPp4gY3YEFjLVVUPLvh7wgX odl_user@cc-ba677cc2-86464c7797-9tpvc"

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
