data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.sg_ec2.id]
  subnet_id                   = module.vpc.subnet_public_id
  key_name                    = aws_key_pair.ec2_keypair.key_name
  associate_public_ip_address = true
  user_data                   = file("./userdata.sh")
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name = "web-instance"
  }
  depends_on = [local_file.ssh_public_key, local_file.ssh_private_key, tls_private_key.example]
}

resource "aws_eip" "web" {
  instance = aws_instance.web.id
  domain   = "vpc"
}

resource "aws_key_pair" "ec2_keypair" {
  key_name   = "ec2-keypair"
  public_key = file("./ec2-keypair.pub")
  depends_on = [local_file.ssh_public_key, local_file.ssh_private_key, tls_private_key.example]
}
