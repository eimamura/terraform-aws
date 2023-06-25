# EC2 Key pair
variable "key_name" {
  default = "ec2_public_keypair"
}

resource "tls_private_key" "handson_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "handson_private_key_pem" {
  filename = "${path.module}/${var.key_name}.pem"
  content  = tls_private_key.handson_private_key.private_key_pem
}

resource "aws_key_pair" "handson_keypair" {
  key_name   = var.key_name
  public_key = tls_private_key.handson_private_key.public_key_openssh
}
