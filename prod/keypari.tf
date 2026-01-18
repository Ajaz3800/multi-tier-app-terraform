resource "aws_key_pair" "mwa_key" {
  key_name   = "mwa-key"
  public_key = file(var.aws_key_pair)
}