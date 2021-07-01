# ===================== VPC ===================== #

resource "aws_vpc" "vpc" {
  cidr_block                       = var.vpc_cidr
  instance_tenancy                 = var.instance_tenancy
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = var.enable_ipv6
  tags = merge(
    var.vpc_tags,
    var.common_tags
  )
}

# ===================== Web Subnets ===================== #

resource "aws_subnet" "public_subnet_web" {
  count             = length(var.public_cidr_subnet_web)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_cidr_subnet_web[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = merge(
    {
      Name = "${var.public_subnet_web_tag_name}-${count.index}",
    },
    var.public_subnet_web_tags,
    var.common_tags
  )
}

# ===================== App Subnets ===================== #

resource "aws_subnet" "private_subnet_app" {
  count             = length(var.private_cidr_subnet_app)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_cidr_subnet_app[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = merge(
    {
      Name = "${var.private_subnet_app_tag_name}-${count.index}",
    },
    var.private_subnet_app_tags,
    var.common_tags
  )
}

# ===================== DB Subnets ===================== #

resource "aws_subnet" "private_subnet_db" {
  count             = length(var.private_cidr_subnet_db)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_cidr_subnet_db[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = merge(
    {
      Name = "${var.private_subnet_db_tag_name}-${count.index}",
    },
    var.private_subnet_db_tags,
    var.common_tags
  )
}


# ===================== Internet Gateway ===================== #

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.igw_tags,
    var.common_tags
  )
}

# ===================== NAT Gateway ===================== #

resource "aws_eip" "natgweip" {
  vpc = true
  tags = merge(
    var.natgweip_tags,
    var.common_tags
  )
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.natgweip.id
  subnet_id     = aws_subnet.public_subnet_web[0].id
  tags = merge(
    var.natgw_tags,
    var.common_tags
  )
  depends_on = [aws_internet_gateway.igw]

}

# ===================== Route tables and association ===================== #

resource "aws_route_table" "public_web_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.public_web_rt_tags,
    var.common_tags
  )
}

resource "aws_route_table_association" "public_web_rt_assoc" {
  count          = length(var.public_cidr_subnet_web)
  subnet_id      = element(aws_subnet.public_subnet_web.*.id, count.index)
  route_table_id = aws_route_table.public_web_rt.id
}

resource "aws_route_table" "private_app_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.private_app_rt_tags,
    var.common_tags
  )
}

resource "aws_route_table_association" "private_app_rt_assoc" {
  count          = length(var.private_cidr_subnet_app)
  subnet_id      = element(aws_subnet.private_subnet_app.*.id, count.index)
  route_table_id = aws_route_table.private_app_rt.id
}

resource "aws_route_table" "private_db_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.private_db_rt_tags,
    var.common_tags
  )
}

resource "aws_route_table_association" "private_db_rt_assoc" {
  count          = length(var.private_cidr_subnet_db)
  subnet_id      = element(aws_subnet.private_subnet_db.*.id, count.index)
  route_table_id = aws_route_table.private_db_rt.id
}

# ===================== Routes ===================== #

resource "aws_route" "public_web_routes" {
  route_table_id         = aws_route_table.public_web_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

  timeouts {
    create = "5m"
  }
}

resource "aws_route" "private_app_routes" {
  route_table_id         = aws_route_table.private_app_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.natgw.id
  timeouts {
    create = "5m"
  }
}

resource "aws_route" "private_db_routes" {
  route_table_id         = aws_route_table.private_db_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.natgw.id
  timeouts {
    create = "5m"
  }
}
