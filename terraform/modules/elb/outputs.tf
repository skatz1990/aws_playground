output "elb-name" {
  value       = aws_elb.apache-elb.name
  description = "The ID of the apache load balancer"
}
