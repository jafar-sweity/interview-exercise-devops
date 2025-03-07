variable "aws_region" {
  default = "us-west-2"
}

variable "project_name" {
  default = "interview-exercise-devops"
}

variable "vpc_name" {
  default = "interview-exercise-devops-vpc"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  default = ["us-west-2a", "us-west-2b"]
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "ami_id" {
  default = "ami-00c257e12d6828491"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "db_name" {
  default = "testdb" // best practice to put this in secret manager
}

variable "db_user" {
  default = "admin" // best practice to put this in secret manager
}

variable "db_password" {
  default = "securepassword" // best practice to put this in secret manager
}

variable "MyPuplicIp" {
  default = "77.91.159.44" // any one can change this to his public ip
}

variable "email" {
  default = "jata1518@gmail.com"
}