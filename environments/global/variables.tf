# VPC Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Availability Zones for the subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# Elastic IP for NAT Gateway
variable "elastic_ip_id" {
  description = "Elastic IP ID for the NAT Gateway"
  type        = string
}

# Route53
variable "zone_id" {
  description = "Route 53 Hosted Zone ID"
  type        = string
}

# ECR
variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "plan-it-repository"
}

# RDS
variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
  default     = "securepassword"
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
  default     = "planitdb"
}

variable "db_instance_class" {
  description = "Instance class for RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage for RDS"
  type        = number
  default     = 20
}

# EKS Cluster
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "plan-it-cluster"
}

variable "cluster_role_arn" {
  description = "IAM Role ARN for the EKS cluster"
  type        = string
}

# CloudFront
variable "origin_domain_name" {
  description = "Origin domain name for CloudFront"
  type        = string
  default     = "planit.com"
}
