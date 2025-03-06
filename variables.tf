variable "region" {
  description = "AWS region"
  type        = string
}

variable "s3_bucket_domain_name" {
  description = "Nom de domaine du bucket S3 utilisé comme origine pour CloudFront"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t2.micro"
}
