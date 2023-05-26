## public tg
resource "aws_lb_target_group" "public-target-group" {
  name     = "lb-public-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id
}

resource "aws_lb_target_group_attachment" "public-tg-attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.public-target-group.arn
  target_id        = aws_instance.EC2-public-servers[count.index].id
  port             = 80
}

## private tg
resource "aws_lb_target_group" "private-target-group" {
  name     = "lb-private-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id
}

resource "aws_lb_target_group_attachment" "private-tg-attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.private-target-group.arn
  target_id        = aws_instance.EC2-private-servers[count.index].id
  port             = 80
}
