#Alb
resource "aws_lb" "alb" {
  name               = "Application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.My_Sg_id]
  subnets            = var.subnets
}

#Listner

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}




#targetgroup
resource "aws_lb_target_group" "tg" {
  name     = "test-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

#target Group Attachment

resource "aws_lb_target_group_attachment" "tga" {
  count = length(var.instances)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instances[count.index]
  port             = 80
}