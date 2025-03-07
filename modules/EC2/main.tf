resource "aws_launch_template" "web" {
  name_prefix   = "${var.project_name}-web"
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group_id]
  }

  user_data = base64encode(
    <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y nginx
    echo "Hello from $(hostname)" > /var/www/html/index.html
    sudo systemctl start nginx
    EOF
  )
}

resource "aws_autoscaling_group" "web" {
  desired_capacity    = 2
  max_size            = 4
  min_size            = 2
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]
}