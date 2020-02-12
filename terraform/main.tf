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
  source   = "./modules/elb/"
  elb_name = "apache-elb"
}

#Attach autoscaling group to elb
module "apache-ha-elb-attach" {
  source                 = "./modules/autoscaling_attachment/"
  elb                    = "apache-elb"
  autoscaling_group_name = "apache-ha"
}

#Create launch configuration for autoscaling group
module "apache-launch-config" {
  source          = "./modules/launch_config"
  security_groups = [module.apache-sg.sg-id]
}

#Create autoscaling group
module "apache-ha" {
  source               = "./modules/ha"
  launch_configuration = module.apache-launch-config.config-name
}
