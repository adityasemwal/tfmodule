variable "COUNT"{}
variable "AWS_INSTANCE"{
  default = "t2.micro"
}
variable "subnet_ids"{}
variable "vpc_id"{}
variable "ports"{
  type = map(list(string))
  default = {
    22 = ["0.0.0.0/0"]
    8080 = ["0.0.0.0/0"]
  }
}
