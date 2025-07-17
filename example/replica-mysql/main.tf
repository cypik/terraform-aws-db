provider "aws" {
  region = "eu-west-2"
}

module "vpc" {
  source      = "cypik/vpc/aws"
  version     = "1.0.3"
  name        = "vpc"
  environment = "test"
  label_order = ["environment", "name"]

  cidr_block = "10.0.0.0/16"
}

module "subnets" {
  source      = "cypik/subnet/aws"
  version     = "1.0.3"
  name        = "subnets"
  environment = "test"
  label_order = ["environment", "name"]

  availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  vpc_id             = module.vpc.vpc_id
  type               = "public"
  igw_id             = module.vpc.igw_id
  cidr_block         = module.vpc.vpc_cidr_block
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}

module "mysql" {
  source                 = "../../"

  # Labels & Identification
  name                   = "rds"
  environment            = "test"
  label_order            = ["environment", "name"]
  identifier             = ""

  # RDS Engine
  engine                 = "mysql"
  engine_version         = "8.0.40"            # ✅ Valid full engine version
  major_engine_version   = "8.0"               # ✅ Only major version
  family                 = "mysql8.0"          # ✅ Must match engine major version

  # Instance Type
  instance_class         = "db.t4g.micro"
  replica_instance_class = "db.t4g.micro"
  enabled_read_replica   = true
  enabled_replica        = true

  # Storage
  allocated_storage      = 16
  kms_key_id             = ""

  # DB Credentials
  db_name                = "replica"
  username               = "replica_mysql"
  password               = "clkjvnsdikjhdsijfsdli"
  port                   = 3306

  # Networking
  vpc_id                 = module.vpc.vpc_id
  subnet_ids             = module.subnets.public_subnet_id
  allowed_ip             = [module.vpc.vpc_cidr_block]
  allowed_ports          = [3306]
  publicly_accessible    = false

  # Maintenance
  maintenance_window     = "Mon:00:00-Mon:03:00"
  backup_window          = "03:00-06:00"
  backup_retention_period = 1
  multi_az               = true
  auto_minor_version_upgrade = false

  # Logging & Monitoring
  enabled_cloudwatch_logs_exports = ["general"]
  ssm_parameter_endpoint_enabled  = true

  # Deletion protection
  deletion_protection    = true
}
