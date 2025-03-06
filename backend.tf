terraform {
  backend "s3" {
    bucket  = "my-terraform-state"
    key     = "state/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
