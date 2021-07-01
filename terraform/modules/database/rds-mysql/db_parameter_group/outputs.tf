
#Outputs

output "db_parameter_group_id" {
  description = "The db parameter group name"
  value       = aws_db_parameter_group.db_parameter_group.id
}

output "db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = aws_db_parameter_group.db_parameter_group.arn
}

