variable "aws_access_keys" {
  type        = map
  description = "AWS Access Keys for terraform deployment"

  default = {
    access_key = ""
    secret_key = ""
    region     = "us-west-1"
  }
}