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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1Xhay0WaKNNzYJ0reGo5fBxp5bwHIQkknfUSg1852WFCqE+ERbdaGFw3odG8WDflMk77pxIqrrocmF/hklTp6TxAJGqKjrDUe0DMcw3gF5e1aCVa2sjoxKtWAsK9ZWyFUB4Z1bKtt04ljUbFoFnY0sey8rnYph+ElmdHOSBA64n6mvl4FfFAQFgPzCKq4Y9Xs1c6Pn9QWS75snxob14bDnHXYP//Wj+x+A+/Op0gNksz2Em4dIjFIst3uyFB+AflCXSritOMJ3EJtUW7fFVKGuwbKRMm9BZgb3Z+7umUYxNNTpJ++f0rW6J6egyg7PJQ1Hibve9bbNxIrv7Cpr0ax odl_user@cc-39e98893-686bfb787-jj4mv"

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
