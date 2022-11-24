
#creating internet facing ALB for Webservers
resource "aws_lb" "alb-public" {
   name                 = var.publicalbname
   internal             = var.internal
   ip_address_type      = var.ipaddresstype
   load_balancer_type   = var.loadbalancertype
   security_groups      = [aws_security_group.web-elb-sg.id]
   subnets              = [aws_subnet.web_subnet-1.id, aws_subnet.web_subnet-2.id]
   
   enable_deletion_protection = var.enabledeletionprotection

   tags = {
   Name = var.publicalbname
  }
}
  #creating listener for public/frontend/external

 resource "aws_lb_listener" "web-alb-listener" {
  load_balancer_arn     = aws_lb.alb-public.arn
  port                  = var.listener_port
  protocol              = var.protocol
  
  default_action {
    type                = var.default_action_type
    target_group_arn    = aws_lb_target_group.threetierpub.arn
  }
}

#target group front end/external/public

resource "aws_lb_target_group" "threetierpub" {
 health_check {
  enabled               = var.enablehealthcheck
  interval              = var.healthcheckinterval
  path                  = "/"
  protocol              = var.protocol
  port                  = var.healthcheckport
  timeout               = var.healthchecktimeout
  healthy_threshold     = var.healthythreshold
  unhealthy_threshold   = var.unhealthythreshold
  matcher               = var.healthcheckmatcher
 }
name                    = var.healthcheckname
target_type             = var.target-type
port                    = var.port
protocol                = var.protocol
vpc_id                  = "${aws_vpc.new_three_tier_vpc.id}"
}
 
#attach target group to alb (frontend)

resource "aws_autoscaling_attachment" "asg-frontend_attachment" {
autoscaling_group_name = aws_autoscaling_group.Webserver-autoscaling-group.id
  alb_target_group_arn = aws_lb_target_group.threetierpub.arn
  }

#creating internal ALB for App servers
resource "aws_lb" "alb_internal"{
   name                 = var.internalalbname
   internal             = var.internal-internal
   load_balancer_type   = var.loadbalancertype
   security_groups      = [aws_security_group.internal-elb-sg.id]
   subnets              = [aws_subnet.application_subnet_1.id,aws_subnet.application_subnet_2.id]
   
   enable_deletion_protection = var.enabledeletionprotection

   tags = {
   Name = var.internalalbname
  }
}  
  #creating listener (internal)

 resource "aws_lb_listener" "internal-alb-listener" {
  load_balancer_arn = aws_lb.alb_internal.arn
  port              = var.port
  protocol          = var.protocol
  default_action {
    type             = var.default_action_type
    target_group_arn = aws_lb_target_group.threetier_internal.arn
  }
}
#create internal target group
resource "aws_lb_target_group" "threetier_internal" {
 health_check {
  enabled               = var.enablehealthcheck
  interval              = var.healthcheckinterval
  path                  = "/"
  protocol              = var.protocol
  port                  = var.healthcheckport
  timeout               = var.healthchecktimeout
  healthy_threshold     = var.healthythreshold
  unhealthy_threshold   = var.unhealthythreshold
  matcher               = var.healthcheckmatcher
 }

name                    = var.int-targetgroupname
target_type             = var.target-type
port                    = var.port
protocol                = var.protocol
vpc_id                = "${aws_vpc.new_three_tier_vpc.id}"
}


#attach target group to alb (internal)

resource "aws_autoscaling_attachment" "asg-internal_attachment"{
  autoscaling_group_name        = aws_autoscaling_group.Appserver-autoscaling-group.id
  alb_target_group_arn           = aws_lb_target_group.threetier_internal.arn
  }
