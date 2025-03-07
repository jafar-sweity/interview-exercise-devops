output "target_group_arn" {
  value = aws_lb_target_group.project_tg.arn
}

output "load_balancer_dns" {
  value = aws_lb.project_lb.dns_name
}