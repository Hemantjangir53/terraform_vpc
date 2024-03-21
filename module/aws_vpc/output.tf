output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.test_vpc.id
  
}
output "my_vpc_name" {           # "my_vpc_name"  --> root module (outputs.tf)
    description = "VPC NAME"
    value = aws_vpc.test_vpc.tags["Name"]       
}

output "public_subnets" {
    value = {
        public_subnet_name = aws_subnet.public[*].tags["Name"]
        cidr = aws_subnet.public[*].cidr_block
        subnet_id = aws_subnet.public[*].id

    }
}
/*
output "private_subnets" {
    value = {
        public_subnet_name = aws_subnet.private[*].tags["Name"]
        cidr = aws_subnet.private[*].cidr_block
        subnet_id = aws_subnet.private[*].id

    }
}
*/