resource "aws_eip" "public-eip" {
  vpc              = true
  public_ipv4_pool = "amazon"
  depends_on       = [aws_internet_gateway.internet-gateway]

  tags = {
    Name : "nat-elastic-ip"
  }
}