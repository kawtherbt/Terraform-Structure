resource "aws_eks_cluster" "eks" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::977099016921:role/terraform-role"

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}
