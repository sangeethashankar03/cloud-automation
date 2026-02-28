provider "aws" {
  region = "eu-west-1"
}

data "aws_key_pair" "existing_key" {
  key_name = "aws-key"
}

data "aws_security_group" "existing_sg" {
  name = "allow_ssh_http"
}

resource "aws_instance" "web" {
  ami           = "ami-03446a3af42c5e74e" # Ubuntu 24.04 eu-west-1
  instance_type = "t3.micro"

  key_name               = data.aws_key_pair.existing_key.key_name
  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "web-automation"
  }

  lifecycle {
    prevent_destroy = true
  }
}
