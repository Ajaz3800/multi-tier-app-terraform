resource "aws_iam_instance_profile" "tomcat_app_profile" {
  name = "vprofile-tomcat-app-profile"
  role = aws_iam_role.tomcat_app_role.name
}