variable "ec2_instances" {
  description = "Map of EC2 instance configurations"
  type        = map(object({
    ami           = string
    instance_type = string
    public        = bool
    
    # You can add more EC2 configuration parameters here
  }))
}
variable "key_name" {}
variable "subnet_ids" {
  description = "Map of subnet IDs for EC2 instances"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for EC2 instances"
  #type        = list(string)
}

variable "vpc_id" {}

variable "private_subnet_id" {
  description = "Subnet ID for the private instance"
  type        = string
}

/*
variable "ami_id" {
  description = "this is ubuntu ami id"
  #type = string
}                

variable "instance_type" {
  #default = "t2.micro"
  type = string
}
variable "key_name" {}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
    type        = string
  }

variable "private_subnet_id" {
  description = "Subnet ID for the private instance"
  type        = string
}
variable "vpc_id" {}

variable "security_group_id" {}
*/