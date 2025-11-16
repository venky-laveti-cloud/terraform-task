resource "aws_security_group" "database_sg" {
  name        = "Database-SG"
  description = "Allow inbound traffic to MySQL"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow MySQL traffic"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # open for testing, restrict in production
  }
 ingress {
    description = "Allow MySQL traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = ["0.0.0.0/0"]  # open for testing, restrict in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database-SG"
  }
}

output "sg_id" {
  value = aws_security_group.database_sg.id
}
