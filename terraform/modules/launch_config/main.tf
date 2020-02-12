#Create launch configuration for autoscaling group
variable "security_groups" {}


resource "aws_launch_configuration" "apache-launch-config" {
  name_prefix     = lookup(var.ec2_configuration, "config_name_prefix")
  image_id        = lookup(var.ec2_configuration, "ami_id")
  instance_type   = lookup(var.ec2_configuration, "instance_type")
  user_data       = file("${lookup(var.ec2_configuration, "user_data_file")}")
  key_name        = lookup(var.ec2_configuration, "key_name")
  security_groups = []
}
