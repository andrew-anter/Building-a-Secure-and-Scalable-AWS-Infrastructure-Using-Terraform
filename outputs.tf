output "instance0_public_ip" {
  value = aws_instance.EC2-public-servers[0].public_ip
}

output "instance1_public_ip" {
  value = aws_instance.EC2-public-servers[1].public_ip
}

output "instance2_private_ip" {
  value = aws_instance.EC2-private-servers[0].private_ip
}

output "instance3_public_ip" {
  value = aws_instance.EC2-private-servers[1].private_ip
}

output "public_load_balancer_dns" {
    value = aws_lb.public_load_balancer.dns_name
}

output "private_load_balancer_dns" {
    value = aws_lb.private_load_balancer.dns_name
}