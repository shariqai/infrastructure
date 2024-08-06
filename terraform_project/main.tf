provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_name = "stock-analysis-vpc"
}

module "ecs" {
  source = "./modules/ecs"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets = module.vpc.public_subnets
  cluster_name = "stock-analysis-cluster"
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "stock-analysis-data"
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
}

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

module "iam" {
  source = "./modules/iam"
}

module "api_gateway" {
  source = "./modules/api_gateway"
}

module "lambda" {
  source = "./modules/lambda"
}

output "ecs_cluster_arn" {
  value = module.ecs.cluster_arn
}
