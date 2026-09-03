output "db_instance_arn" {
  value       = module.mariadb.db_instance_arn
  description = "The ARN of the RDS instance"
}

output "db_instance_availability_zone" {
  value       = module.mariadb.db_instance_availability_zone
  description = "The availability zone of the RDS instance"
}

output "db_instance_endpoint" {
  value       = module.mariadb.db_instance_endpoint
  description = "The connection endpoint"
}

output "db_instance_engine" {
  value       = module.mariadb.db_instance_engine
  description = "The database engine"
}

output "db_instance_id" {
  value       = module.mariadb.db_instance_id
  description = "The RDS instance ID"
}

output "db_instance_resource_id" {
  value       = module.mariadb.db_instance_resource_id
  description = "The resource ID of the MariaDB instance."
}

output "db_instance_status" {
  value       = module.mariadb.db_instance_status
  description = "The current status of the MariaDB instance (e.g., available, creating)."
}

output "db_instance_name" {
  value       = module.mariadb.db_instance_name
  description = "The name of the MariaDB instance."
}

output "db_instance_username" {
  value       = module.mariadb.db_instance_username
  description = "The username for the MariaDB instance."
  sensitive = true
}

output "db_instance_port" {
  value       = module.mariadb.db_instance_port
  description = "The port number used to connect to the MariaDB instance."
}

output "db_instance_ca_cert_identifier" {
  value       = module.mariadb.db_instance_ca_cert_identifier
  description = "The CA certificate identifier for the MariaDB instance."
}

output "db_instance_domain" {
  value       = module.mariadb.db_instance_domain
  description = "The Active Directory domain associated with the MariaDB instance, if applicable."
}

output "db_instance_domain_iam_role_name" {
  value       = module.mariadb.db_instance_domain_iam_role_name
  description = "The IAM role name used for managing Active Directory domain integration for the MariaDB instance."
}

output "db_instance_cloudwatch_log_groups" {
  value       = module.mariadb.db_instance_cloudwatch_log_groups
  description = "The CloudWatch log groups associated with the MariaDB instance."
}

output "db_parameter_group_id" {
  value       = module.mariadb.db_parameter_group_id
  description = "The ID of the parameter group used by the MariaDB instance."
}

output "db_parameter_group_arn" {
  value       = module.mariadb.ssm_parameter_arn
  description = "The ARN of the parameter group used by the MariaDB instance."
}

output "db_subnet_group_id" {
  value       = module.mariadb.db_subnet_group_id
  description = "The ID of the subnet group associated with the MariaDB instance."
}

output "db_subnet_group_name" {
  value       = module.mariadb.db_subnet_group_name
  description = "The name of the subnet group associated with the MariaDB instance."
}

output "kms_key_arn" {
  value       = module.mariadb.kms_key_arn
  description = "The ARN of the KMS key used for encrypting the MariaDB instance storage."
}

output "kms_key_id" {
  value       = module.mariadb.kms_key_id
  description = "The ID of the KMS key used for encrypting the MariaDB instance storage."
}

output "kms_key_policy" {
  value       = module.mariadb.kms_key_policy
  description = "The policy document associated with the KMS key used for the MariaDB instance."
}

output "kms_key_rotation_enabled" {
  value       = module.mariadb.kms_key_rotation_enabled
  description = "Indicates whether key rotation is enabled for the KMS key used by the MariaDB instance."
}

output "kms_key_multi_region" {
  value       = module.mariadb.kms_key_multi_region
  description = "Indicates whether the KMS key used for the MariaDB instance is multi-region."
}

output "ssm_parameter_name" {
  value       = module.mariadb.ssm_parameter_name
  description = "The name of the SSM parameter associated with the MariaDB instance."
}

output "ssm_parameter_arn" {
  value       = module.mariadb.ssm_parameter_arn
  description = "The ARN of the SSM parameter associated with the MariaDB instance."
}