resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public_subnets
  ]

  tags = {
    Name = "ans-01-internet-gateway"
  }
}
