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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDK+X2YWPphJ4r7+JSBOoik9cUmSat/0+UrIcMR8DI3D37BqE/bCafmZ6i2fKpurQGDV7PdhpFFHY58S9M3/y4da2yrBKFxxXW32rXPaLmwdxfH5Kk8ew3DlUL4aNQYW6ZZKf3bszRLk/z2pifGWBifB+qanj2BrcsqFoPimIpqzc54iG6k8ak14sdh8ejssEnobyqRwxY9OspCd/FGBfPEsuln5ii43l7oVijD61L/aID0saRvU57od8HsNSkca8RFYPI84u2NzN8G+UBy1BCsuL7thKbtshPr3nXdeYZS6L4yGIYKFHfpx+CHmSnAlcqtCkVj3PBwGQMdqyQg++kR odl_user@cc-198878e9-86b8b85c85-4d7p7"

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
