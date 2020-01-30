#Declare provider
provider "aws" {
  access_key = lookup(var.aws_access_keys, "access_key")
  secret_key = lookup(var.aws_access_keys, "secret_key")
  region     = lookup(var.aws_access_keys, "region")
}

#Import the security group module
module "apache-sg" {
  source  = "./modules/sg/"
  sg_name = "apache-sg"
}

resource "aws_instance" "web" {
  ami           = lookup(var.ec2_configuration, "ami_id")
  instance_type = lookup(var.ec2_configuration, "instance_type")
  # vpc_security_group_ids = ["${module.main_sg.this_security_group_id}"]
  security_groups = ["${module.apache-sg.sg-id}"]
  key_name = lookup(var.ec2_configuration, "key_name")

  tags = {
    Name = lookup(var.ec2_configuration, "name")
  }

  user_data = "${file("${lookup(var.ec2_configuration, "user_data_file")}")}"
}

#Import the elb module
# module "apache-elb" {
#   source   = "./modules/elb/"
#   elb_name = "apache-elb"
# }
