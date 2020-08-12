resource "aws_subnet" "public-sub1" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.1.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public-sub2" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "private-sub1" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.1.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private-sub2" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.1.3.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "private-subnet-2"
  }
}