resource "aws_nat_gateway" "main-ngw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public-sub1.id
  depends_on = [aws_internet_gateway.main-igw]
  tags = {
    Name = "my-NAT-gateway"
  }
}