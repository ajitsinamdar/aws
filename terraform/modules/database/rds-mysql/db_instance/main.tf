# ===================== RDS MySQL ===================== #

# Random string to use as master password
resource "random_password" "master_password" {

  length  = 16
  special = false
}

resource "aws_security_group" "db_instance_security_group" {
  name        = var.rds_mysql_db_security_group_name
  description = var.rds_mysql_db_security_group_description
  vpc_id      = var.rds_mysql_db_vpc_id

  tags = merge(
    var.rds_mysql_db_instance_tags,
    var.common_tags
  )
}

resource "aws_db_instance" "db_instance" {
  identifier           = var.rds_mysql_db_identifier
  allocated_storage    = var.rds_mysql_db_allocated_storage
  engine               = var.rds_mysql_db_engine
  engine_version       = var.rds_mysql_db_engine_version
  instance_class       = var.rds_mysql_db_instance_class
  name                 = var.rds_mysql_db_name
  username             = var.rds_mysql_db_username
  password             = random_password.master_password.result
  parameter_group_name = var.rds_mysql_db_parameter_group_name
  skip_final_snapshot  = var.rds_mysql_db_skip_final_snapshot
  final_snapshot_identifier  = var.rds_mysql_db_final_snapshot_identifier
  db_subnet_group_name = var.rds_mysql_db_subnet_group_name
  vpc_security_group_ids = [aws_security_group.db_instance_security_group.id]
  tags = merge(
    var.rds_mysql_db_instance_tags,
    var.common_tags
  )
}
