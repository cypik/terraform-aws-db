output "enhanced_monitoring_iam_role_name" {
  value       = try(aws_iam_role.enhanced_monitoring[0].name, "")
  description = "The name of the monitoring role"
}

output "enhanced_monitoring_iam_role_arn" {
  value       = try(aws_iam_role.enhanced_monitoring[0].arn, "")
  description = "The Amazon Resource Name (ARN) specifying the monitoring role"
}

output "db_instance_address" {
  value       = try(aws_db_instance.this[0].address, "")
  description = "The address of the RDS instance"
}

output "db_instance_arn" {
  value       = try(aws_db_instance.this[0].arn, "")
  description = "The ARN of the RDS instance"
}

output "db_instance_availability_zone" {
  value       = try(aws_db_instance.this[0].availability_zone, "")
  description = "The availability zone of the RDS instance"
}

output "db_instance_endpoint" {
  value       = try(aws_db_instance.this[0].endpoint, "")
  description = "The connection endpoint"
}

output "db_instance_engine" {
  value       = try(aws_db_instance.this[0].engine, "")
  description = "The database engine"
}

output "db_instance_hosted_zone_id" {
  value       = try(aws_db_instance.this[0].hosted_zone_id, "")
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
}

output "db_instance_id" {
  value       = try(aws_db_instance.this[0].id, "")
  description = "The RDS instance ID"
}

output "db_instance_resource_id" {
  value       = try(aws_db_instance.this[0].resource_id, "")
  description = "The RDS Resource ID of this instance"
}

output "db_instance_status" {
  value       = try(aws_db_instance.this[0].status, "")
  description = "The RDS instance status"
}

output "db_instance_name" {
  value       = try(aws_db_instance.this[0].db_name, "")
  description = "The database name"
}

output "db_instance_username" {
  value       = try(aws_db_instance.this[0].username, "")
  sensitive   = true
  description = "The master username for the database"
}

output "db_instance_port" {
  value       = try(aws_db_instance.this[0].port, "")
  description = "The port of the primary database instance"
}

output "db_instance_ca_cert_identifier" {
  value       = try(aws_db_instance.this[0].ca_cert_identifier, "")
  description = "Specifies the identifier of the CA certificate for the DB instance"
}

output "db_instance_domain" {
  value       = try(aws_db_instance.this[0].domain, "")
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
}

output "db_instance_domain_iam_role_name" {
  value       = try(aws_db_instance.this[0].domain_iam_role_name, "")
  description = "The name of the IAM role to be used when making API calls to the Directory Service. "
}

output "db_instance_password" {
  value       = try(aws_db_instance.this[0].password, "")
  sensitive   = true
  description = "The master password"
}

output "db_instance_cloudwatch_log_groups" {
  value       = aws_cloudwatch_log_group.this
  description = "Map of CloudWatch log groups created and their attributes"
}

output "db_parameter_group_id" {
  value       = aws_db_parameter_group.this[0].id
  description = "The ID of the RDS DB parameter group"
}



output "db_parameter_group_arn" {
  value       = length(aws_db_parameter_group.this) > 0 ? aws_db_parameter_group.this[0].arn : null
  description = "The ARN of the db parameter group"
}


output "db_subnet_group_id" {
  value       = try(aws_db_subnet_group.this[0].id, "")
  description = "The db subnet group name"
}

output "db_subnet_group_name" {
  value       = try(aws_db_subnet_group.this[0].name, "")
  description = "The db subnet group name"
}

output "kms_key_arn" {
  value       = aws_kms_key.default[0].arn
  description = "ARN of the created KMS key."
}

output "kms_key_id" {
  value       = aws_kms_key.default[0].id
  description = "ID of the created KMS key."
}

output "kms_key_policy" {
  value       = aws_kms_key.default[0].policy
  description = "Policy associated with the KMS key."
}

output "kms_key_rotation_enabled" {
  value       = aws_kms_key.default[0].enable_key_rotation
  description = "Indicates whether key rotation is enabled."
}

output "kms_key_multi_region" {
  value       = aws_kms_key.default[0].multi_region
  description = "Indicates whether the key is a multi-Region key."
}

output "ssm_parameter_name" {
  value       = aws_ssm_parameter.secret-endpoint[0].name
  description = "The name of the SSM parameter created."
}

output "ssm_parameter_arn" {
  value       = aws_ssm_parameter.secret-endpoint[0].arn
  description = "The ARN of the SSM parameter created."
}

output "ssm_parameter_value" {
  value       = aws_ssm_parameter.secret-endpoint[0].value
  sensitive   = true # Mark as sensitive to avoid exposing secrets in outputs
  description = "The value of the SSM parameter created."
}
