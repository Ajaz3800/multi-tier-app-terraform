resource "aws_ssm_parameter" "db_username" {
  name        = "/prod/db/username"
  description = "Database username for vProfile application in prod environment"
  type        = "SecureString"
  value       = var.db_username
}
resource "aws_ssm_parameter" "db_password" {
  name        = "/prod/db/password"
  description = "Database password for vProfile application in prod environment"
  type        = "SecureString"
  value       = var.db_password
}
resource "aws_ssm_parameter" "rabbitmq_username" {
  name        = "/prod/rabbitmq/username"
  description = "RabbitMQ username for vProfile application in prod environment"
  type        = "SecureString"
  value       = var.rabbitmq_username
}
resource "aws_ssm_parameter" "rabbitmq_password" {
  name        = "/prod/rabbitmq/password"
  description = "RabbitMQ password for vProfile application in prod environment"
  type        = "SecureString"
  value       = var.rabbitmq_password
}
resource "aws_ssm_parameter" "admin_username" {
  name        = "/prod/admin/username"
  description = "Admin username for vProfile application in prod environment"
  type        = "SecureString"
  value       = var.admin_username
}
resource "aws_ssm_parameter" "admin_password" {
  name        = "/prod/admin/password"
  description = "Admin password for vProfile application in prod environment"
  type        = "SecureString"
  value       = var.admin_password
}