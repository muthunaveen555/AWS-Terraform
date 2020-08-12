resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [aws_subnet.public-sub1.id,aws_subnet.public-sub2.id]
  tags = {
    Environment = "production"
  }
}

resource "aws_alb_listener" "alb_listener" {  
  load_balancer_arn = aws_lb.test.arn  
  port              = 80  
  protocol          = "HTTP"

  default_action  {    
    target_group_arn = aws_lb_target_group.my-alb-tg.arn
    type             = "forward"  
  }
}

resource "aws_lb_target_group" "my-alb-tg" {
  name     = "apl-targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main-vpc.id     
  health_check {    
    healthy_threshold   = 3    
    unhealthy_threshold = 10    
    timeout             = 5    
    interval            = 10    
    path                = "/phpinfo.php"    
    port                = "80"  
  }
  tags = {    
    name = "main-target-group"   
  }
}

