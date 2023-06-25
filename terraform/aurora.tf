variable "aws_db_username" { default = "myadmin" }
variable "aws_db_password" { default = "12345678" }

resource "aws_rds_cluster" "example" {
  cluster_identifier                  = "aurora-cluster-demo"
  engine                              = "aurora-postgresql"
  engine_mode                         = "provisioned"
  engine_version                      = "13.6"
  master_username                     = var.aws_db_username
  master_password                     = var.aws_db_password
  database_name                       = "mydb"
  vpc_security_group_ids              = [aws_security_group.handson_ec2_sg.id]
  db_subnet_group_name                = aws_db_subnet_group.example.name
  db_cluster_parameter_group_name     = aws_rds_cluster_parameter_group.example.name
  iam_database_authentication_enabled = true
  skip_final_snapshot                 = true
  apply_immediately                   = true
  tags = {
    Name = "r-kubota"
  }
  serverlessv2_scaling_configuration {
    min_capacity = 0.5
    max_capacity = 1.0
  }
  lifecycle {
    ignore_changes = [master_password]
  }
}

resource "aws_rds_cluster_instance" "example" {
  cluster_identifier      = aws_rds_cluster.example.id
  identifier              = "my-aurora-cluster-demo-serverless-instance"
  engine                  = aws_rds_cluster.example.engine
  engine_version          = aws_rds_cluster.example.engine_version
  instance_class          = "db.serverless"
  db_subnet_group_name    = aws_db_subnet_group.example.name
  db_parameter_group_name = aws_db_parameter_group.example.name
  publicly_accessible     = true
}

resource "aws_db_subnet_group" "example" {
  name       = "my_db_subnet_group_name"
  subnet_ids = aws_subnet.public_subnets[*].id

  tags = {
    Name = "r-kubota"
  }
}

resource "aws_rds_cluster_parameter_group" "example" {
  name   = "rdsclusterparametergroupname"
  family = "aurora-postgresql13"

  tags = {
    Name = "r-kubota"
  }
}

resource "aws_db_parameter_group" "example" {
  name   = "dbparametergroupname"
  family = "aurora-postgresql13"

  parameter {
    apply_method = "pending-reboot"
    name         = "shared_preload_libraries"
    value        = "pg_stat_statements,pg_hint_plan"
  }
}
