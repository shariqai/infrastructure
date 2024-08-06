variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type = list(string)
}

variable "cluster_name" {
  description = "ECS Cluster Name"
  type = string
  default = "ecs-cluster"
}
