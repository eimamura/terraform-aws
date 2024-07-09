# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

# resource "aws_network_interface" "web" {
#   subnet_id = module.vpc.subnet_public_id
#   #   private_ips = ["172.16.10.100"]

#   tags = {
#     Name = "primary_network_interface"
#   }
# }

# resource "aws_instance" "web" {
#   ami                         = data.aws_ami.ubuntu.id
#   instance_type               = "t2.micro"
#   vpc_security_group_ids      = [aws_security_group.sg_ec2.id]
#   subnet_id                   = module.vpc.subnet_public_id
#   key_name                    = aws_key_pair.example.id
#   associate_public_ip_address = true
#   user_data                   = file("./userdata.sh")

#   tags = {
#     Name = "web-instance"
#   }
# }

# resource "aws_eip" "web" {
#   instance = aws_instance.web.id
# }

# resource "aws_key_pair" "example" {
#   key_name   = "ec2-keypair"
#   public_key = file("./example.pub") # gen key by ssh-keygen
# }
