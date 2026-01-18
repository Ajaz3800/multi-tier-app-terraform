resource "aws_iam_policy" "ssm_param_policy" {
  name = "vprofile-ssm-parameter-read"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "ssm:GetParameter",
        "ssm:GetParameters"
      ]
      Resource = [
        "arn:aws:ssm:us-east-1:*:parameter/vprofile/*"
      ]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_param_attach" {
  role       = aws_iam_role.tomcat_app_role.name
  policy_arn = aws_iam_policy.ssm_param_policy.arn
}
