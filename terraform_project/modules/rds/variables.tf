variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type = list(string)
}
