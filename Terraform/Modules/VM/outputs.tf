
output "Jenkins_server_address" {
  value = "http://${azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address}:8080/login"
}

