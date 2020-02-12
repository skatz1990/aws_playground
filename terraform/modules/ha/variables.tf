variable "subnets" {
  type        = map
  description = "Available subnets in this deployment"

  default = {
    subnet01 = "subnet-7f2ce419"
    subnet02 = "subnet-8e2ecad4"
  }
}

variable "configuration" {
  type        = map
  description = "Configuration variables"

  default = {
    name                      = "apache-ha-cluster"
    max_size                  = 3
    min_size                  = 1
    health_check_grace_period = 100
    health_check_type         = "ELB"
    desired_capacity          = 1
    force_delete              = true
  }
}


variable "initial_lifecycle_hook" {
  type        = map
  description = "Lifecycle Hook variables"

  default = {
    name                 = "lifecycle-continue"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 30
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
  }
}
