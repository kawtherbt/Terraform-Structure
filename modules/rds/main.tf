resource "aws_rds_cluster" "aurora" {
  engine                  = "aurora-postgresql"
  engine_version          = "13.9"
  cluster_identifier      = "aurora-cluster"
  database_name           = "planIT"
  master_username         = "admin1"
  master_password         = "password1"
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot     = true
}

resource "aws_rds_cluster_instance" "aurora_instances" {
  count                   = 2  # Creates two instances for high availability
  identifier              = "aurora-instance-${count.index}"
  cluster_identifier      = aws_rds_cluster.aurora.id
  instance_class          = "db.t3.medium"
  engine                  = "aurora-postgresql"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = var.subnet_ids
}