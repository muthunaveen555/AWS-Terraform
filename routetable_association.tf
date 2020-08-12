resource "aws_route_table_association" "public-sub1" {
  subnet_id      = aws_subnet.public-sub1.id
  route_table_id = aws_route_table.public-route.id
}

resource "aws_route_table_association" "public-sub2" {
  subnet_id      = aws_subnet.public-sub2.id
  route_table_id = aws_route_table.public-route.id
}

resource "aws_route_table_association" "private-sub1" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private-route.id
}

resource "aws_route_table_association" "private-sub2" {
  subnet_id      = aws_subnet.private-sub2.id
  route_table_id = aws_route_table.private-route.id
}