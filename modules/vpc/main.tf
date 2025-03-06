module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  name            = var.vpc_name
  cidr            = var.vpc_cidr
  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  enable_dns_hostnames = true
  enable_dns_support  = true
}
