data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  az_count    = length(data.aws_availability_zones.available.names)
  subnet_type = ["public", "private"]
  bits        = ceil(log(local.az_count * length(local.subnet_type), 2))

  subnets_cidr_blocks = {
    for i, name in local.subnet_type :
    "${name}" => [
      for subnet_num in range(i * local.az_count, (i + 1) * local.az_count) :
      cidrsubnet(var.cidr_block, local.bits, subnet_num)
    ]
  }
}

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

  tags = {
    "Name" = "igorgrishko"
  }
}

resource "aws_subnet" "public" {
  count             = local.az_count
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = local.subnets_cidr_blocks.public[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    "Name" = "igorgrishko-public-${data.aws_availability_zones.available.names[count.index]}"
  }
}

resource "aws_subnet" "private" {
  count             = local.az_count
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = local.subnets_cidr_blocks.private[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    "Name" = "igorgrishko-private-${data.aws_availability_zones.available.names[count.index]}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "igorgrishko"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    "Name" = "igorgrishko"
  }
}

resource "aws_route_table_association" "public" {
  count          = local.az_count
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id # nat gw
  }

  tags = {
    "Name" = "igorgrishko"
  }
}

resource "aws_route_table_association" "private" {
  count          = local.az_count
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "public" {
  name   = "igorgrishko-public-group"
  vpc_id = aws_vpc.vpc.id
}

resource "aws_security_group" "private" {
  name   = "igorgrishko-private-group"
  vpc_id = aws_vpc.vpc.id
}

resource "aws_security_group_rule" "SSH_in_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "SSH_in_private" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private.id
}

resource "aws_security_group_rule" "HTTP_in" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "all_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}
