resource "aws_iam_role" "tomcat_app_role" {
  name = "vprofile-tomcat-app-role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
})
}

resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.tomcat_app_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}