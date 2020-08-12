resource "aws_vpc" "main-vpc" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "nava-vpc-terraformed"
  }
}