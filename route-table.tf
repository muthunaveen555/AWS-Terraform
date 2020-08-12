resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }

  tags = {
    Name = "public-route"
  }
}

resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main-ngw.id 
  }

  tags = {
    Name = "nat-route"
  }
}