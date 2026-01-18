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