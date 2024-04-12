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
resource "aws_key_pair" "key" {
  key_name   = "tf-key"
  public_key = file("~/.ssh/tf-key.pub")
}

module "ec2" {
  source        = "./module/aws_ec2" 
  ec2_instances   = { for instance in local.config.common.ec2_instances : instance.name => instance }
  key_name = aws_key_pair.key.key_name
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.vpc.outputs.public_subnets.subnet_id[0]
  private_subnet_id = data.terraform_remote_state.vpc.outputs.private_subnets.subnet_id[1]

  security_group_ids = data.terraform_remote_state.vpc.outputs.security_group_ids

}
