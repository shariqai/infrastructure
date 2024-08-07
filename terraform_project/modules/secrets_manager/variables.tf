variable "secrets" {
  description = "A map of secrets to store in AWS Secrets Manager."
  type        = map(map(string))
}
