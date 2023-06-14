# Building a Secure and Scalable AWS Infrastructure Using Terraform:

## The infrastructure created:
<ol>
<li>VPC</li>
<li>2 private subnets and 2 public subnets</li>
<li>C2 instance in each subnet</li>
<li>NAT-gateway for the private subnets</li>
<li>Internet gateway</li>
<li>The necessery routing tables for each instance</li>
<li>Private load balancer and a public load balancer</li>
<li>Rerouting the traffic frorm the public insatances to the private load balancer using nginx reverse proxy </li>
</ol>
The end result shall be apache2 server is getting served by the private instances through the private load balancer which is routed from the public instances using nginx reverse proxy when you hit the public load balancer dns.

![Screenshot from 2023-05-26 20-40-54](https://github.com/andrew-anter/terraform-lab3/assets/56892364/9d114751-2542-40b7-8f03-de6f12dcb10f)

### Creating and working on workspace dev
![Screenshot from 2023-05-26 20-36-39](https://github.com/andrew-anter/terraform-lab3/assets/56892364/594e5816-4a0a-472b-8654-39fffff67474)

### Cofiguration of the proxy:
![Screenshot from 2023-05-26 20-20-52](https://github.com/andrew-anter/terraform-lab3/assets/56892364/9c053105-6132-46c1-98fa-9e591050d886)

### Public dns of the load balancer when traffic is sent to it from a browser and it returns the content of the private ec2s
![Screenshot from 2023-05-26 20-18-14](https://github.com/andrew-anter/terraform-lab3/assets/56892364/d5846fbb-1f5b-499c-9915-480e81a0587b)

### S3 that contain the state file
![Screenshot from 2023-05-26 20-19-51](https://github.com/andrew-anter/terraform-lab3/assets/56892364/8df74130-5238-4929-8af2-26d68692cd99)
