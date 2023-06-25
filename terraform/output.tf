output "my-vm-public-ip" {
  value = aws_instance.my_vm_public[*].public_ip
}
output "my-vm-private-ip" {
  value = aws_instance.my_vm_private[*].private_ip
}
