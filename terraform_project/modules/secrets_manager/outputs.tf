output "twilio_secret_arn" {
  value = aws_secretsmanager_secret.twilio.arn
}

output "email_secret_arn" {
  value = aws_secretsmanager_secret.email.arn
}

output "database_secret_arn" {
  value = aws_secretsmanager_secret.database.arn
}
