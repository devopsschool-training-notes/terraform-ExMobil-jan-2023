

resource "aws_s3_bucket" "c" {

  for_each = {
    bukcet-name1 = "my-tf-test-bucket-12fdddd1"
	bukcet-name2 = "my-tf-test-bucket-12fdddd2"
	bukcet-name3 = "my-tf-test-bucket-12fdddd3"
  }
  
  bucket = each.value

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}




resource "aws_s3_bucket" "a" {
  bucket = "my-tf-test-bucket-12345678"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  depends_on = [aws_s3_bucket.b]
}



resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-222222222"

  tags = {
    Name        = "My bucket"
    Environment = "QA"
  }
}



resource "aws_instance" "web" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t3.micro"
  key_name = "rajesh"
  
  tags = {
    Name = "Rajesh Instance"
  }

  }
  
variable "github-condition" {
  type    = string
  default = "go"
}

resource "aws_instance" "web-condition" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t3.micro"
  key_name = "rajesh"
  count = "${var.github-condition == "java" ? 1 : 0}"
  
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
