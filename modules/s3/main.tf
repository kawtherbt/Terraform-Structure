module "s3" {
  source   = "terraform-aws-modules/s3-bucket/aws"
  bucket   = var.bucket_name
  acl      = "private"
  versioning = {
    enabled = true
  }
}
