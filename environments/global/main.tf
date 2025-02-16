# Appel du module VPC pour créer le VPC, les sous-réseaux, etc.
module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]  # Sous-réseaux publics
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"] # Sous-réseaux privés
  availability_zones  = ["us-east-1a", "us-east-1b"]    # Zones de disponibilité
}

# Appel du module Bastion Host pour créer un bastion host dans le sous-réseau public
module "bastion" {
  source = "../../modules/bastion"

  vpc_id     = module.vpc.vpc_id
  subnet_id  = module.vpc.public_subnet_ids[0]  # Utilise le premier sous-réseau public
  key_name   = "my-key-pair"                    # Clé SSH pour accéder au bastion
}

# Appel du module NAT Gateway pour créer un NAT Gateway dans le sous-réseau public
module "nat_gateway" {
  source = "../../modules/nat_gateway"

  subnet_id = module.vpc.public_subnet_ids[0]  # Utilise le premier sous-réseau public
}

# Appel du module RDS pour créer une base de données RDS dans les sous-réseaux privés
module "rds" {
  source = "../../modules/rds"

  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids  # Utilise les sous-réseaux privés
  db_name         = "globale_db"
  db_username     = "admin"
  db_password     = "securepassword123"
  engine          = "mysql"
  engine_version  = "5.7"
  instance_class  = "db.t2.micro"
  allocated_storage = 20
}

# Appel du module CloudFront pour créer une distribution CloudFront
module "cloudfront" {
  source = "../../modules/cloudfront"

  origin_domain_name = "example.com"  # Domaine d'origine pour CloudFront
}

# Appel du module Route 53 pour configurer DNS
module "route53" {
  source = "../../modules/route53"

  domain_name                = "example.com"
  cloudfront_distribution_id = module.cloudfront.cloudfront_distribution_id
}

# Appel du module WAF pour configurer AWS WAF
module "waf" {
  source = "../../modules/waf"

  cloudfront_distribution_id = module.cloudfront.cloudfront_distribution_id
}

# Appel du module ECR pour créer un Elastic Container Registry
module "ecr" {
  source = "../../modules/ecr"

  repository_name = "globale-app"
}

# Appel du module EC2 pour créer les instances EC2 (Front Container, Gestion Equip, etc.)
module "front_container" {
  source = "../../modules/ec2"

  instance_count = 2
  instance_type  = "t2.micro"
  subnet_ids     = module.vpc.public_subnet_ids
  security_group_ids = [module.vpc.default_security_group_id]
  key_name       = "my-key-pair"
  ami            = "ami-0c55b159cbfafe1f0"  # AMI pour Amazon Linux 2
  instance_name  = "front-container"
}

module "gestion_equip" {
  source = "../../modules/ec2"

  instance_count = 1
  instance_type  = "t2.micro"
  subnet_ids     = module.vpc.private_subnet_ids
  security_group_ids = [module.vpc.default_security_group_id]
  key_name       = "my-key-pair"
  ami            = "ami-0c55b159cbfafe1f0"
  instance_name  = "gestion-equip"
}

module "gestion_pers" {
  source = "../../modules/ec2"

  instance_count = 1
  instance_type  = "t2.micro"
  subnet_ids     = module.vpc.private_subnet_ids
  security_group_ids = [module.vpc.default_security_group_id]
  key_name       = "my-key-pair"
  ami            = "ami-0c55b159cbfafe1f0"
  instance_name  = "gestion-pers"
}

module "dashboard" {
  source = "../../modules/ec2"

  instance_count = 1
  instance_type  = "t2.micro"
  subnet_ids     = module.vpc.public_subnet_ids
  security_group_ids = [module.vpc.default_security_group_id]
  key_name       = "my-key-pair"
  ami            = "ami-0c55b159cbfafe1f0"
  instance_name  = "dashboard"
}

module "auth" {
  source = "../../modules/ec2"

  instance_count = 1
  instance_type  = "t2.micro"
  subnet_ids     = module.vpc.private_subnet_ids
  security_group_ids = [module.vpc.default_security_group_id]
  key_name       = "my-key-pair"
  ami            = "ami-0c55b159cbfafe1f0"
  instance