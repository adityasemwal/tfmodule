data "aws_ami" "amazon2"{
  most_recent = true
  filter{
    name = "name"
    values = ["Amazon Linux 2 AMI*"]
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
}
