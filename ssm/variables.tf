variable "db_username" {
  description = "Database username for vProfile application in prod environment"
  type        = string
}
variable "db_password" {
  description = "Database password for vProfile application in prod environment"
  type        = string  
}
variable "rabbitmq_username" {
  description = "RabbitMQ username for vProfile application in prod environment"
  type        = string
}
variable "rabbitmq_password" {
  description = "RabbitMQ password for vProfile application in prod environment"
  type        = string  
}
variable "admin_username" {
  description = "Admin username for vProfile application in prod environment"   
  type        = string  
}
variable "admin_password" {
  description = "Admin password for vProfile application in prod environment"
  type        = string  
}