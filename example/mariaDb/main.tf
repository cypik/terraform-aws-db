provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source      = "cypik/vpc/aws"
  version     = "1.0.1"
  name        = "vpc"
  environment = "test"
  label_order = ["environment", "name"]

  cidr_block = "10.0.0.0/16"
}

module "private_subnets" {
  source      = "cypik/subnet/aws"
  version     = "1.0.1"
  name        = "subnets"
  environment = "test"
  label_order = ["environment", "name"]

  availability_zones = ["eu-west-1a", "eu-west-1b"]
  vpc_id             = module.vpc.id
  type               = "public-private"
  igw_id             = module.vpc.igw_id
  cidr_block         = module.vpc.vpc_cidr_block
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}

module "mariadb" {
  source = "../../"

  name        = "mariadb"
  environment = "test"
  label_order = ["environment", "name"]

  engine            = "MariaDB"
  engine_version    = "10.6.10"
  instance_class    = "db.m5.large"
  engine_name       = "MariaDB"
  allocated_storage = 50

  db_name  = "test"
  username = "user"
  password = "esfsgcGdfawAhdxtfjm!"
  port     = "3306"

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  multi_az           = false


  vpc_id        = module.vpc.id
  allowed_ip    = [module.vpc.vpc_cidr_block]
  allowed_ports = [3306]

  family = "mariadb10.6"

  backup_retention_period = 0

  enabled_cloudwatch_logs_exports = ["audit", "general"]

  subnet_ids          = module.private_subnets.public_subnet_id
  publicly_accessible = true

  major_engine_version = "10.6"

  deletion_protection = true

  ssm_parameter_endpoint_enabled = true
}

