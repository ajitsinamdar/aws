variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "availability_zones" {
  description = "AZs in this region to use"
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
  type        = list(string)
}

variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}
variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}
variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_classiclink" {
  description = "Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = null
}

variable "enable_classiclink_dns_support" {
  description = "Should be true to enable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = null
}
variable "enable_ipv6" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block."
  type        = bool
  default     = false
}
variable "vpc_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

# ===================== Web Subnets ===================== #

variable "public_cidr_subnet_web" {
  description = "Subnet CIDRs for public subnets (length must match configured availability_zones)"
  default = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]
  type    = list(string)
}

variable "public_subnet_web_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "public_subnet_web_tag_name" {
  description = "Name tag for the public web subnet"
  type        = string
  default     = "public_subnet_web"
}

# ===================== App Subnets ===================== #

variable "private_cidr_subnet_app" {
  description = "Subnet CIDRs for private subnets (length must match configured availability_zones)"
  default = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"]
  type    = list(string)
}

variable "private_subnet_app_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "private_subnet_app_tag_name" {
  description = "Name tag for the private app subnet"
  type        = string
  default     = "private_subnet_app"
}

# ===================== DB Subnets ===================== #

variable "private_cidr_subnet_db" {
  description = "Subnet CIDRs for private subnets (length must match configured availability_zones)"
  default = ["172.20.7.0/24", "172.20.8.0/24", "172.20.9.0/24"]
  type    = list(string)
}

variable "private_subnet_db_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "private_subnet_db_tag_name" {
  description = "Name tag for the private db subnet"
  type        = string
  default     = "private_subnet_db"
}

# ===================== Internet Gateway ===================== #

variable "igw_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

# ===================== NAT Gateway ===================== #

variable "natgweip_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "natgw_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

# ===================== Route tables ===================== #

variable "public_web_rt_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "private_app_rt_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "private_db_rt_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
