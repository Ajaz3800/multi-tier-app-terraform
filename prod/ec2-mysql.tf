data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon

}
resource "aws_instance" "mysql_instance" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.mwa_key.key_name
  vpc_security_group_ids = [aws_security_group.mysql_sg.id]
  subnet_id              = aws_subnet.private_subnet_1.id
  user_data              = file("./scripts/mysql.sh")

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  volume_tags = {
    Name = "mysql-EBS"
  }

  tags = {
    Name = "mysql-instance"
  }
}
