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
  source              = "cypik/subnet/aws"
  version             = "1.0.1"
  name                = "subnets"
  environment         = "test"
  label_order         = ["name", "environment"]
  nat_gateway_enabled = true
  availability_zones  = ["eu-west-1a", "eu-west-1b"]
  vpc_id              = module.vpc.id
  type                = "public-private"
  igw_id              = module.vpc.igw_id
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  #  assign_ipv6_address_on_creation = false
}

module "oracle" {
  source = "../../"

  name        = "oracle"
  environment = "test"
  label_order = ["environment", "name"]

  engine            = "oracle-ee"
  engine_version    = "19"
  instance_class    = "db.t3.medium"
  engine_name       = "oracle-ee"
  allocated_storage = 50
  storage_encrypted = true
  family            = "oracle-ee-19"

  db_name  = "test"
  username = "admin"
  password = "esfsgcGdfawAhdxtfjm!"
  port     = "1521"

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  multi_az           = false


  vpc_id        = module.vpc.id
  allowed_ip    = [module.vpc.vpc_cidr_block]
  allowed_ports = [1521]

  backup_retention_period = 0

  enabled_cloudwatch_logs_exports = ["audit"]

  subnet_ids          = module.private_subnets.public_subnet_id
  publicly_accessible = true

  major_engine_version = "19"

  deletion_protection                 = true
  iam_database_authentication_enabled = false

  ssm_parameter_endpoint_enabled = true

}