variable "ec2_configuration" {
  type        = map
  description = "Our EC2 configuration"

  default = {
    name               = "apache-ec2"
    ami_id             = "ami-03caa3f860895f82e"
    instance_type      = "t2.micro"
    key_name           = "my_kp"
    user_data_file     = "scripts/ec2_user_data.sh"
    config_name_prefix = "apache-launch-config"
  }
}
