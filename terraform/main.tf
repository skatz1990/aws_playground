provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = ["${module.main_sg.this_security_group_id}"]
  key_name               = var.ec2_key_name

  tags = {
    Name = var.ec2_name
  }

  user_data = "${file("${var.ec2_user_data_file}")}"
}
