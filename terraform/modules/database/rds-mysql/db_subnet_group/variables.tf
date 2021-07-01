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
  default = []
  type    = list(string)
}