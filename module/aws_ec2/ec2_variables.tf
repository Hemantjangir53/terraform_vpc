variable "ami_id" {
  description = "this is ubuntu ami id"
  #default     = "ami-0c7217cdde317cfec"
}                

variable "instance_type" {
  #default = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string

  }/*
variable "private_subnet_id" {
  description = "Subnet ID for the private instance"
  type        = string
}*/
variable "vpc_id" {}

variable "security_group_id" {}
