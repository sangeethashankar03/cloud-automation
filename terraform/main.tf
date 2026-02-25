provider "aws" {
  region = "eu-west-1"
}

# Use existing key pair (already created in AWS)
data "aws_key_pair" "existing" {
  key_name = "cloud-user"
}

# Use existing security group (already created in AWS)
data "aws_security_group" "existing_sg" {
  name = "allow_ssh_http"
}

# EC2 instance
resource "aws_instance" "web" {
  ami                         = "ami-03446a3af42c5e74e"
  instance_type               = "t3.micro"
  key_name                    = data.aws_key_pair.existing.key_name
  vpc_security_group_ids      = [data.aws_security_group.existing_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "automation-web"
  }
}
