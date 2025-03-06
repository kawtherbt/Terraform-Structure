variable "eks_cluster_name" {
  description = "Nom du cluster EKS"
  type        = string
}

variable "eks_cluster_version" {
  description = "Version d'EKS"
  type        = string
}

variable "subnets" {
  description = "Sous-réseaux pour EKS"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID du VPC"
  type        = string
}
