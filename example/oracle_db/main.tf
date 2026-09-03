provider "aws" {
  region = "eu-west-2"
}

module "vpc" {
  source      = "cypik/vpc/aws"
  version     = "1.0.5"
  name        = "vpc"
  environment = "test"
  label_order = ["environment", "name"]

  cidr_block = "10.0.0.0/16"
}

module "private_subnets" {
  source              = "cypik/subnet/aws"
  version             = "1.0.7"
  name                = "subnets"
  environment         = "test"
  label_order         = ["name", "environment"]
  nat_gateway_enabled = true
  availability_zones  = ["eu-west-2a", "eu-west-2b"]
  vpc_id              = module.vpc.vpc_id
  type                = "public-private"
  igw_id              = module.vpc.igw_id
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  #  assign_ipv6_address_on_creation = false
}

module "oracle" {
  source = "../../"

  name              = "oracle"
  environment       = "test"
  label_order       = ["environment", "name"]
  engine            = "oracle-ee-cdb"
  engine_name       = "oracle-ee-cdb"
  engine_version    = "19.0.0.0.ru-2025-01.rur-2025-01.r1"
  instance_class    = "db.m5.large"
  allocated_storage = 16
  storage_encrypted = true

  db_name  = "test"
  username = "admin"
  password = "esfsgcGdfawAhdxtfjm!"
  port     = "1521"

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  multi_az           = false

  vpc_id        = module.vpc.vpc_id
  allowed_ip    = [module.vpc.vpc_cidr_block]
  allowed_ports = [1521]

  backup_retention_period = 0

  enabled_cloudwatch_logs_exports = ["audit"]

  subnet_ids          = module.private_subnets.public_subnet_id
  publicly_accessible = true

  major_engine_version                = "19"
  family                              = "oracle-ee-cdb-19"
  deletion_protection                 = true
  iam_database_authentication_enabled = false
  ssm_parameter_endpoint_enabled      = true
}
