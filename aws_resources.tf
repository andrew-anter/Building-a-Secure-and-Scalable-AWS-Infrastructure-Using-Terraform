# EC2 instance creation
resource "aws_instance" "EC2-public-servers" {
  count = 2 #2 public

  ami           = var.ami
  instance_type = var.instance_type

  associate_public_ip_address = true

  subnet_id = aws_subnet.subnet[count.index].id

  key_name = "terraform"

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_http.id
  ]

  tags = {
    Name : var.names["public_instance"]
  }

  provisioner "remote-exec"{
    inline =[
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo unlink /etc/nginx/sites-enabled/default",
      "sudo sh -c 'echo \"server { \n listen 80; \n location / { \n proxy_pass http://${aws_lb.private_load_balancer.dns_name}; \n} \n }\" > /etc/nginx/sites-available/reverse-proxy.conf '",
      "sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy",
      "sudo systemctl restart nginx",
    ]

    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("/home/andrew/Downloads/terraform.pem")
    host     = self.public_ip
    }

  }

  depends_on = [aws_internet_gateway.internet-gateway, aws_lb.private_load_balancer]

}



resource "aws_instance" "EC2-private-servers" {
  count = 2 # 2 private

  ami           = var.ami
  instance_type = var.instance_type

  associate_public_ip_address = false

  subnet_id = aws_subnet.subnet[count.index +2].id

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_http.id
  ]

  tags = {
    Name : var.names["private_instance"]
  }

  user_data = <<-EOF
    #!/bin/bash
    apt update
    apt install apache2 -y
    EOF


  depends_on = [aws_nat_gateway.public-nat ]

}