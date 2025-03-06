module "rds" {
  source              = "terraform-aws-modules/rds/aws"
  db_instance_name    = var.db_instance_name
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  instance_class      = var.instance_class
  allocated_storage   = var.allocated_storage
  engine              = "postgres"
  engine_version      = var.engine_version
  multi_az            = true
  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name = var.db_subnet_group_name
}
