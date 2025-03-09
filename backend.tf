terraform {
  backend "s3" {
    bucket  = "kawther-bucket"
    key     = "state/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}


