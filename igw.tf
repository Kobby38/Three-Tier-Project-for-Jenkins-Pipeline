# create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.new_three_tier_vpc.id

  tags = {
    Name = var.igw
  }
}