resource "aws_security_group" "webserver_sg" {
    name = "web-server-terraform" 
    vpc_id      = aws_vpc.main-vpc.id
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
   ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = [ aws_security_group.alb-sg.id ]
    } 

egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }    
}
