resource "aws_lambda_function" "api_handler" {
  filename = "function.zip"
  function_name = "StockRecommendationHandler"
  role = aws_iam_role.lambda_execution_role.arn
  handler = "index.handler"
  runtime = "python3.8"

  environment {
    variables = {
      TWILIO_ACCOUNT_SID = var.twilio_account_sid
      TWILIO_AUTH_TOKEN = var.twilio_auth_token
      TWILIO_PHONE_NUMBER = var.twilio_phone_number
      EMAIL_ADDRESS = var.email_address
      EMAIL_PASSWORD = var.email_password
    }
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambdaExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "lambda_execution_role_policy" {
  role = aws_iam_role.lambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
