resource "aws_lb" "public_load_balancer" {
  name               = "public-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = [aws_subnet.subnet[0].id, aws_subnet.subnet[1].id]

  tags = {
    Name = "public-load-balancer"
  }
}

resource "aws_lb_listener" "public_load_balancer_listener" {
  load_balancer_arn = aws_lb.public_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public-target-group.arn
  }
}

resource "aws_lb" "private_load_balancer" {
  name               = "private-load-balancer"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = [aws_subnet.subnet[2].id, aws_subnet.subnet[3].id]

  tags = {
    Name = "private-load-balancer"
  }
}

resource "aws_lb_listener" "private_load_balancer_listener" {
  load_balancer_arn = aws_lb.private_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private-target-group.arn
  }
}