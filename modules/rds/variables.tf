variable "db_instance_name" {
  description = "Nom de l'instance RDS"
  type        = string
}

variable "db_name" {
  description = "Nom de la base de données"
  type        = string
}

variable "db_username" {
  description = "Nom d'utilisateur pour la base de données"
  type        = string
}

variable "db_password" {
  description = "Mot de passe de la base de données"
  type        = string
}

variable "instance_class" {
  description = "Type d'instance pour RDS"
  type        = string
}

variable "allocated_storage" {
  description = "Espace alloué pour RDS (en Go)"
  type        = number
}

variable "engine_version" {
  description = "Version du moteur de base de données"
  type        = string
}

variable "security_group_ids" {
  description = "Liste des groupes de sécurité pour RDS"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "Nom du groupe de sous-réseaux pour RDS"
  type        = string
}
