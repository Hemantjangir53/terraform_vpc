/*data "terraform_remote_state" "vpc_state" {
  backend = "local"
  config = {
    path = "./terraform.tfstate"
  }
}
*/
/*
module "ec2" {
  source        = "./module/aws_ec2"
  #subnet_id     = data.terraform_remote_state.vpc_state.outputs.subnet_id
  ami_id        = "ami-0c7217cdde317cfec"  # Replace with your desired AMI ID
  instance_type = "t2.micro"      # Replace with your desired instance type
  #subnet_id = module.vpc.subnet_id
  public_subnet_cidr_blocks = local.public_subnet_cidr_blocks

}
*/