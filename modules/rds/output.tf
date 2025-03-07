output "rds_instance_id" {
  value = aws_db_instance.project_db.id
}

output "rds_endpoint" {
  value = aws_db_instance.project_db.endpoint
}