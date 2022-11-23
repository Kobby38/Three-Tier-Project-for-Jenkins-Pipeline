# elastic ip1
resource "aws_eip" "elastic_ip1" {
  vpc = true
}

# elastic ip2
resource "aws_eip" "elastic_ip2" {
  vpc = true
}

# nat gateway 
resource "aws_nat_gateway" "ngw1" {
  allocation_id = aws_eip.elastic_ip1.id
  subnet_id     = aws_subnet.web_subnet-1.id
  tags = {
    Name = var.ngw_name1
  }
}

resource "aws_nat_gateway" "ngw2" {
  allocation_id = aws_eip.elastic_ip2.id
  subnet_id     = aws_subnet.web_subnet-2.id
  tags = {
    Name = var.ngw_name2
  }
}






