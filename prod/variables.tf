variable "region" {
  description = "AWS Region for deploy infra"
  type = string
}
variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}
variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for the EC2 instances"
  type        = string
}

variable "aws_key_pair" {
  description = "AWS key pair"
  type        = string
}

variable "min_size" {
  description = "ASG Min_size"
  type        = string
}

variable "max_size" {
  description = "ASG max_size"
  type        = string
}

variable "desired_capacity" {
  description = "ASG Desired Capacity"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "bucket_name" {
  description = "Backend bucket name"
  type = string
}