variable "aws_region" {
  description = "La région AWS où déployer l'infrastructure"
  type        = string
  default     = "us-west-2"
}

variable "app_name" {
  description = "Nom de l'application (par défaut 'planit')"
  type        = string
  default     = "planit"
}

variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  description = "CIDR pour les sous-réseaux privés"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr" {
  description = "CIDR pour les sous-réseaux publics"
  type        = string
  default     = "10.0.0.0/24"
}

variable "availability_zones" {
  description = "Les zones de disponibilité pour les sous-réseaux"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

variable "eks_cluster_name" {
  description = "Nom du cluster EKS"
  type        = string
  default     = "${var.app_name}-eks-cluster"
}

variable "cluster_role_arn" {
  description = "ARN du rôle IAM pour EKS"
  type        = string
}

variable "db_instance_name" {
  description = "Nom de l'instance RDS"
  type        = string
  default     = "${var.app_name}-db-instance"
}

variable "db_name" {
  description = "Nom de la base de données"
  type        = string
  default     = "${var.app_name}db"
}

variable "db_username" {
  description = "Nom d'utilisateur de la base de données"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Mot de passe de la base de données"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Classe d'instance RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Stockage alloué pour l'instance RDS (en Go)"
  type        = number
  default     = 20
}

variable "bucket_name" {
  description = "Nom du bucket S3"
  type        = string
  default     = "${var.app_name}-static-assets"
}

variable "function_name" {
  description = "Nom de la fonction Lambda"
  type        = string
  default     = "${var.app_name}-qr-lambda"
}

variable "lambda_role_arn" {
  description = "ARN du rôle IAM pour Lambda"
  type        = string
}

variable "ecr_repository_name" {
  description = "Nom du dépôt ECR"
  type        = string
  default     = "${var.app_name}-ecr-repository"
}

variable "s3_bucket_origin" {
  description = "Nom du bucket S3 pour CloudFront"
  type        = string
  default     = "${var.app_name}-static-assets"
}

variable "cloudfront_distribution_name" {
  description = "Nom de la distribution CloudFront"
  type        = string
  default     = "${var.app_name}-cloudfront"
}
