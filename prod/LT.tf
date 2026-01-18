resource "aws_launch_template" "tomcat-app" {
  name                   = "vprofile-launch-template"
  image_id               = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.mwa_key.key_name
  vpc_security_group_ids = [var.security_group_id]

  
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }
  user_data = file("tomcat_ubuntu.sh")
  iam_instance_profile {
    name = aws_iam_instance_profile.tomcat_app_profile.name
  }
}