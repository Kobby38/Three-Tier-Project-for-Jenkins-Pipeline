
# Creating launch template for Frontend
resource "aws_launch_template" "web-server-launch-template" {
  name_prefix            = var.webtier-launch-template
  image_id               = var.linux-ami
  instance_type          = var.instance-type
  vpc_security_group_ids = [aws_security_group.Webtier-SG.id, ]
  user_data              = filebase64("${"install_apache.sh"}")
  key_name               = var.key_name


}
# Creating launch template for Application Tier
resource "aws_launch_template" "application-tier-launch-template" {
  name_prefix            = var.app_tier_launch_template_23
  image_id               = var.linux-ami
  instance_type          = var.instance-type
  vpc_security_group_ids = [aws_security_group.App-tier-SG.id]
  key_name               = var.key_name
}
