resource "aws_instance" "my-instance"{
  count = var.COUNT ? 1 : 0
  ami = var.AMIS[var.AWS_REGION]
  instance_type = var.AWS_INSTANCE
}
