resource "aws_key_pair" "key" {
  key_name   = "id_rsa"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "public" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.key.key_name
  subnet_id     = var.subnet_id
      
  tags = {
    Name = "public-instance"
  }
}