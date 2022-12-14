# provider region
variable "region" {
  description = "making region a variable"
  default     = "eu-west-2"
  type        = string
}

# vpc cidr block
variable "vpc_cidr_block" {
  description = "making vpc cidr block a variable"
  default     = "10.0.0.0/16"
  type        = string
}

variable "vpc_instance_tenancy" {
  description = "making vpc instance_tenancy a variable"
  default     = "default"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "making enable dns hostnames a variable"
  default     = true
  type        = bool
}

variable "enable_dns_support" {
  description = "making enable dns support a variable"
  default     = true
  type        = bool
}

variable "new_three_tier_vpc_name" {
  description = "making three_tier_vpc_name a variable"
  default     = "three_tier_vpc"
  type        = string
}

variable "web_subnet-1" {
  description = "making tag a variable"
  default     = "web_subnet-1"
  type        = string
}

variable "web_subnet-2" {
  description = "making tag a variable"
  default     = "web_subnet-2"
  type        = string
}

variable "application_subnet-1" {
  description = "making tag a variable"
  default     = "application_subnet-1"
  type        = string
}

variable "application_subnet-2" {
  description = "making tag a variable"
  default     = "application_subnet-2"
  type        = string
}

variable "database_subnet_1" {
  description = "making tag a variable"
  default     = "database_subnet-1"
  type        = string
}

variable "database_subnet_2" {
  description = "making tag a variable"
  default     = "database_subnet-2"
  type        = string
}

# web layer subnets
variable "web_subnet-1_cidr_block" {
  description = "making enable web sub1 cidr block a variable"
  default     = "10.0.1.0/24"
  type        = string
}

variable "web_subnet-1_availability_zone" {
  description = "making web sub1 availability zone a variable"
  default     = "eu-west-2a"
  type        = string
}

variable "web_subnet-1_map_public_ip_on_launch" {
  description = "making web sub1 map_public_ip_on_launch a variable"
  default     = true
  type        = bool
}

variable "web_subnet-2_cidr_block" {
  description = "making web sub2 cidr_block a variable"
  default     = "10.0.2.0/24"
  type        = string
}

variable "web_subnet-2_availability_zone" {
  description = "making web sub2 availability_zone a variable"
  default     = "eu-west-2b"
  type        = string
}

variable "web_subnet-2_map_public_ip_on_launch" {
  description = "making web sub2 map_public_ip_on_launch a variable"
  default     = true
  type        = bool
}

# Application Tier Subnets
variable "application_subnet-1_cidr_block" {
  description = "making app sub1 cidr block a variable"
  default     = "10.0.3.0/24"
  type        = string
}

variable "application_subnet-1_availability_zone" {
  description = "making app sub1 availability zone a variable"
  default     = "eu-west-2a"
  type        = string
}

variable "application_subnet-2_cidr_block" {
  description = "making app sub2 cidr block a variable"
  default     = "10.0.4.0/24"
  type        = string
}

variable "application_subnet-2_availability_zone" {
  description = "making app sub2 availability zone a variable"
  default     = "eu-west-2b"
  type        = string
}

#Database Subnets
variable "database_subnet-1_cidr_block" {
  description = "making database sub1 cidr block a variable"
  default     = "10.0.5.0/24"
  type        = string
}

variable "database_subnet-1_availability_zone" {
  description = "making database sub2 availability zone a variable"
  default     = "eu-west-2a"
  type        = string
}

variable "database_subnet-2_cidr_block" {
  description = "making database sub1 cidr block a variable"
  default     = "10.0.6.0/24"
  type        = string
}

variable "database_subnet-2_availability_zone" {
  description = "making database sub2 availability zone a variable"
  default     = "eu-west-2b"
  type        = string
}

variable "igw" {
  description = "making igw name a variable"
  default     = "igw"
  type        = string
}

variable "ngw_name1" {
  description = "making ngw name a variable"
  default     = "ngw1"
  type        = string
}

variable "ngw_name2" {
  description = "making ngw name a variable"
  default     = "ngw2"
  type        = string
}

# route
variable "internet-gateway-association" {
  description = "association of internet gateway with route"
  default     = "0.0.0.0/0"
  type        = string
}

variable "public_route_table_cidr_block" {
  description = "making pub route table_cidr_block a variable"
  default     = "0.0.0.0/0"
  type        = string
}

variable "public_route_table_name" {
  description = "making pub route table name a variable"
  default     = "public_route_table"
  type        = string
}

variable "priv_route_table_cidr_block" {
  description = "making priv route destination_cidr_block a variable"
  default     = "0.0.0.0/0"
  type        = string
}

variable "priv_route_table_tag" {
  description = "making priv route table name a variable"
  default     = "priv_route_table"
  type        = string
}

variable "new_three_tier_sg_name" {
  description = "making new three_tier_sg_name a variable"
  default     = "new_three_tier_sg"
  type        = string
}

