terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

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
