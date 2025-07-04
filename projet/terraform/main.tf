# Générer une clé SSH privée
resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Enregistrer la clé publique dans AWS EC2
resource "aws_key_pair" "generated_key_pair" {
  key_name   = "test"
  public_key = tls_private_key.generated_key.public_key_openssh
}

# Enregistrer la clé privée localement dans ~/.ssh
resource "local_file" "private_key_pem" {
  content         = tls_private_key.generated_key.private_key_pem
  filename        = pathexpand("~/.ssh/test.pem")
  file_permission = "0400"
}

# Security Group commun
resource "aws_security_group" "owncloud_sg" {
  name        = "owncloud_sg"
  description = "Allow HTTP, HTTPS, SSH"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Instance OwnCloud
resource "aws_instance" "owncloud" {
  ami                         = "ami-0644165ab979df02d"
  instance_type               = "t2.medium"
  key_name                    = aws_key_pair.generated_key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.owncloud_sg.id]

  tags = {
    Name = "owncloud-instance"
  }
}

# Instance OnlyOffice
resource "aws_instance" "onlyoffice" {
  ami                         = "ami-0644165ab979df02d"
  instance_type               = "t2.medium"
  key_name                    = aws_key_pair.generated_key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.owncloud_sg.id]

  tags = {
    Name = "onlyoffice-instance"
  }
}

