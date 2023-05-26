resource "aws_nat_gateway" "public-nat" {
  allocation_id = aws_eip.public-eip.id
  subnet_id     = aws_subnet.subnet[0].id

  tags = {
    Name = var.names["nat_gateway"]
  }

  depends_on = [aws_internet_gateway.internet-gateway]
}