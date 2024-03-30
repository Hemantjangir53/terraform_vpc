output "vpc_names" {
  value = module.vpc.my_vpc_name    # "my_vpc_name" come from module/aws_vpc/outputs.tf file
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "security_group_ids" {
  value = module.vpc.security_group_ids
}

output "public_subnets" {
    value = {
        #public_subnet_name = aws_subnet.public[*].tags["Name"]
        #cidr = aws_subnet.public[*].cidr_block
        subnet_id = module.vpc.public_subnets.subnet_id
    }
}

output "private_subnets" {
    value = {
        subnet_id = module.vpc.private_subnets.subnet_id
    }
}
