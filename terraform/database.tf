# # Network
# resource "aws_subnet" "private_db_1" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = element(var.private_subnet_cidrs_storage, 0)
#   map_public_ip_on_launch = false
#   availability_zone       = element(var.azs, 0)
#   tags = {
#     Name = "private-db-1"
#   }
# }

# resource "aws_subnet" "private_db_2" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = element(var.private_subnet_cidrs_storage, 1)
#   map_public_ip_on_launch = false
#   availability_zone       = element(var.azs, 1)
#   tags = {
#     Name = "private-db-2"
#   }
# }

# resource "aws_db_subnet_group" "db_subnet" {
#   name        = "db-subnet"
#   description = "It is a DB subnet group on dev-env."
#   subnet_ids  = ["${aws_subnet.private_db_1.id}", "${aws_subnet.private_db_2.id}"]
#   tags = {
#     Name = "db-subnet"
#   }
# }

# # Security Group
# resource "aws_security_group" "db_sg" {
#   name        = "db-sg"
#   description = "It is a security group on db of dev-env"
#   vpc_id      = aws_vpc.main.id
#   tags = {
#     Name = "db-sg"
#   }
# }

# resource "aws_security_group_rule" "db" {
#   type                     = "ingress"
#   from_port                = 5432
#   to_port                  = 5432
#   protocol                 = "tcp"
#   source_security_group_id = aws_security_group.handson_ec2_sg.id
#   security_group_id        = aws_security_group.db_sg.id
# }

# variable "aws_db_username" { default = "myadmin" }
# variable "aws_db_password" { default = "12345678" }

# # RDS
# resource "aws_db_instance" "dbserver" {
#   identifier              = "db"
#   allocated_storage       = 5 # GB
#   engine                  = "postgres"
#   engine_version          = "15.3"
#   instance_class          = "db.t3.micro"
#   storage_type            = "gp2"
#   username                = var.aws_db_username
#   password                = var.aws_db_password
#   backup_retention_period = 0 # days
#   vpc_security_group_ids  = ["${aws_security_group.db_sg.id}"]
#   db_subnet_group_name    = aws_db_subnet_group.db_subnet.name
#   deletion_protection     = false
#   skip_final_snapshot     = true
#   tags = {
#     Name = "db-instance"
#   }
#   lifecycle {
#     ignore_changes = [password]
#   }
# }
