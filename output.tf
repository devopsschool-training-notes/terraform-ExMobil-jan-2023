

resource "aws_instance" "web" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t3.micro"
  key_name = "rajesh"
  
  tags = {
    Name = "Rajesh Instance"
  }

  }

output "publicdns" {
    value = aws_instance.web.public_dns
}

output "publicip" { 
	value = aws_instance.web.public_ip
}
