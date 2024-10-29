resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets_cidrs)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnets_cidrs[count.index]
  availability_zone = element(var.subnets_azs, count.index)

  tags = {
    Name = "priv-subnet-${count.index}"
  }
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets_cidrs)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnets_cidrs[count.index]
  availability_zone = element(var.subnets_azs, count.index)

  tags = {
    Name = "public-subnet-${count.index}"
  }
}
