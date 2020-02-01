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

#Import the elb module
module "apache-elb" {
  source          = "./modules/elb/"
  elb_name        = "apache-elb"
}

#Create launch configuration for autoscaling group
resource "aws_launch_configuration" "apache-launch-config" {
  name_prefix     = "apache-launch-config"
  image_id        = lookup(var.ec2_configuration, "ami_id")
  instance_type   = lookup(var.ec2_configuration, "instance_type")
  user_data       = file("${lookup(var.ec2_configuration, "user_data_file")}")
  key_name        = lookup(var.ec2_configuration, "key_name")
  security_groups = [module.apache-sg.sg-id]
}

#Create autoscaling group
resource "aws_autoscaling_group" "apache-ha" {
  name                      = "apache-ha-cluster"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 100
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = aws_launch_configuration.apache-launch-config.name
  vpc_zone_identifier       = [lookup(var.subnets, "subnet01"), lookup(var.subnets, "subnet02")]

  initial_lifecycle_hook {
    name                 = "lifecycle-continue"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 30
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
  }
}

#Attach autoscaling group to elb
resource "aws_autoscaling_attachment" "apache-ha-elb-attach" {
  autoscaling_group_name = aws_autoscaling_group.apache-ha.id
  elb                    = module.apache-elb.elb-name
}
