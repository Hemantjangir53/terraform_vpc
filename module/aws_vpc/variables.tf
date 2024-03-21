variable "aws_region" {
  description = "AWS region to launch resources."
}
variable "vpc_cidr" {}

variable "vpc_name" {
  type = string 
}

#### SUBNET ######

variable "availability_zones" {
 # default     = ["us-east-1a", "us-east-1b"]
  type        = list(any)
  description = "List of availability zones"
}

variable "public_subnet_cidr_blocks" {
  description = "List of public subnet CIDR blocks"
  type        = list(any)
 # default     = ["10.10.1.0/24", "10.10.3.0/24"]
}
variable "private_subnet_cidr_blocks" {
  description = "List of private subnet CIDR blocks"
  type = list(any)
  #default = ["10.10.2.0/24", "10.10.4.0/24"]
  
}
#### igw  ######

variable "igw" {
  type = string
 # default = "igw"
  
}