resource "aws_lb" "tomcat_alb" {
  name               = "tomcat-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [var.public_subnet_1.id]
  enable_deletion_protection = true

  tags = {
    Name = "tomcat-alb"
  }
  
}

resource "aws_lb_target_group_attachment" "tomcat_tg_attachment" {
  target_group_arn = aws_lb_target_group.tomcat_tg.arn
  target_id        = aws_autoscaling_group.tomcat_asg.id
  port             = 8080
}