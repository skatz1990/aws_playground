#############################################################
# Data sources to get VPC
#############################################################
data "aws_vpc" "default" {
  default = true
}

module "main_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "apache-sg"
  description = "Security group which is used as an argument in apache-sg"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}