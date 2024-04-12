resource "aws_vpc" "test_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

#### SUBNET ######

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.test_vpc.id
  count = length(var.public_subnet_cidr_blocks)

  cidr_block = var.public_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  #map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}


resource "aws_subnet" "private" {
  vpc_id = aws_vpc.test_vpc.id
  count = length(var.private_subnet_cidr_blocks)

  cidr_block = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  #map_public_ip_on_launch = true

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

#### igw  ####

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    Name = var.igw
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.test_vpc.id
  count = length(var.public_subnet_cidr_blocks)
  tags = {
    Name = "public-route-table-${count.index + 1}"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_blocks)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[count.index].id
}

##########  NAT gateway

resource "aws_eip" "nat-eip" {
  domain = "vpc"
  count = length(var.public_subnet_cidr_blocks)
  tags = {
    Name = "nat-eip-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "nat-gateway" {
  depends_on = [ aws_internet_gateway.igw ]
  count = length(var.public_subnet_cidr_blocks)
  allocation_id = aws_eip.nat-eip[count.index].id
  
  subnet_id = aws_subnet.public[count.index].id
  
  tags = {
      Name = "nat-gateway-${count.index +1 }"
      }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.test_vpc.id
  count = length(var.private_subnet_cidr_blocks)

  tags = {
    Name = "private-route-table-${count.index + 1}"
  }
}
resource "aws_route" "private" {
  route_table_id = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  count = length(var.private_subnet_cidr_blocks)
  nat_gateway_id = aws_nat_gateway.nat-gateway[count.index].id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr_blocks)
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

######### SG #######

resource "aws_security_group" "test_sg" {
  name        = "test_sg"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
