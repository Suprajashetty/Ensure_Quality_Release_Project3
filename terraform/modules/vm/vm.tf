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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQxQD83QQsrYoCc45LtgjhysHvQaC60ieE8UXPBtNFxNiujahjoWFl7VkK51kTrpuA5t+yKaUsdFSi+oSUvdEDClZH/M8J7OQ2Me0YptfbnAsPP4GcTEgthDFTI4iIwyBViZFXp7I/F+DZ/8g5o/z4am8EQP1MrumpwP0tzrt0BDISwjV43TLk3qmFTUUi2F2ylTA1SyJLYowFGZlnULD4vhnoEFQnbW0BZ5D32CSNOBM1kh5pA9ZB07l3MI65W7LY1nzQERYo0lIA0Utlkm8mexMw8F4ehYIWLOHslW4bWwW0n1XNMvt9qi4j4v+39ccsnFPZG5nmHw0R6AWaQNBH odl_user@cc-a7d05785-75fdfd5d54-prnn8"

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
