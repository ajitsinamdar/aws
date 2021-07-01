common_tags = {
  "Environment" : "Development"
  "Created from" : "Terraform"
  "Created on" : "12-06-2021"
  "Updated on" : "16-06-2021"
  "Created by" : "Ajit Inamdar"
}

rds_mysql_db_subnet_group_tags = {
  "Name" : "dev-db-subnet-group"
}
rds_mysql_db_subnet_group_name        = "dev-db-subnet-group"
rds_mysql_db_subnet_group_name_prefix = "demo"
rds_mysql_db_subnet_group_description = "DB subnet group - Created from Terraform"

rds_mysql_db_parameter_group_name        = "dev-db-parameter-group"
rds_mysql_db_parameter_group_name_prefix = "demo"
rds_mysql_db_parameter_group_description = "Parameter subnet group - Created from Terraform"
rds_mysql_db_parameter_group_family      = "mysql5.7"
rds_mysql_db_parameter_group_tags = {
  "Name" : "dev-db-parameter-group"
}
rds_mysql_db_parameters = [
  {
    "name" : "autocommit"
    "value" : "0"
  },
  {
    "name" : "auto_increment_increment"
    "value" : "1"
  }
]

rds_mysql_db_instance_tags = {
  "Name" : "dev-db-instance-1"
}

rds_mysql_db_allocated_storage          = "10"
rds_mysql_db_engine                     = "mysql"
rds_mysql_db_engine_version             = "5.7"
rds_mysql_db_instance_class             = "db.t3.micro"
rds_mysql_db_name                       = "mydb"
rds_mysql_db_identifier                 = "mysql-rds-db-1"
rds_mysql_db_username                   = "foo"
rds_mysql_db_skip_final_snapshot        = "false"
rds_mysql_db_final_snapshot_identifier  = "mysql-rds-db-1-28062021"
rds_mysql_db_security_group_name        = "mysql-rds-db-sg-1"
rds_mysql_db_security_group_description = "mysql-rds-db-sg-1"
