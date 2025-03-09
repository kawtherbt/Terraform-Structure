variable "region" {
  description = "aws region"
  type        = string
  default = "us-east-1"
}

variable "s3_bucket_domain_name" {
  description = "Nom de domaine du bucket S3 utilisé comme origine pour CloudFront"
  type        = string
  default = "kawther-bucket.s3.us-east-1.amazonaws.com"
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t2.micro"
}
