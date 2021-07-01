#Outputs.tf
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc-dev.vpc_id
}

output "public_subnet_web_id" {
  description = "The ID of the public web subnets"
  value       = module.vpc-dev.public_subnet_web_id
}

output "private_subnet_app_id" {
  description = "The ID of the private app subnets"
  value       = module.vpc-dev.private_subnet_app_id
}

output "private_subnet_db_id" {
  description = "The ID of the private app subnets"
  value       = module.vpc-dev.private_subnet_db_id
}
