provider "aws" {
  access_key = "/////"
  secret_key = "/////"
  region     = "us-east-1"
}
module "vpc" {
  source = "./modules/vpc"
}


module "eks" {
  source     = "./modules/eks"
  subnet_ids = module.vpc.private_subnets
}

module "lambda" {
  source               = "./modules/lambda"
  lambda_function_name = "PLANIT_lambda"
  lambda_zip_file      = "lambda_function.zip"
  vpc_id               = module.vpc.vpc_id
  private_subnets      = module.vpc.private_subnets
  lambda_role_arn      = "arn:aws:iam::977099016921:role/terraform-role"  # Replace with actual ARN
 }

 module "rds" {
   source     = "./modules/rds"
   subnet_ids = module.vpc.private_subnets
 }

 module "cloudfront" {
   source                 = "./modules/cloudfront"
   s3_bucket_domain_name  = var.s3_bucket_domain_name
 }
