provider "aws" {
  access_key = "YOUR_AWS_ACCESS_KEY"
  secret_key = "YOUR_AWS_SECRET_KEY"
  region     = "us-east-1"
}
module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source    = "./modules/ec2"
  subnet_id = module.vpc.public_subnets[0]
}

module "eks" {
  source     = "./modules/eks"
  subnet_ids = module.vpc.private_subnets
}

module "rds" {
  source     = "./modules/rds"
  subnet_ids = module.vpc.private_subnets
}

module "cloudfront" {
  source                 = "./modules/cloudfront"
  s3_bucket_domain_name  = var.s3_bucket_domain_name
}
