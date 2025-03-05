# VPC CIDR
vpc_cidr = "10.0.0.0/16"

# Public Subnet CIDR blocks
subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]

# Private Subnet CIDR blocks
private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]

# Availability Zones
availability_zones = ["us-east-1a", "us-east-1b"]

# Elastic IP ID (You should provide the ID of an Elastic IP if you want to use NAT Gateway)
elastic_ip_id = "eipalloc-12345678"

# Route 53 Hosted Zone ID
zone_id = "Z3M3E5GJ123456"

# ECR Repository
repository_name = "plan-it-repository"

# RDS Details
db_username = "admin"
db_password = "securepassword"
db_name = "planitdb"
db_instance_class = "db.t3.micro"
allocated_storage = 20

# EKS Cluster Details
cluster_name = "plan-it-cluster"
cluster_role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"

# CloudFront Origin Domain
origin_domain_name = "planit.com"
