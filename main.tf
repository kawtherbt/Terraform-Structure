# Provider AWS
provider "aws" {
  region = var.aws_region
}

# VPC Module
module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  availability_zones = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}

# EKS Module
module "eks" {
  source          = "./modules/eks"
  eks_cluster_name = var.eks_cluster_name
  eks_cluster_version = var.eks_cluster_version
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
}

# RDS Module
module "rds" {
  source              = "./modules/rds"
  db_instance_name    = var.db_instance_name
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  instance_class      = var.instance_class
  allocated_storage   = var.allocated_storage
  engine_version      = var.engine_version
  security_group_ids  = [module.vpc.default_security_group_id]
  db_subnet_group_name = module.vpc.private_subnet_group_name
}

# S3 Module
module "s3" {
  source   = "./modules/s3"
  bucket   = var.bucket_name
}

# Lambda Module
module "lambda" {
  source           = "./modules/lambda"
  function_name    = var.function_name
  lambda_role_arn  = var.lambda_role_arn
}

# ECR Module
module "ecr" {
  source          = "./modules/ecr"
  ecr_repository_name = var.ecr_repository_name
}

# CloudFront Module
module "cloudfront" {
  source              = "./modules/cloudfront"
  s3_bucket_domain_name = module.s3.bucket_regional_domain_name
}
