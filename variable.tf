variable "aws_region" {
  description = "The AWS region to deploy resources in."
}

variable "project_name" {
  description = "The name of the project."
}

variable "vpc_name" {
  description = "The name of the VPC."
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
}

variable "availability_zones" {
  description = "The availability zones to use for subnets."
  type        = list(string)
}

variable "public_subnets" {
  description = "The CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "The CIDR blocks for the private subnets."
  type        = list(string)
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances."
}

variable "instance_type" {
  description = "The instance type for the EC2 instances."
}

variable "db_name" {
  description = "The name of the RDS database."
}

variable "db_user" {
  description = "The username for the RDS database."
}

variable "db_password" {
  description = "The password for the RDS database."
  sensitive   = true
}

variable "MyPuplicIp" {
  description = "The public IP address to allow SSH access."
}

variable "email" {
  description = "The email address for CloudWatch alarm notifications."
}