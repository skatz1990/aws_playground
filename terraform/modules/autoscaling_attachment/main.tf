#Attach autoscaling group to elb
variable elb {}
variable autoscaling_group_name {}

resource "aws_autoscaling_attachment" "apache-ha-elb-attach" {
  autoscaling_group_name = ""
  elb = {}
}