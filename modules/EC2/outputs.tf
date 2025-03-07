output "instance_id" {
  value = aws_autoscaling_group.web.id
}
output "asg_name" {
  value = aws_autoscaling_group.web.name
}