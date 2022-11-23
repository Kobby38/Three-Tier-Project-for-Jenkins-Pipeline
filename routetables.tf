# create web tier route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.new_three_tier_vpc.id
  
      tags = {
    Name = var.public_route_table_name
  }
}
#Private route table (AZ-1, eu-west-2a)
resource "aws_route_table" "private-route-table1" {
  vpc_id = aws_vpc.new_three_tier_vpc.id
  
    tags = {
    Name = var.priv_route_table_tag
  }
}
#Private route table (AZ-2, eu-west-2b)
resource "aws_route_table" "private-route-table2" {
  vpc_id = aws_vpc.new_three_tier_vpc.id
  
  tags = {
    Name = var.priv_route_table_tag
  }
}

# Public route table association (Web Tier)
resource "aws_route_table_association" "public-route-table-association-1" {
  subnet_id      = aws_subnet.web_subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-route-table-association-2" {
  subnet_id      = aws_subnet.web_subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}

# Private route table association
resource "aws_route_table_association" "private-route-table1-association-1" {
  subnet_id      = aws_subnet.application_subnet_1.id
  route_table_id = aws_route_table.private-route-table1.id
}

resource "aws_route_table_association" "private-route-table2-association-2" {
  subnet_id      = aws_subnet.application_subnet_2.id
  route_table_id = aws_route_table.private-route-table1.id
}

 resource "aws_route_table_association" "private-route-table-association-3" {
  subnet_id      = aws_subnet.database_subnet_1.id
  route_table_id = aws_route_table.private-route-table2.id
}

resource "aws_route_table_association" "private-route-table4-association-4" {
  subnet_id      = aws_subnet.database_subnet_2.id
  route_table_id = aws_route_table.private-route-table2.id
}
 