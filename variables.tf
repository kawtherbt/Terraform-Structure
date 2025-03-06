# AWS Region
variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

# VPC Configuration
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "plan-it-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones to deploy resources"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "public_subnets" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

# EKS Configuration
variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "plan-it-cluster"
}

variable "eks_cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.21"
}

# RDS Configuration
variable "db_instance_name" {
  description = "Name of the RDS DB instance"
  type        = string
  default     = "plan-it-db"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "planitdb"
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage size for the RDS instance in GB"
  type        = number
  default     = 20
}

variable "engine_version" {
  description = "Engine version for RDS"
  type        = string
  default     = "13.4"
}

# S3 Configuration
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "plan-it-bucket"
}

# Lambda Configuration
variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "process-qrcode"
}

variable "lambda_role_arn" {
  description = "The ARN of the Lambda execution role"
  type        = string
  default     = "arn:aws:iam::982534377374:role/lambda-execution-role"
}

# ECR Configuration
variable "ecr_repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "plan-it-repo"
}

# CloudFront Configuration
variable "cloudfront_distribution_name" {
  description = "Name of the CloudFront distribution"
  type        = string
  default     = "plan-it-cloudfront"
}
