/*
module "ec2" {
  source = "./module/aws_ec2"
  ami_id = local.ami_id
  instance_type = local.instance_type
  
  subnet_id = data.terraform_remote_state.tf_state.outputs.subnet_id
  security_group_id = data.terraform_remote_state.tf_state.outputs.security_group_id
}
*/