resource "aws_launch_configuration" "example" {
  depends_on             = [ aws_ami_from_instance.my-image ]
  image_id               = aws_ami_from_instance.my-image.id
  instance_type          = "t2.micro"
  security_groups        = [ aws_security_group.webserver_sg.id ] 
  lifecycle {
    create_before_destroy = true
  }
}