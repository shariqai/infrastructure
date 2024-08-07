variable "lambda_function_name" {
  description = "The name of the Lambda function."
  type        = string
}

variable "handler" {
  description = "The function entry point in the code."
  type        = string
}

variable "runtime" {
  description = "The runtime environment for the Lambda function."
  type        = string
}

variable "role" {
  description = "The ARN of the IAM role that the Lambda function assumes when it executes."
  type        = string
}
