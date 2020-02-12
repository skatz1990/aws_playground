output "config-name" {
  value       = aws_launch_configuration.apache-launch-config.name
  description = "Launch configuration name"
}
