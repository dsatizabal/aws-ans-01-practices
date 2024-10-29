resource "aws_nat_gateway" "ngwy" {
  allocation_id = aws_eip.ngwy-eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "ngw-tf"
  }

  depends_on = [
    aws_eip.ngwy-eip
  ]
}
