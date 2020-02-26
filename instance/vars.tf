variable "AWS_REGION"{
  default = "us-west-1"
}

variable "AMIS"{
  default = {
    us-west-1 = "ami-01c94064639c71719"
  }
}
variable "COUNT"{}
variable "AWS_INSTANCE"{
  default = "t2.micro"
}
