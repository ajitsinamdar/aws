variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "rds_mysql_db_subnet_group_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "rds_mysql_db_subnet_group_name" {
  description = "A name prefix for db subnet group"
  type        = string
  default     = "default"
}

variable "rds_mysql_db_subnet_group_name_prefix" {
  description = "A name prefix for db subnet group"
  type        = string
  default     = "default"
}

variable "rds_mysql_db_subnet_group_description" {
  description = "A description for db subnet group"
  type        = string
  default     = "default"
}

variable "rds_mysql_db_subnet_ids" {
  description = "Subnet IDs for the subnet groups"
  default     = []
  type        = list(string)
}

variable "rds_mysql_db_parameter_group_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "rds_mysql_db_parameter_group_name" {
  description = "A name prefix for db parameter group"
  type        = string
  default     = "default"
}

variable "rds_mysql_db_parameter_group_name_prefix" {
  description = "A name prefix for db parameter group"
  type        = string
  default     = "default"
}

variable "rds_mysql_db_parameter_group_description" {
  description = "A description for db parameter group"
  type        = string
  default     = "default"
}

variable "rds_mysql_db_parameter_group_family" {
  description = "A family for db parameter group"
  type        = string
  default     = "default"
}

variable "rds_mysql_db_parameters" {
  description = "A list of DB parameters (map) to apply"
  type        = list(map(string))
  default     = []
}


variable "rds_mysql_db_allocated_storage" {
  description = "Allocated storage value"
  type        = string
  default     = "10"
}

variable "rds_mysql_db_engine" {
  description = "DB Engine"
  type        = string
  default     = "mysql"
}

variable "rds_mysql_db_engine_version" {
  description = "DB engine version"
  type        = string
  default     = "5.7"
}

variable "rds_mysql_db_instance_class" {
  description = "DB instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_mysql_db_name" {
  description = "MySQL database name"
  type        = string
  default     = "mydb"
}

variable "rds_mysql_db_identifier" {
  description = "RDS Identifier name"
  type        = string
  default     = "mydb"
}

variable "rds_mysql_db_username" {
  description = "DB username"
  type        = string
  default     = "foo"
}

variable "rds_mysql_db_skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = string
  default     = "true"
}

variable "rds_mysql_db_final_snapshot_identifier" {
  description = "final snapshot identifier"
  type        = string
  default     = "true"
}

variable "rds_mysql_db_instance_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "rds_mysql_db_vpc_id" {
  description = "VPC id"
  type        = string
  default     = "default"
}

variable "rds_mysql_db_security_group_name" {
  description = "Security group name"
  type        = string
  default     = "default"
}

variable "rds_mysql_db_security_group_description" {
  description = "Security group description"
  type        = string
  default     = "default"
}