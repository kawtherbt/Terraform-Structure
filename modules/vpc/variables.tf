variable "vpc_name" {
  description = "Nom du VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block pour le VPC"
  type        = string
}

variable "availability_zones" {
  description = "Zones de disponibilité AWS"
  type        = list(string)
}

variable "private_subnets" {
  description = "Sous-réseaux privés"
  type        = list(string)
}

variable "public_subnets" {
  description = "Sous-réseaux publics"
  type        = list(string)
}
