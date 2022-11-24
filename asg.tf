// creating autoscaling group for webserver //
resource "aws_autoscaling_group" "Webserver-autoscaling-group" {
  name                       = var.asgname-public
  desired_capacity           = var.desired_capacity
  max_size                   = var.maxsize
  min_size                   = var.minsize
  health_check_grace_period  = var.health_check_grace_period
  health_check_type          = var.health_check_type
  vpc_zone_identifier        = [aws_subnet.web_subnet-1.id, aws_subnet.web_subnet-2.id]

  launch_template {
    id      = aws_launch_template.web-server-launch-template.id
    version = "$Latest"
  }
}
// creating autoscaling group for App servers //
resource "aws_autoscaling_group" "Appserver-autoscaling-group" {
  name                       = var.apptier-private
  desired_capacity           = var.desired_capacity
  max_size                   = var.maxsize
  min_size                   = var.minsize
  health_check_grace_period  = var.health_check_grace_period
  health_check_type          = var.health_check_type
  vpc_zone_identifier        = [aws_subnet.application_subnet_1.id, aws_subnet.application_subnet_2.id]

  launch_template {
    id      = aws_launch_template.application-tier-launch-template.id
    version = "$Latest"
  }
}
