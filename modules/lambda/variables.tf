variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "PLANIT_lambda"
}

variable "lambda_zip_file" {
  description = "Path to the zipped Lambda deployment package"
  type        = string
  default = "C:/Users/MSI/Desktop/Terraform/modules/lambda/lambda_function.zip"
}

variable "vpc_id" {
  description = "The VPC ID where Lambda will be deployed"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for Lambda function"
  type        = list(string)
}

variable "lambda_role_arn" {
  description = "IAM Role ARN for Lambda execution"
  type        = string
  
}
