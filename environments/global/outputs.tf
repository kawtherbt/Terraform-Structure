# VPC Variables
variable "vpc_name" {
  description = "Nom du VPC"
  type        = string
  default     = "plan-it-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block pour les sous-réseaux publics"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  description = "CIDR block pour les sous-réseaux privés"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# EKS Variables
variable "eks_cluster_name" {
  description = "Nom du cluster EKS"
  type        = string
  default     = "plan-it-cluster"
}

variable "eks_node_type" {
  description = "Type des instances pour les nœuds EKS"
  type        = string
  default     = "t3.medium"
}

variable "eks_desired_capacity" {
  description = "Capacité souhaitée pour le nombre de nœuds"
  type        = number
  default     = 2
}

# RDS Variables
variable "rds_instance_name" {
  description = "Nom de l'instance RDS"
  type        = string
  default     = "plan-it-db"
}

variable "rds_instance_type" {
  description = "Type d'instance RDS"
  type        = string
  default     = "db.t3.medium"
}

variable "rds_engine" {
  description = "Moteur de base de données RDS"
  type        = string
  default     = "postgres"
}

variable "rds_username" {
  description = "Nom d'utilisateur pour la base de données RDS"
  type        = string
  default     = "admin"
}

variable "rds_password" {
  description = "Mot de passe pour la base de données RDS"
  type        = string
  sensitive   = true
}

# S3 Variables
variable "s3_bucket_name" {
  description = "Nom du bucket S3"
  type        = string
  default     = "plan-it-s3-bucket"
}

# Lambda Variables
variable "lambda_function_name" {
  description = "Nom de la fonction Lambda"
  type        = string
  default     = "plan-it-lambda"
}

variable "lambda_runtime" {
  description = "Runtime pour la fonction Lambda"
  type        = string
  default     = "nodejs14.x"
}

variable "lambda_handler" {
  description = "Handler de la fonction Lambda"
  type        = string
  default     = "index.handler"
}

# ECR Variables
variable "ecr_repository_name" {
  description = "Nom du repository ECR"
  type        = string
  default     = "plan-it-ecr-repository"
}

# CloudFront Variables
variable "cloudfront_distribution_name" {
  description = "Nom de la distribution CloudFront"
  type        = string
  default     = "plan-it-cloudfront-distribution"
}

# General Variables
variable "region" {
  description = "Région AWS"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Tags pour les ressources AWS"
  type        = map(string)
  default     = {
    "Project" = "Plan-IT"
    "Owner"   = "Meryem Braham"
  }
}
