provider "aws" {
  region = "eu-west-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}


data "aws_key_pair" "existing_key" {
  key_name = "aws-key"
}


resource "aws_security_group" "web_sg" {
  name        = "web-automation-sg"
  description = "Allow SSH and HTTP access"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-automation-sg"
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami                    = "ami-03446a3af42c5e74e"
  instance_type          = "t3.micro"
  key_name               = data.aws_key_pair.existing_key.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "web-automation"
  }

  lifecycle {
    prevent_destroy = true
  }
}
