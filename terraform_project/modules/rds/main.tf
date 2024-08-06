resource "aws_db_subnet_group" "main" {
  name = "rds-subnet-group"
  subnet_ids = var.private_subnets
}

resource "aws_db_instance" "main" {
  allocated_storage = 20
  engine = "postgres"
  instance_class = "db.t3.micro"
  name = "stockdb"
  username = "admin"
  password = "password"
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot = true
}
