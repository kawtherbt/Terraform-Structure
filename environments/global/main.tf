provider "aws" {
  region = "us-east-1"
}

# VPC Module
module "vpc" {
  source    = "./modules/vpc"
  vpc_cidr  = "10.0.0.0/16"
}

# ECR Module
module "ecr" {
  source         = "./modules/ecr"
  repository_name = "plan-it-repository"
}

# EKS Module
module "eks" {
  source           = "./modules/eks"
  cluster_name     = "plan-it-cluster"
  cluster_role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  subnet_ids       = module.vpc.subnet_ids
}

# RDS Module
module "rds" {
  source              = "./modules/rds"
  allocated_storage   = 20
  engine              = "postgres"
  engine_version      = "12"
  instance_class      = "db.t3.micro"
  db_name             = "planitdb"
  db_username         = "admin"
  db_password         = "securepassword"
  db_subnet_group_name = "plan-it-db-subnet"
}

# CloudFront Module
module "cloudfront" {
  source          = "./modules/cloudfront"
  origin_domain_name = "planit.com"
}

# Security Groups (for ALB and EC2 Instances)
resource "aws_security_group" "allow_alb" {
  name        = "allow-alb"
  description = "Allow inbound traffic for ALB"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-alb-sg"
  }
}

resource "aws_security_group" "allow_ec2" {
  name        = "allow-ec2"
  description = "Allow inbound traffic for EC2 instances"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ec2-sg"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = var.elastic_ip_id
  subnet_id     = module.vpc.public_subnet_ids[0]
}

# Elastic Load Balancer (ELB)
resource "aws_lb" "main" {
  name               = "plan-it-elb"
  internal           = false
  load_balancer_type = "application"
  security_groups   = [aws_security_group.allow_alb.id]
  subnets            = module.vpc.public_subnet_ids

  enable_deletion_protection = true
}

# WAF Web ACL
resource "aws_wafv2_web_acl" "main" {
  name        = "planit-waf"
  scope       = "REGIONAL"
  description = "WAF for Plan-It application"
  default_action {
    allow {}
  }

  rule {
    action {
      block {}
    }
    rule_id = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 0
    statement {
      managed_rule_group_statement {
        vendor_name = "AWS"
        rule_group_name = "AWSManagedRulesCommonRuleSet"
      }
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "waf-metrics"
    sampled_requests_enabled   = true
  }

  tags = {
    Name = "Plan-It WAF"
  }
}

# Route 53 Record
resource "aws_route53_record" "main" {
  zone_id = var.zone_id
  name    = "planit.com"
  type    = "A"
  ttl     = 300
  records = [aws_lb.main.dns_name]
}

# Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ecr_url" {
  value = module.ecr.repository_url
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "cloudfront_url" {
  value = module.cloudfront.cloudfront_domain_name
}

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}

output "elb_dns_name" {
  value = aws_lb.main.dns_name
}

output "waf_arn" {
  value = aws_wafv2_web_acl.main.arn
}

output "route53_record" {
  value = aws_route53_record.main.name
}
