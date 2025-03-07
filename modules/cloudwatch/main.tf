resource "aws_cloudwatch_log_group" "web_logs" {
  name = "/ec2/${var.project_name}-web-logs"
}

resource "aws_cloudwatch_log_stream" "web_log_stream" {
  name           = "web-instance-logs"
  log_group_name = aws_cloudwatch_log_group.web_logs.name
}

resource "aws_sns_topic" "alarm_notifications" {
  name = "${var.project_name}-alarm-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alarm_notifications.arn
  protocol  = "email"
  endpoint  = var.email
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "${var.project_name}-high-cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when CPU exceeds 80%"
  alarm_actions       = [aws_sns_topic.alarm_notifications.arn]
  dimensions = {
    InstanceId = var.instance_id
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_connections" {
  alarm_name          = "${var.project_name}-rds-connections"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 100
  alarm_description   = "Alarm when RDS connections exceed 100"
  alarm_actions       = [aws_sns_topic.alarm_notifications.arn]
  dimensions = {
    DBInstanceIdentifier = var.rds_instance_id
  }
}