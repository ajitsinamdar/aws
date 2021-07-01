resource "aws_db_subnet_group" "db_subnet_group" {
  name        = var.rds_mysql_db_subnet_group_name
  #name_prefix = var.rds_mysql_db_subnet_group_name_prefix
  description = var.rds_mysql_db_subnet_group_description
  subnet_ids  = var.rds_mysql_db_subnet_ids

  tags = merge(
    var.rds_mysql_db_subnet_group_tags,
    var.common_tags
  )
}