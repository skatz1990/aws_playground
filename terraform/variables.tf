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
    name = "apache-ec2"
    ami_id = "ami-03caa3f860895f82e"
    instance_type = "t2.micro"
    key_name = "my_kp"
    user_data_file = "scripts/ec2_user_data.sh"
  }
}

# variable "ec2_name" {
#   type        = string
#   description = "Our EC2 name"
#   default     = "apache-ec2"
# }

# variable "ec2_user_data_file" {
#   type        = string
#   description = "EC2 User Data file"
#   default     = "scripts/ec2_user_data.sh"
# }

# variable "ec2_ami_id" {
#   type        = string
#   description = "EC2 AMI"
#   default     = "ami-03caa3f860895f82e"
# }

# variable "ec2_instance_type" {
#   type        = string
#   description = "EC2 instance type"
#   default     = "t2.micro"
# }

# variable "ec2_key_name" {
#   type        = string
#   description = "The key pair used for this instance"
#   default     = "my_kp"
# }