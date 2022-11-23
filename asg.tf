// creating autoscaling group for webserver //
resource "aws_autoscaling_group" "Webserver-autoscaling-group" {
  name                       = "Webserver-ASG"
  desired_capacity           = 4
  max_size                   = 6
  min_size                   = 4
  health_check_grace_period  = 300
  health_check_type          = "ELB"
  vpc_zone_identifier        = [aws_subnet.web_subnet-1.id, aws_subnet.web_subnet-2.id]

  launch_template {
    id      = aws_launch_template.web-server-launch-template.id
    version = "$Latest"
  }
}
// creating autoscaling group for App servers //
resource "aws_autoscaling_group" "Appserver-autoscaling-group" {
  name                       = "Appserver-ASG"
  desired_capacity           = 4
  max_size                   = 6
  min_size                   = 4
  health_check_grace_period  = 300
  health_check_type          = "ELB"
  vpc_zone_identifier        = [aws_subnet.application_subnet_1.id, aws_subnet.application_subnet_2.id]

  launch_template {
    id      = aws_launch_template.application-tier-launch-template.id
    version = "$Latest"
  }
}
