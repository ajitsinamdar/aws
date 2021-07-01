common_tags = {
  "Environment" : "Development"
  "Created from" : "Terraform"
  "Created on" : "12-06-2021"
  "Updated on" : "16-06-2021"
  "Created by"  : "Ajit Inamdar"
}
availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
vpc_cidr = "172.20.0.0/20"
vpc_tags = {
  "Name" : "dev-vpc"
}

# ===================== Web Subnets ===================== #

public_cidr_subnet_web = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]
public_subnet_web_tag_name = "dev-public-subnet-web"
public_subnet_web_tags = {
  "Resource type" : "Subnets"
}

# ===================== App Subnets ===================== #

private_cidr_subnet_app = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"]
private_subnet_app_tag_name = "dev-private-subnet-app"
private_subnet_app_tags = {
  "Resource type" : "Subnets"
}

# ===================== DB Subnets ===================== #

private_cidr_subnet_db = ["172.20.7.0/24", "172.20.8.0/24", "172.20.9.0/24"]
private_subnet_db_tag_name = "dev-private-subnet-db"
private_subnet_db_tags = {
  "Resource type" : "Subnets"
}
# ===================== Internet Gateway ===================== #

igw_tags = {
  "Name" : "dev-igw"
}

# ===================== NAT Gateway ===================== #

natgweip_tags = {
  "Name" : "dev-natgweip"
}
natgw_tags = {
  "Name" : "dev-natgw"
}

# ===================== Route tables ===================== #

public_web_rt_tags = {
  "Name" : "dev-public_web_rt"
}

private_app_rt_tags = {
  "Name" : "dev-private_app_rt"
}

private_db_rt_tags = {
  "Name" : "dev-private_db_rt"
}