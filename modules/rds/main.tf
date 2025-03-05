resource "aws_db_instance" "main" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = var.db_subnet_group_name
  multi_az             = true

  tags = {
    Name = "Main RDS"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
}
