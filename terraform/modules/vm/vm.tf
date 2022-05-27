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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5pnysevvB5nNSZooqqPwujSHG/ZYpwfy9zQEVeXjAr/2xwF027cnlD9GI3+szqxFFenQPelsax3wzGrfda/wC/9PCiq6JRvB7bS1TtFUZFp5XW6hVbMYpAnul+UTKuZQuzkxqsAOK6jhz24Boe6VVV2N4evyM8yCh0wp3kfVMh1V2+yQzW6fCONKU7kMDvx45qyBQGvs67LHoK4P77ShAPnXK4PNjttqsKo68BJF4CSOvvD4koiJUJO6DDqu7YRH/iEEIjpKhtELXmsMwb74+XUo1CrB/Cvu2r8m6e3+l8hiumInVeKrZey3vUzpF43oKktso3uabjBNbiNz9XEEB odl_user@cc-2b0aeae1-777bd6b9c9-jmcwd"

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
