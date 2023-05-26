
## Networkings ##
vpc_cidr       = "10.0.0.0/16"
all_cidr_block = "0.0.0.0/0"

subnets_cidr = [
  "10.0.0.0/24", ## public
  "10.0.1.0/24", ## public
  "10.0.2.0/24", ## private
  "10.0.3.0/24"  ## private
]

availibilty_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c",
  "us-east-1d"
]


## instances ##
ami           = "ami-053b0d53c279acc90" # ubuntu
instance_type = "t2.micro"


names = {
  "public_instance" : "public_nginx_instance",
  "private_instance" : "private_apache2_instance",
  "vpc" : "my_vpc",
  "private_route_table" : "private_route_table",
  "public_route_table" : "public_route_table",
  "nat_gateway" : "my_nat_gateway",
  "internet_gateway" : "my_internet_gateway",
  "region" : "us-east-1"
}
