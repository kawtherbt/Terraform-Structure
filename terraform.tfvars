# terraform.tfvars

aws_region          = "us-east-1"
vpc_name            = "plan-it-vpc"
vpc_cidr            = "10.0.0.0/16"
availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets     = ["10.0.1.0/24"]
public_subnets      = ["10.0.0.0/24"]
eks_cluster_name    = "plan-it-cluster"
eks_cluster_version = "1.21"
db_instance_name    = "plan-it-db"
db_name             = "planitdb"
db_username         = "admin"
db_password         = "password123"
instance_class      = "db.t3.micro"
allocated_storage   = 20
engine_version      = "13.4"
bucket_name         = "plan-it-bucket"
function_name       = "process-qrcode"
lambda_role_arn     = "arn:aws:iam::123456789012:role/lambda-execution-role"
ecr_repository_name = "plan-it-repo"
