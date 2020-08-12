resource "aws_autoscaling_group" "my-asg" {
  name = "test-asg"
  launch_configuration = aws_launch_configuration.example.id
  min_size = 2
  max_size = 5
  desired_capacity = 2
  target_group_arns = [aws_lb_target_group.my-alb-tg.arn]
  vpc_zone_identifier = [aws_subnet.private-sub1.id,aws_subnet.private-sub2.id]
  health_check_type = "ELB"
  tag {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "asg-target-policy" {
  name                   = "asg-policy"
  autoscaling_group_name = aws_autoscaling_group.my-asg.name
  policy_type = "TargetTrackingScaling"
  target_tracking_configuration {
  predefined_metric_specification {
    predefined_metric_type = "ASGAverageCPUUtilization"
  }

  target_value = 50.0
}
}