# VPC
resource "aws_vpc" "main"{
  cidr_block = var.CIDR_BLOCK
  instance_tenancy = "default"
  tags = {
    Name = "Terraform"
  }
}

# Subnets
resource "aws_subnet" "test-public-1"{
  vpc_id = aws_vpc.main.id
  cidr_block = var.SUB_1_CIDR
  map_public_ip_on_launch = "true"
  availability_zone = var.AZ_1
  tags = {
    Name = "Test Public 1"
  }
}

resource "aws_subnet" "test-public-2"{
  vpc_id = aws_vpc.main.id
  cidr_block = var.SUB_2_CIDR
  map_public_ip_on_launch = "true"
  availability_zone = var.AZ_2
  tags = {
    Name = "Test Public 2"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main-gw"{
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "test_gateway"
  }
}

# Route Table
resource "aws_route_table" "main-public"{
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }
}

# route association public
resource "aws_route_table_association" "test-public-1"{
  subnet_id = aws_subnet.test-public-1.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "test-public-2"{
  subnet_id = aws_subnet.test-public-2.id
  route_table_id = aws_route_table.main-public.id
}

output "subnet_id_1"{
  value = aws_subnet.test-public-1.id
}

output "subnet_id_2"{
  value = aws_subnet.test-public-2.id
}

output "vpc_id"{
  value = aws_vpc.main.id
}
