module "cloudfront" {
  source              = "terraform-aws-modules/cloudfront/aws"
  origin_id           = "S3-origin"
  origin_domain_name = var.s3_bucket_domain_name
  enabled             = true
  is_ipv6_enabled     = true
}
