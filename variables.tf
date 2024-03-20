
locals {
  config           = yamldecode(file("./config.yml"))
  #common           = local.config["common"]
  ### VPC #######
  aws_region = local.config.common.vpc.region
  vpc_cidr = local.config.common.vpc.cidr
  vpc_names = local.config.common.vpc.Name
  ### SUBNET #######
  availability_zones = local.config.common.subnet.availability_zones
  public_subnet_cidr_blocks = local.config.common.subnet.public_cidr
  private_subnet_cidr_blocks = local.config.common.subnet.private_cidr
  ### SUBNET #######
  igw = local.config.common.subnet.igw.Name
  ### SUBNET #######
  ami_id = local.config.common.subnet.instance.ami_id
  instance_type = local.config.common.subnet.instance.instance_type

}

/*
variable "aws_region" {
  description = "AWS region to launch resources."
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "10.10.0.0/16"
}
*/
/*
variable "vpc_name" {
  type = string
  default = "test_vpc"
}
*/

#### SUBNET ######
/*
variable "availability_zones" {
  default     = ["us-east-1a", "us-east-1b"]
  type        = list(any)
  description = "List of availability zones"
}

variable "public_subnet_cidr_blocks" {
  description = "List of public subnet CIDR blocks"
  type        = list(any)
  default     = ["10.10.1.0/24", "10.10.3.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "List of private subnet CIDR blocks"
  type = list(any)
  default = ["10.10.2.0/24", "10.10.4.0/24"]
  
}
*/
#### igw  ######
/*
variable "igw" {
  type = string
  default = "igw"
  
}
*/
#### EC2-instance  ######
/*
variable "ami_id" {
  description = "this is ubuntu ami id"
  default     = "ami-0c7217cdde317cfec"
}                

variable "instance_type" {
  default = "t2.micro"
}
*/