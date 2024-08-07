provider "aws" {
  region = "us-east-1"
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"
  vpc_name = "stock-analysis-vpc"

  vpc_cidr_block = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

# ECS Module
module "ecs" {
  source = "./modules/ecs"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets = module.vpc.public_subnets
  cluster_name = "stock-analysis-cluster"
}

# RDS Module
module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets

  db_instance_identifier = "stock-analysis-db"
  db_name = "stockanalysis"
  db_username = "admin"
  db_password = "your_db_password"
}

# S3 Module
module "s3" {
  source = "./modules/s3"
  bucket_name = "stock-analysis-data"
}

# CloudWatch Module
module "cloudwatch" {
  source = "./modules/cloudwatch"
  log_group_name = "/aws/stock-analysis"
}

# Secrets Manager Module
module "secrets_manager" {
  source = "./modules/secrets_manager"
  secrets = {
    "twilio" = {
      "TWILIO_ACCOUNT_SID" = "your_twilio_account_sid"
      "TWILIO_AUTH_TOKEN" = "your_twilio_auth_token"
      "TWILIO_PHONE_NUMBER" = "your_twilio_phone_number"
    }
    "email" = {
      "EMAIL_ADDRESS" = "your_email_address"
      "EMAIL_PASSWORD" = "your_email_password"
    }
    "database" = {
      "DATABASE_URI" = "postgres://username:password@hostname/dbname"
    }
  }
}

# IAM Module
module "iam" {
  source = "./modules/iam"
}

# API Gateway Module
module "api_gateway" {
  source = "./modules/api_gateway"
  rest_api_name = "stock-analysis-api"
}

# Lambda Module
module "lambda" {
  source = "./modules/lambda"
  lambda_function_name = "stock-analysis-function"
  handler = "index.handler"
  runtime = "python3.8"
  role = module.iam.lambda_exec_role_arn
}

output "ecs_cluster_arn" {
  value = module.ecs.cluster_arn
}

output "rds_endpoint" {
  value = module.rds.db_instance_endpoint
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "cloudwatch_log_group" {
  value = module.cloudwatch.log_group_name
}

output "api_gateway_url" {
  value = module.api_gateway.invoke_url
}
