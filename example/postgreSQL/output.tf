output "db_instance_address" {
  value       = module.postgresql.db_instance_address
  description = "The address of the RDS instance"
}

output "db_instance_arn" {
  value       = module.postgresql.db_instance_arn
  description = "The ARN of the RDS instance"
}

output "db_instance_availability_zone" {
  value       = module.postgresql.db_instance_availability_zone
  description = "The availability zone of the RDS instance"
}

output "db_instance_endpoint" {
  value       = module.postgresql.db_instance_endpoint
  description = "The connection endpoint"
}

output "db_instance_engine" {
  value       = module.postgresql.db_instance_engine
  description = "The database engine"
}

output "db_instance_hosted_zone_id" {
  value       = module.postgresql.db_instance_hosted_zone_id
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
}

output "db_instance_id" {
  value       = module.postgresql.db_instance_id
  description = "The RDS instance ID"
}

output "db_instance_resource_id" {
  value       = module.postgresql.db_instance_resource_id
  description = "The RDS Resource ID of this instance"
}
output "db_instance_status" {
  value       = module.postgresql.db_instance_status
  description = "The current status of the RDS DB instance."
}

output "db_instance_name" {
  value       = module.postgresql.db_instance_name
  description = "The name of the RDS DB instance."
}

output "db_instance_username" {
  value       = module.postgresql.db_instance_username
  description = "The master username used for connecting to the RDS DB instance."
  sensitive = true
}

output "db_instance_port" {
  value       = module.postgresql.db_instance_port
  description = "The port on which the RDS DB instance is accepting connections."
}

output "db_instance_ca_cert_identifier" {
  value       = module.postgresql.db_instance_ca_cert_identifier
  description = "The CA certificate identifier used for the RDS DB instance."
}

output "db_instance_domain" {
  value       = module.postgresql.db_instance_domain
  description = "The domain name associated with the RDS DB instance, if applicable."
}

output "db_instance_domain_iam_role_name" {
  value       = module.postgresql.db_instance_domain_iam_role_name
  description = "The IAM role name associated with the domain of the RDS DB instance, if applicable."
}

output "db_instance_cloudwatch_log_groups" {
  value       = module.postgresql.db_instance_cloudwatch_log_groups
  description = "The list of CloudWatch log groups associated with the RDS DB instance."
}

output "db_parameter_group_id" {
  value       = module.postgresql.db_parameter_group_id
  description = "The ID of the DB parameter group associated with the RDS DB instance."
}

output "db_parameter_group_arn" {
  value       = module.postgresql.ssm_parameter_arn
  description = "The ARN of the DB parameter group associated with the RDS DB instance."
}

output "db_subnet_group_id" {
  value       = module.postgresql.db_subnet_group_id
  description = "The ID of the DB subnet group associated with the RDS DB instance."
}

output "db_subnet_group_name" {
  value       = module.postgresql.db_subnet_group_name
  description = "The name of the DB subnet group associated with the RDS DB instance."
}

output "kms_key_arn" {
  value       = module.postgresql.kms_key_arn
  description = "The ARN of the KMS key used to encrypt the RDS DB instance."
}

output "kms_key_id" {
  value       = module.postgresql.kms_key_id
  description = "The ID of the KMS key used to encrypt the RDS DB instance."
}

output "kms_key_policy" {
  value       = module.postgresql.kms_key_policy
  description = "The policy document of the KMS key used for encryption."
}

output "kms_key_rotation_enabled" {
  value       = module.postgresql.kms_key_rotation_enabled
  description = "Indicates whether KMS key rotation is enabled for the RDS DB instance."
}

output "kms_key_multi_region" {
  value       = module.postgresql.kms_key_multi_region
  description = "Indicates whether the KMS key is multi-region for the RDS DB instance."
}

output "ssm_parameter_name" {
  value       = module.postgresql.ssm_parameter_name
  description = "The name of the SSM parameter that stores the DB connection details."
}

output "ssm_parameter_arn" {
  value       = module.postgresql.ssm_parameter_arn
  description = "The ARN of the SSM parameter that stores the DB connection details."
}