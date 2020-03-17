resource "aws_security_group" "allow-ssh"{
  vpc_id = var.vpc_id
  name = "allow-ssh"
  description = "security group that allow ssh and all egress traffic"
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  dynamic "ingress"{
    for_each = var.ports
    content{
      from_port = ingress.key
      to_port = ingress.key
      protocol = "tcp"
      cidr_blocks = ingress.value
    }
  }
  tags = {
    Name = "allow-ssh"
  }
}
