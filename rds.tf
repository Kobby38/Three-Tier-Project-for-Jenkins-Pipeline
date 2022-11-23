#creating database subnet group
resource "aws_db_subnet_group" "rds_mysql_subnet_group"{
 name = "mysql"
 subnet_ids = [aws_subnet.database_subnet_1.id,aws_subnet.database_subnet_2.id]

}

#create our rds database using terraform
resource "aws_db_instance" "three_tier_db" {
  allocated_storage      = var.db_storage
  engine                 = "mysql"
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  username               = var.dbuser
  password               = var.dbpassword
  multi_az               = var.enable_multi_AZ
  storage_type           = "gp2"
  db_subnet_group_name   = aws_db_subnet_group.rds_mysql_subnet_group.id
  skip_final_snapshot    = var.skip_db_snapshot
  vpc_security_group_ids = [aws_security_group.DB-tier-SG.id]
  publicly_accessible    = var.public_access

  tags = {
    Name = "three_tier_db"
  }
}