# create web subnet
resource "aws_subnet" "web_subnet-1" {
  vpc_id     = aws_vpc.new_three_tier_vpc.id
  cidr_block = var.web_subnet-1_cidr_block
  availability_zone = var.web_subnet-1_availability_zone
  map_public_ip_on_launch = var.web_subnet-1_map_public_ip_on_launch
  tags = {
    Name = var.web_subnet-1
  }
}

resource "aws_subnet" "web_subnet-2" {
  vpc_id     = aws_vpc.new_three_tier_vpc.id
  cidr_block = var.web_subnet-2_cidr_block
  availability_zone = var.web_subnet-2_availability_zone
  map_public_ip_on_launch = var.web_subnet-2_map_public_ip_on_launch
  tags = {
    Name = var.web_subnet-2
  }
}
#create Application private subnet
resource "aws_subnet" "application_subnet_1" {
  vpc_id     = aws_vpc.new_three_tier_vpc.id
  cidr_block = var.application_subnet-1_cidr_block
  availability_zone = var.application_subnet-1_availability_zone
  tags = {
    Name = var.application_subnet-1
  }
}

resource "aws_subnet" "application_subnet_2" {
  vpc_id     = aws_vpc.new_three_tier_vpc.id
  cidr_block = var.application_subnet-2_cidr_block
  availability_zone = var.application_subnet-2_availability_zone
  tags = {
    Name = var.application_subnet-2
  }
}

# Create Database Private Subnet
resource "aws_subnet" "database_subnet_1" {
  vpc_id            = aws_vpc.new_three_tier_vpc.id
  cidr_block        = var.database_subnet-1_cidr_block
  availability_zone = var.database_subnet-1_availability_zone

  tags = {
    Name = var.database_subnet_1
  }
}

resource "aws_subnet" "database_subnet_2" {
  vpc_id            = aws_vpc.new_three_tier_vpc.id
  cidr_block        = var.database_subnet-2_cidr_block
  availability_zone = var.database_subnet-2_availability_zone

  tags = {
    Name = var.database_subnet_2
  }
}