variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-west-1"
}

variable "ec2_name"{
    type = string
    description = "Our EC2 name"
    default = "apache-ec2"
}

variable "ec2_ami_id"{
    type = string
    description = "EC2 AMI"
    default = "ami-03caa3f860895f82e"
}

variable "ec2_instance_type"{
    type = string
    description = "EC2 instance type"
    default = "t2.micro"
}