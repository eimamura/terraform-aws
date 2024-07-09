resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "ssh_public_key" {
  content  = tls_private_key.example.public_key_openssh
  filename = "./ec2-keypair.pub"
}

resource "local_file" "ssh_private_key" {
  content  = tls_private_key.example.private_key_pem
  filename = "./ec2-keypair.pem"
}
