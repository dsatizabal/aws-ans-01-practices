resource "aws_eip" "ngwy-eip" {
  vpc = true

  depends_on = [
    aws_vpc.vpc
  ]
}
