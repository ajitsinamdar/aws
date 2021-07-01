variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
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