AWS VPC Terraform Module:
-------------------------

Usage
-----
```
module "vpc-dev" {
  source             = "../../modules/network/vpc"
  common_tags        = var.common_tags
  vpc_cidr           = var.vpc_cidr
  vpc_tags           = var.vpc_tags
  availability_zones = var.availability_zones
  # ===================== Web Subnets ===================== #

  public_cidr_subnet_web = var.public_cidr_subnet_web
  public_subnet_web_tags = var.public_subnet_web_tags
  public_subnet_web_tag_name = var.public_subnet_web_tag_name

  
  # ===================== App Subnets ===================== #

  private_cidr_subnet_app = var.private_cidr_subnet_app
  private_subnet_app_tags = var.private_subnet_app_tags
  private_subnet_app_tag_name = var.private_subnet_app_tag_name

  
  # ===================== DB Subnets ===================== #

  private_cidr_subnet_db = var.private_cidr_subnet_db
  private_subnet_db_tags = var.private_subnet_db_tags
  private_subnet_db_tag_name = var.private_subnet_db_tag_name

  # ===================== Internet Gateway ===================== #
  igw_tags = var.igw_tags

  # ===================== NAT Gateway ===================== #
  natgweip_tags = var.natgweip_tags
  natgw_tags    = var.natgw_tags

  # ===================== Route tables ===================== #

  public_web_rt_tags  = var.public_web_rt_tags
  private_app_rt_tags = var.private_app_rt_tags
  private_db_rt_tags  = var.private_db_rt_tags
}
```

AWS RDS MySQL Terraform Module:
-------------------------------

```
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
```