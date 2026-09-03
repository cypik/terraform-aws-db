output "db_instance_address" {
  value       = module.mysql.db_instance_address
  description = "The address of the RDS instance"
}

output "db_instance_arn" {
  value       = module.mysql.db_instance_arn
  description = "The ARN of the RDS instance"
}

output "db_instance_availability_zone" {
  value       = module.mysql.db_instance_availability_zone
  description = "The availability zone of the RDS instance"
}

output "db_instance_endpoint" {
  value       = module.mysql.db_instance_endpoint
  description = "The connection endpoint"
}

output "db_instance_engine" {
  value       = module.mysql.db_instance_engine
  description = "The database engine"
}

output "db_instance_hosted_zone_id" {
  value       = module.mysql.db_instance_hosted_zone_id
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
}

output "db_instance_id" {
  value       = module.mysql.db_instance_id
  description = "The RDS instance ID"
}

output "db_instance_resource_id" {
  value       = module.mysql.db_instance_resource_id
  description = "The RDS Resource ID of this instance"
}

output "db_instance_status" {
  value       = module.mysql.db_instance_status
  description = "The RDS instance status"
}

output "db_instance_name" {
  value       = module.mysql.db_instance_name
  description = "The database name"
}

output "db_instance_username" {
  value       = module.mysql.db_instance_username
  description = "The username for the MySQL database instance."
  sensitive = true
}

output "db_instance_port" {
  value       = module.mysql.db_instance_port
  description = "The port number on which the MySQL database instance is accessible."
}

output "db_instance_ca_cert_identifier" {
  value       = module.mysql.db_instance_ca_cert_identifier
  description = "The identifier of the CA certificate associated with the MySQL database instance."
}

output "db_instance_domain" {
  value       = module.mysql.db_instance_domain
  description = "The Active Directory domain associated with the MySQL database instance, if any."
}

output "db_instance_domain_iam_role_name" {
  value       = module.mysql.db_instance_domain_iam_role_name
  description = "The IAM role name used for directory authentication."
}

output "db_instance_cloudwatch_log_groups" {
  value       = module.mysql.db_instance_cloudwatch_log_groups
  description = "A list of CloudWatch log groups associated with the MySQL database instance."
}

output "db_parameter_group_id" {
  value       = module.mysql.db_parameter_group_id
  description = "The ID of the parameter group associated with the MySQL database instance."
}

output "db_parameter_group_arn" {
  value       = module.mysql.ssm_parameter_arn
  description = "The ARN of the parameter group for the MySQL database instance."
}

output "db_subnet_group_id" {
  value       = module.mysql.db_subnet_group_id
  description = "The ID of the DB subnet group for the MySQL database instance."
}

output "db_subnet_group_name" {
  value       = module.mysql.db_subnet_group_name
  description = "The name of the DB subnet group for the MySQL database instance."
}

output "kms_key_arn" {
  value       = module.mysql.kms_key_arn
  description = "The ARN of the KMS key used for encrypting the MySQL database instance."
}

output "kms_key_id" {
  value       = module.mysql.kms_key_id
  description = "The ID of the KMS key used for encrypting the MySQL database instance."
}

output "kms_key_policy" {
  value       = module.mysql.kms_key_policy
  description = "The policy document of the KMS key used for encryption."
}

output "kms_key_rotation_enabled" {
  value       = module.mysql.kms_key_rotation_enabled
  description = "Indicates whether key rotation is enabled for the KMS key."
}

output "kms_key_multi_region" {
  value       = module.mysql.kms_key_multi_region
  description = "Indicates whether the KMS key is a multi-region key."
}

output "ssm_parameter_name" {
  value       = module.mysql.ssm_parameter_name
  description = "The name of the SSM parameter storing database credentials."
}

output "ssm_parameter_arn" {
  value       = module.mysql.ssm_parameter_arn
  description = "The ARN of the SSM parameter storing database credentials."
}
