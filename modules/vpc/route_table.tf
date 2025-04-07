resource "aws_route_table" "public_secondary_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  depends_on = [
    aws_internet_gateway.igw,
    aws_nat_gateway.ngwy
  ]

  tags = {
    Name = "ans-01-public-econdary-rt"
  }
}

resource "aws_route_table_association" "public_subnets_assoc" {
  count = length(var.public_subnets_cidrs)

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_secondary_rt.id

  depends_on = [
    aws_route_table.public_secondary_rt
  ]
}

resource "aws_route_table" "private_secondary_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngwy.id
  }

  depends_on = [
    aws_internet_gateway.igw,
    aws_nat_gateway.ngwy
  ]

  tags = {
    Name = "ans-01-private-secondary-rt"
  }
}

resource "aws_route_table_association" "private_subnets_assoc" {
  count = length(var.public_subnets_cidrs)

  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_secondary_rt.id

  depends_on = [
    aws_route_table.private_secondary_rt
  ]
}
