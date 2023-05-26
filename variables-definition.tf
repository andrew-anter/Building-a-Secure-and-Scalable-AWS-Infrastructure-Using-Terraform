## networking variables ##
variable "availibilty_zones" {
  type = list(string)
}

variable "vpc_cidr" {
  type = string
}

variable "subnets_cidr" {
  type = list(string)
}

variable "all_cidr_block" {
  type        = string
  description = "this is a cidr block variable for all ips"
}


## instances variables ##
variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}


## names map ## 
variable "names" {
  type = map(any)
}
