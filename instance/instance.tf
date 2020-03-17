data "aws_ami" "amazon2"{
  most_recent = true
  filter{
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
  filter{
    name = "virtualization-type"
    values = ["hvm"]
  }
  filter{
    name = "root-device-type"
    values = ["ebs"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "my-instance"{
  count = var.COUNT ? 1 : 0
  ami = data.aws_ami.amazon2.id
  instance_type = var.AWS_INSTANCE
  subnet_id = var.subnet_ids
  key_name = aws_key_pair.mykeypair.key_name
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  tags = {
    Name = "Terraform"
  }
}
