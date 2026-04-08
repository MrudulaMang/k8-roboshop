resource "aws_instance" "docker_roboshop"{
 ami           = "ami-0220d79f3f480ecf5"
 instance_type = "t3.micro"
 vpc_security_group_ids = [aws_security_group.allow_tls.id]
 root_block_device {
      volume_size = 50
      volume_type = "gp3"
 }
 user_data = file("disk.sh") 
 tags = {
    Name    = "workstation"
    Project = "roboshop"
 }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform" #this isfor aws account
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # all protocol
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all_terraform"
  }
}

output "instance_id" {
    value = aws_instance.docker_roboshop.public_ip
}
