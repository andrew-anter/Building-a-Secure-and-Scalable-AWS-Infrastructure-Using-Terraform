# create a supnet within the vpc
# 4 supnets 
# 2 private => 10.0.1.0/24, 10.0.3.0/24
# 2 public => 10.0.2.0/24, 10.0.0.0/24
resource "aws_subnet" "subnet" {
  count      = 4
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.subnets_cidr[count.index]

  availability_zone = var.availibilty_zones[count.index]

  tags = {
    Name : ((count.index == 0 || count.index == 1) ? "Public-subnet${count.index + 1}" : "Private-subnet${count.index - 2}")
  }
}