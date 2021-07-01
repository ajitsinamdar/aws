resource "aws_db_parameter_group" "db_parameter_group" {
  name        = var.rds_mysql_db_parameter_group_name
  #name_prefix = var.rds_mysql_db_parameter_group_name_prefix
  description = var.rds_mysql_db_parameter_group_description
  family      = var.rds_mysql_db_parameter_group_family

  dynamic "parameter" {
    for_each = var.rds_mysql_db_parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }

  tags = merge(
    var.rds_mysql_db_parameter_group_tags,
    var.common_tags
  )

  lifecycle {
    create_before_destroy = true
  }
}