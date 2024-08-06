resource "aws_secretsmanager_secret" "twilio" {
  name = "twilio-secrets"
}

resource "aws_secretsmanager_secret_version" "twilio" {
  secret_id = aws_secretsmanager_secret.twilio.id
  secret_string = jsonencode(var.secrets["twilio"])
}

resource "aws_secretsmanager_secret" "email" {
  name = "email-secrets"
}

resource "aws_secretsmanager_secret_version" "email" {
  secret_id = aws_secretsmanager_secret.email.id
  secret_string = jsonencode(var.secrets["email"])
}

resource "aws_secretsmanager_secret" "database" {
  name = "database-secrets"
}

resource "aws_secretsmanager_secret_version" "database" {
  secret_id = aws_secretsmanager_secret.database.id
  secret_string = jsonencode(var.secrets["database"])
}
