module "lambda" {
  source           = "terraform-aws-modules/lambda/aws"
  function_name    = var.function_name
  role_arn         = var.lambda_role_arn
  handler          = "index.handler"
  runtime          = "nodejs14.x"
  timeout          = 60
  memory_size      = 128
  source_code_hash = filebase64sha256("lambda.zip")
}
