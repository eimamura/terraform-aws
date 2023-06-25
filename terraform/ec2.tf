# Reference: https://kacfg.com/terraform-vpc-ec2/#Terraformtf

# EC2
data "aws_ssm_parameter" "amzn2_latest_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
# data "aws_ssm_parameter" "amzn2023_latest_ami" {
#   name = "/aws/service/ami-amazon-linux-latest/al2023-ami-minimal-kernel-default-x86_64"
# }
# data "aws_ssm_parameter" "ubuntu_ami" {
#   name = "/aws/service/canonical/ubuntu/server/20.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
# }

resource "aws_instance" "my_vm_public" {
  count                       = length(var.public_subnet_cidrs)
  ami                         = data.aws_ssm_parameter.amzn2_latest_ami.value
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.handson_ec2_sg.id]
  subnet_id                   = aws_subnet.public_subnets[count.index].id
  associate_public_ip_address = "true"
  key_name                    = var.key_name
  tags = {
    Name = "my-vm-public-${count.index + 1}"
  }
  user_data = file("userdata.tpl")
}

resource "aws_instance" "my_vm_private" {
  count                  = length(var.private_subnet_cidrs)
  ami                    = data.aws_ssm_parameter.amzn2_latest_ami.value
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  subnet_id              = aws_subnet.private_subnets[count.index].id
  key_name               = var.key_name
  tags = {
    Name = "my-vm-private-${count.index + 1}"
  }
}
