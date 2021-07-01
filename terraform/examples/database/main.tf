data "terraform_remote_state" "dev_network_terraform_tfstate" {

  backend = "s3"

  config = {
    bucket = "terraform-backend-s3-bucket-name"
    key    = "path-to-key"
    region = "us-east-2"
  }
}

module "rds-mysql-db-subnet-group-dev" {
  source                                = "../../modules/database/rds-mysql/db_subnet_group"
  rds_mysql_db_subnet_group_name        = var.rds_mysql_db_subnet_group_name
  rds_mysql_db_subnet_group_name_prefix = var.rds_mysql_db_subnet_group_name_prefix
  rds_mysql_db_subnet_group_description = var.rds_mysql_db_subnet_group_description
  rds_mysql_db_subnet_ids               = data.terraform_remote_state.dev_network_terraform_tfstate.outputs.private_subnet_db_id
  rds_mysql_db_subnet_group_tags        = var.rds_mysql_db_subnet_group_tags
  common_tags                           = var.common_tags
}

module "rds-mysql-db-parameter-group-dev" {
  source                                   = "../../modules/database/rds-mysql/db_parameter_group"
  rds_mysql_db_parameter_group_name        = var.rds_mysql_db_parameter_group_name
  rds_mysql_db_parameter_group_name_prefix = var.rds_mysql_db_parameter_group_name_prefix
  rds_mysql_db_parameter_group_description = var.rds_mysql_db_parameter_group_description
  rds_mysql_db_parameter_group_family      = var.rds_mysql_db_parameter_group_family
  rds_mysql_db_parameter_group_tags        = var.rds_mysql_db_parameter_group_tags
  rds_mysql_db_parameters                  = var.rds_mysql_db_parameters
  common_tags                              = var.common_tags
  depends_on                               = [module.rds-mysql-db-subnet-group-dev]
}

module "rds-mysql-db-instance" {
  source                                  = "../../modules/database/rds-mysql/db_instance"
  common_tags                             = var.common_tags
  rds_mysql_db_instance_tags              = var.rds_mysql_db_instance_tags
  rds_mysql_db_allocated_storage          = var.rds_mysql_db_allocated_storage
  rds_mysql_db_engine                     = var.rds_mysql_db_engine
  rds_mysql_db_engine_version             = var.rds_mysql_db_engine_version
  rds_mysql_db_instance_class             = var.rds_mysql_db_instance_class
  rds_mysql_db_name                       = var.rds_mysql_db_name
  rds_mysql_db_identifier                 = var.rds_mysql_db_identifier
  rds_mysql_db_username                   = var.rds_mysql_db_username
  rds_mysql_db_parameter_group_name       = var.rds_mysql_db_parameter_group_name
  rds_mysql_db_skip_final_snapshot        = var.rds_mysql_db_skip_final_snapshot
  rds_mysql_db_final_snapshot_identifier  = var.rds_mysql_db_final_snapshot_identifier
  rds_mysql_db_subnet_group_name          = var.rds_mysql_db_subnet_group_name
  rds_mysql_db_vpc_id                     = data.terraform_remote_state.dev_network_terraform_tfstate.outputs.vpc_id
  rds_mysql_db_security_group_description = var.rds_mysql_db_security_group_description
  rds_mysql_db_security_group_name        = var.rds_mysql_db_security_group_name
  depends_on                              = [module.rds-mysql-db-parameter-group-dev]

}
