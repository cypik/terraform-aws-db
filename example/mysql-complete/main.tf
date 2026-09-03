provider "aws" {
  region = "eu-west-2"
}

module "vpc" {
  source      = "cypik/vpc/aws"
  version     = "1.0.5"
  name        = "vpc"
  environment = "test"
  label_order = ["environment", "name"]
  cidr_block  = "10.0.0.0/16"
}


module "subnets" {
  source             = "cypik/subnet/aws"
  version            = "1.0.7"
  name               = "subnets"
  environment        = "test"
  label_order        = ["environment", "name"]
  availability_zones = ["eu-west-2a", "eu-west-2b"]
  vpc_id             = module.vpc.vpc_id
  type               = "public"
  igw_id             = module.vpc.igw_id
  cidr_block         = module.vpc.vpc_cidr_block
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}

module "mysql" {
  source = "../../"

  name        = "mysql"
  environment = "test"
  label_order = ["environment", "name"]

  engine            = "mysql"
  engine_version    = "8.0.35"
  instance_class    = "db.t4g.micro"
  allocated_storage = 16
  vpc_id            = module.vpc.vpc_id
  allowed_ip        = [module.vpc.vpc_cidr_block]
  allowed_ports     = [3306]

  db_name  = "test"
  username = "user"
  password = "esfsgcGdfawAhdxtfjm!"
  port     = "3306"

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  multi_az           = false

  backup_retention_period = 7

  enabled_cloudwatch_logs_exports = ["audit", "general"]

  subnet_ids          = module.subnets.public_subnet_id
  publicly_accessible = true

  family = "mysql8.0"

  major_engine_version = "8.0"

  deletion_protection = true

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8"
    },
    {
      name  = "character_set_server"
      value = "utf8"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
  ssm_parameter_endpoint_enabled = true
}

