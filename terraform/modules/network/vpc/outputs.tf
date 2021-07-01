
#Outputs

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}
output "public_subnet_web_id" {
  description = "The ID of the public web subnets"
  value       = aws_subnet.public_subnet_web.*.id
}

output "private_subnet_app_id" {
  description = "The ID of the private app subnets"
  value       = aws_subnet.private_subnet_app.*.id
}

output "private_subnet_db_id" {
  description = "The ID of the private db subnets"
  value       = aws_subnet.private_subnet_db.*.id
}

