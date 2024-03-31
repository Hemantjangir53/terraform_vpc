module "vpc" {
    source = "./module/aws_vpc"
    aws_region = local.aws_region
    vpc_name = local.vpc_names   # comes from root module valiables.tf file
    vpc_cidr = local.vpc_cidr
 #subnets
    availability_zones = local.availability_zones
    public_subnet_cidr_blocks = local.public_subnet_cidr_blocks
    private_subnet_cidr_blocks = local.private_subnet_cidr_blocks

    igw = local.igw

}

data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "./terraform.tfstate"
  }
}

module "ec2" {
  source        = "./module/aws_ec2" 
  ami_id        = local.ami_id   #"ami-0c7217cdde317cfec"  Replace with your desired AMI ID
  instance_type = local.instance_type     # Replace with your desired instance type
  #subnet_id = tostring(data.terraform_remote_state.vpc.outputs.subnet_id[0])
  #subnet_id = [for subnet_id in data.terraform_remote_state.vpc.outputs.subnet_id : tostring(subnet_id)]
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnets.subnet_id[0]
  private_subnet_id = data.terraform_remote_state.vpc.outputs.private_subnets.subnet_id[1]
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  security_group_id = data.terraform_remote_state.vpc.outputs.security_group_ids
  
}
 