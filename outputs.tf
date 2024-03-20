output "vpc_names" {
  value = module.vpc.my_vpc_name    # "my_vpc_name" come from module/aws_vpc/outputs.tf file
}


output "public_subnet" {
  value = module.vpc.public_subnets
}

output "private_subnet" {
  value = module.vpc.private_subnets
}