variable "sg_ssh_ingress_cidr_block" {
  description = "making sg_ssh_ingress_cidr_block a variable"
  default     = ["0.0.0.0/0"]
  type        = list(any)
}
# Variables for launch template

variable "webtier-launch-template" {
  description = "making name prefix a variable"
  default     = null
  type        = string
}

variable "linux-ami" {
  description = "making ami a variable"
  default     = "ami-04706e771f950937f"
  type        = string
}

variable "instance-type" {
  description = "making instance class a variable"
  default     = "t2.micro"
  type        = string
}

variable "key_name" {
  description = "making key name a varialbe "
  default     = "September-KP"
  type        = string
}

variable "app_tier_launch_template_23" {
  description = "making name prefix a variable"
  default     = "Kobby"
  type        = string
}
# Security Group
variable "Web-SG" {
  description = "making security webtier security group a variable"
  default     = "frontend security group"
  type        = string
}
# RDS mysql
variable "db_storage" {
  description = "making allocated storage a variable"
  default     = 20
  type        = number
}

variable "db_engine_version" {
  description = "making engine version a variable"
  default     = "8.0.28"
  type        = string
}

variable "db_instance_class" {
  description = "making instance class a variable"
  default     = "db.t3.micro"
  type        = string
}

variable "db_username" {
  description = "AWS RDS Database Administrator Username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "AWS RDS Database Administrator Password"
  type        = string
  sensitive   = true
}

variable "skip_db_snapshot" {
  description = "make snapshot decision a variable"
  default     = true
  type        = bool
}

variable "enable_multi_AZ" {
  description = "make multi AZ a variable"
  default     = true
  type        = bool
}

variable "public_access" {
  description = "make choosing public access a variable"
  default     = false
  type        = bool
}

variable "engine" {
  description = "making engine a variable"
  default     = "mysql"
  type        = string
}

variable "storagetype" {
  description = "making storage type a variable"
  default     = "gp2"
  type        = string
}

variable "publicalbname" {
  description = "making albname a variable"
  default     = "External-LB"
  type        = string
}

variable "internal" {
  description = "making internal alb a variable"
  default     = false
  type        = bool
}

variable "ipaddresstype" {
  description = "making internal alb a variable"
  default     = "ipv4"
  type        = string
}

variable "loadbalancertype" {
  description = "making loadbalancer type a variable"
  default     = "application"
  type        = string
}

variable "enabledeletionprotection" {
  description = "making deletion protection a variable"
  default     = false
  type        = bool
}

variable "listener_port" {
  description = "making port a variable"
  default     = 80
  type        = number
}

variable "protocol" {
  description = "making protocol a variable"
  default     = "HTTP"
  type        = string
}

variable "default_action_type" {
  description = "making default action a variable"
  default     = "forward"
  type        = string
}

variable "enablehealthcheck" {
  description = "making healthcheck a variable"
  default     = true
  type        = bool
}

variable "healthcheckinterval" {
  description = "making interval a variable"
  default     = 30
  type        = number
}

variable "healthcheckport" {
  description = "making healthcheck port a variable"
  default     = "80"
  type        = string
}

variable "healthchecktimeout" {
  description = "making timeout a variable"
  default     = 6
  type        = number
}

variable "healthythreshold" {
  description = "making healthythreshold a variable"
  default     = 5
  type        = number
}

variable "unhealthythreshold" {
  description = "making healthythreshold a variable"
  default     = 2
  type        = number
}

variable "healthcheckmatcher" {
  description = "making matcher a variable"
  default     = "200"
  type        = string
}

variable "healthcheckname" {
  description = "making name a variable"
  default     = "threetierpub"
  type        = string
}

variable "target-type" {
  description = "making target type a variable"
  default     = "instance"
  type        = string
}

variable "port" {
  description = "making port after target type a variable"
  default     = "80"
  type        = string
}

variable "internalalbname" {
  description = "making internal alb a variable"
  default     = "alb-internal7"
  type        = string
}

variable "internal-internal" {
  description = "making internal a variable"
  default     = true
  type        = bool
}

variable "int-targetgroupname" {
  description = "making internal target group name a variable"
  default     = "threetier-internal7"
  type        = string
}

variable "asgname-public" {
  description = "making webserver asg name a variable"
  default     = "Webserver-ASG"
  type        = string
}

variable "desired_capacity" {
  description = "making asg desired capaciity a variable"
  default     = 4
  type        = number
}

variable "maxsize" {
  description = "making max size a variable"
  default     = 6
  type        = number
}

variable "minsize" {
  description = "making max size a variable"
  default     = 4
  type        = number
}

variable "health_check_grace_period" {
  description = "making health check grace period a variable"
  default     = 300
  type        = number
}

variable "health_check_type" {
  description = "making health check type a variable"
  default     = "ELB"
  type        = string
}

variable "apptier-private" {
  description = "making App Tier name a variable"
  default     = "Appserver-ASG"
  type        = string
}