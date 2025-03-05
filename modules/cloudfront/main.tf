resource "aws_cloudfront_distribution" "main" {
  origin {
    domain_name = var.origin_domain_name
    origin_id   = "S3-origin"
  }

  enabled = true
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.main.domain_name
}
