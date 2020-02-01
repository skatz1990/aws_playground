variable "aws_access_keys" {
  type        = map
  description = "AWS Access Keys for terraform deployment"

  default = {
    access_key = ""
    secret_key = ""
    region     = "us-west-1"
  }
}

variable "ec2_configuration" {
  type        = map
  description = "Our EC2 configuration"

  default = {
    name           = "apache-ec2"
    ami_id         = "ami-03caa3f860895f82e"
    instance_type  = "t2.micro"
    key_name       = "my_kp"
    user_data_file = "scripts/ec2_user_data.sh"
  }
}

variable "subnets" {
  type        = map
  description = "Available subnets in this deployment"

  default = {
    subnet01 = "subnet-7f2ce419"
    subnet02 = "subnet-8e2ecad4"
  }
}
