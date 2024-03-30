resource "aws_key_pair" "key" {
  key_name   = "id_rsa"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "public" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.key.key_name
  subnet_id = var.subnet_id
  #security_groups = var.security_group_ids 
  security_groups = [var.security_group_id]

  tags = {
    Name = "public-instance"
  }
}
/*
resource "aws_instance" "private" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.key.key_name
  subnet_id = var.subnet_id[0]
  tags = {
    Name = "private-instance"
  }
}
*/