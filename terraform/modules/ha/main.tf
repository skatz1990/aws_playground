#Create autoscaling group
variable "launch_configuration" {}


resource "aws_autoscaling_group" "apache-ha" {
  name                      = var.configuration.name
  max_size                  = var.configuration.max_size
  min_size                  = var.configuration.min_size
  health_check_grace_period = var.configuration.health_check_grace_period
  health_check_type         = var.configuration.health_check_type
  desired_capacity          = var.configuration.desired_capacity
  force_delete              = var.configuration.force_delete
  launch_configuration      = ""
  vpc_zone_identifier       = [lookup(var.subnets, "subnet01"), lookup(var.subnets, "subnet02")]

  initial_lifecycle_hook {
    name                 = var.initial_lifecycle_hook.name
    default_result       = var.initial_lifecycle_hook.default_result
    heartbeat_timeout    = var.initial_lifecycle_hook.heartbeat_timeout
    lifecycle_transition = var.initial_lifecycle_hook.lifecycle_transition
  }
}