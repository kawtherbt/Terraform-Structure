terraform {
  backend "s3" {
    bucket  = "meryem-state"
    key     = "state/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}