output "load_balancer_dns" {
  value = module.alb.load_balancer_dns
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "asg_name" {
  value = module.ec2.asg_name
}