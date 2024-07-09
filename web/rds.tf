resource "aws_db_instance" "default" {
  identifier                  = "mydb-postgres"
  allocated_storage           = 10
  db_name                     = "mydb"
  engine                      = "postgres"
  engine_version              = "16.3"
  storage_type                = "gp2"
  instance_class              = "db.t3.micro"
  backup_retention_period     = 0
  multi_az                    = false
  skip_final_snapshot         = true
  username                    = "myuser"
  manage_master_user_password = true
  db_subnet_group_name        = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids      = [aws_security_group.sg_rds.id]
  tags                        = { Name = "mydb" }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "my-rds-subnet-group"
  subnet_ids = [module.vpc.subnet_private_id, module.vpc.subnet_private_id2]
}
