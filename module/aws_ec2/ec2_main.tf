resource "aws_instance" "ec2_instances" {
  for_each = var.ec2_instances 
  ami           = each.value.ami
  instance_type = each.value.instance_type
  
  subnet_id     = each.value.public ? var.subnet_ids : var.private_subnet_id  
  key_name = var.key_name  # put key using var.(outside ec2)
  security_groups = [var.security_group_ids]
  associate_public_ip_address = true

  # You can add more EC2 configuration here

  tags = {
    Name = each.key
  }
}


/*
resource "aws_instance" "public" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id
  #security_groups = var.security_group_ids 
  security_groups = [var.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "public-instance"
  }
}
*/
/*
resource "aws_instance" "private" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.key.key_name
  subnet_id = var.private_subnet_id
  security_groups = [var.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "private-instance"
  }
}
*/