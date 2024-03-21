
variable "ami_id" {
  description = "this is ubuntu ami id"
  #default     = "ami-0c7217cdde317cfec"
}                

variable "instance_type" {
  #default = "t2.micro"
}

variable "subnet_id" {}
variable "security_group_id" {}