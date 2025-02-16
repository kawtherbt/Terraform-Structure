module "vpc" {
  source = "../modules/vpc"

  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
}

module "bastion" {
  source = "../modules/bastion"

  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_ids[0]
}

module "rds" {
  source = "../modules/rds"

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
  db_name = "mydatabase"
  db_username = "admin"
  db_password = "password"
}

module "cloudfront" {
  source = "../modules/cloudfront"

  origin_domain_name = "example.com"
}

module "route53" {
  source = "../modules/route53"

  domain_name = "example.com"
  cloudfront_distribution_id = module.cloudfront.cloudfront_distribution_id
}

module "waf" {
  source = "../modules/waf"

  cloudfront_distribution_id = module.cloudfront.cloudfront_distribution_id
}