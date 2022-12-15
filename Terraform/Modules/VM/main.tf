

# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = var.resource_group_name
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "my_storage_account" {
  name                     = "diag${random_id.random_id.hex}"
  location                 = var.resource_group_location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = var.virtual_machine_name
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.ANI_my_terraform_nic_id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
  }
}



resource "local_file" "private_key" {
  filename        = "private_key.pem"
  content         = tls_private_key.example_ssh.private_key_pem
  file_permission = "0400"
}


resource "null_resource" "configure_jenkins_server" {
  triggers = {
    trigger = azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address
  }

  provisioner "local-exec" {
    working_dir = "/home/ramez/Desktop/Project_Cloud/Ansible"
    command     = "ansible-playbook --inventory ${azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address},  --private-key ${var.ssh_key_file} --user azureuser  Jenkins.yaml "
  }

}

