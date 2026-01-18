resource "aws_autoscaling_group" "tomcat_asg" {
  name = "tomcat-asg"
  launch_template {
    id      = aws_launch_template.tomcat-app.id
    version = "$Latest"
  }
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = [aws_subnet.private_subnet_1.id]
  target_group_arns   = [aws_lb_target_group.tomcat_tg.arn]

  tag {
    key                 = "Name"
    value               = "tomcat-asg"
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }
}
