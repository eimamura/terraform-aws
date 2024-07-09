#   ports: 22 (SSH), 80 (HTTP), 443 (HTTPS)
#   protocols: icmp, udp, tcp or -1 (all)

resource "aws_security_group" "sg_ec2" {
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "sg-ec2"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_rds" {
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "sg-rds"
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_security_group_rule" "inbound_ssh" {
#   type      = "ingress"
#   from_port = 22
#   to_port   = 22
#   protocol  = "tcp"
#   cidr_blocks = [
#     "0.0.0.0/0"
#   ]
#   security_group_id = aws_security_group.sg_ec2.id
# }
