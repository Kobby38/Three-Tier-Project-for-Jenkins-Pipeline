# configuring internet-facing load balancer security group 
resource "aws_security_group" "web-elb-sg" {
  name        = "webelb"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = aws_vpc.new_three_tier_vpc.id

  #Inbound Rules
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outbound Rules  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-elb-sg"
  }
}
#configuring Web Tier Security Group (Public EC2 Instances)
resource "aws_security_group" "Webtier-SG" {
  name        = "webtier"
  description = "Allow inbound traffic from HTTP,SSH and web-elb-sg"
  vpc_id      = aws_vpc.new_three_tier_vpc.id

  #Inbound Rules
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.web-elb-sg.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Webtier-SG"
  }
}

# Create Internal load balancer security group 
resource "aws_security_group" "internal-elb-sg" {
  name        = "internal-elb"
  description = "Allow inbound traffic from webtier-sg"
  vpc_id      = aws_vpc.new_three_tier_vpc.id

  ingress {
    description     = "webtier-sg from VPC"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.Webtier-SG.id]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.Webtier-SG.id]
  }

  tags = {
    Name = "application-layer-sg1"
  }
}

# Configuring App Tier Security Group
resource "aws_security_group" "App-tier-SG" {
  name        = "App-tier"
  description = "Allow inbound traffic from "
  vpc_id      = aws_vpc.new_three_tier_vpc.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.internal-elb-sg.id]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "App-tier-SG"
  }
}

# Configuring MY SQL Security Group
resource "aws_security_group" "DB-tier-SG" {
  name        = "DB-tier"
  description = "Allow inbound traffic from App-Tier"
  vpc_id      = aws_vpc.new_three_tier_vpc.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.App-tier-SG.id]
  }

  tags = {
    Name = "DB-tier-SG"
  }
}