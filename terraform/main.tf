provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type

  tags = {
    Name = var.ec2_name
  }
}

# data "aws_instance" "ec2" {
#   ami 
#   instance_id = "i-instanceid"

#   filter {
#     name   = "image-id"
#     values = ["${var.ec2.ami_id}"]
#   }

#   filter {
#     name   = "tag:Name"
#     values = ["${variables.ec2.tag.name}"]
#   }
# }