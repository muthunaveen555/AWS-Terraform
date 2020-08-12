resource "aws_eip" "nat-eip" {
  vpc = true
}