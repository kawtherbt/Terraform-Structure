module "ecr" {
  source          = "terraform-aws-modules/ecr/aws"
  repository_name = var.ecr_repository_name
}
