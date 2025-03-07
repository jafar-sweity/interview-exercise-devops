resource "aws_db_subnet_group" "db_subnet" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "project_db" {
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  identifier           = "db-instance"
  db_name              = var.db_name
  username             = var.db_user
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.db_subnet.id
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot  = true
  publicly_accessible  = false

  enabled_cloudwatch_logs_exports = ["general", "error", "slowquery"]

  tags = {
    Name = "${var.project_name}-db"
  }
}