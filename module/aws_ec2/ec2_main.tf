resource "aws_key_pair" "key" {
  key_name   = "id_rsa"
  public_key = file("~/.ssh/id_rsa.pub")
}

data "terraform_remote_state" "tf_state" {
    backend = "local"
    config = {
        path = "../../terraform.tfstate"
    }
}

resource "aws_instance" "public" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.key.key_name
  #subnet_id = var.subnet_id
  #security_groups = var.security_group_id
  subnet_id     = data.terraform_remote_state.tf_state.outputs.subnet_id
  security_groups = [data.terraform_remote_state.tf_state.outputs.security_group_id]

  #vpc_security_group_ids = [aws_security_group.test_sg.id]
  #count = length(var.public_subnet_cidr_blocks)
  #subnet_id = aws_subnet.public[count.index].id

  tags = {
    Name = "public-instance"
  }
}