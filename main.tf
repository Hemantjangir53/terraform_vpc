module "vpc" {
    source = "./module/aws_vpc"
    aws_region = local.aws_region
   # vpc_name = var.vpc_name
    vpc_name = local.vpc_names   # comes from root module valiables.tf file
    vpc_cidr = local.vpc_cidr
    
    availability_zones = local.availability_zones
    public_subnet_cidr_blocks = local.public_subnet_cidr_blocks
    private_subnet_cidr_blocks = local.private_subnet_cidr_blocks

    igw = local.igw
#create ec2-instance
    ami_id = local.ami_id
    instance_type = local.instance_type

}