resource "aws_security_group" "ssh_sg" {
  name = "cis-ssh-sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "cis" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name

  vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  tags = {
    Name = "CIS-Hardened-CICD"
  }
}
