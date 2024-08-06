resource "aws_cloudwatch_log_group" "main" {
  name = "/aws/stock-analysis/logs"
  retention_in_days = 7
}
