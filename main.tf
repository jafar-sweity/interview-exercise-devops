module "vpc" {
  source = "./modules/VPC"

  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
}

module "security_groups" {
  source = "./modules/security_groups"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
  trusted_ip   = var.MyPuplicIp
}

module "ec2" {
  source = "./modules/EC2"

  project_name      = var.project_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  security_group_id = module.security_groups.public_sg_id
  subnet_ids        = module.vpc.public_subnet_ids
  target_group_arn  = module.alb.target_group_arn
}

module "rds" {
  source = "./modules/rds"

  project_name      = var.project_name
  db_name           = var.db_name
  db_user           = var.db_user
  db_password       = var.db_password
  subnet_ids        = module.vpc.private_subnet_ids
  security_group_id = module.security_groups.private_sg_id
}

module "alb" {
  source = "./modules/alb"

  project_name      = var.project_name
  security_group_id = module.security_groups.alb_sg_id
  subnet_ids        = module.vpc.public_subnet_ids
  vpc_id            = module.vpc.vpc_id
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  project_name    = var.project_name
  instance_id     = module.ec2.instance_id
  rds_instance_id = module.rds.rds_instance_id
  email           = var.email
}
