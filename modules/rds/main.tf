resource "aws_db_instance" "rds" {
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  allocated_storage   = 20
  db_name             = "mydb"
  username            = "admin"
  password            = "password"
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name  # Correct attribute name
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = var.subnet_ids
}
