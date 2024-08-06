output "vpc_id" {
  value = module.vpc.vpc_id
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "api_gateway_endpoint" {
  value = module.api_gateway.invoke_url
}
