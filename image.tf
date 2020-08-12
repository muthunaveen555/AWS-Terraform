resource "aws_ami_from_instance" "my-image" {
  name               = "web-server"
  source_instance_id = "i-0d603e14380caa8df"
}