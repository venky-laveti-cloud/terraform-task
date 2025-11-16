resource "aws_instance" "webserver1" {
  ami                    = "ami-0c7d68785ec07306c"
  instance_type          = "t3.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install docker -y
    systemctl start docker
    systemctl enable docker
    usermod -aG docker ec2-user

    docker pull mysql:latest
    docker run -d \
      --name mydb \
      -e MYSQL_ROOT_PASSWORD=root123 \
      -e MYSQL_DATABASE=testdb \
      -p 3306:3306 \
      mysql:latest

    echo "Docker and MySQL installed successfully" > /home/ec2-user/setup.log
  EOF

  tags = {
    Name = var.instance_name
  }
}

output "public_ip" {
  value = aws_instance.webserver1.public_ip
}
