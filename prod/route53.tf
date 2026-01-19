resource "aws_route53_zone" "prod_zone" {
  name = "vprofile.com"
  tags = {
    Environment = "prod"
  }
}

resource "aws_route53_record" "mysql_record" {
  zone_id = aws_route53_zone.prod_zone.zone_id
  name    = "mysql.vprofile.com"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.mysql.private_subnet_1.id]
}

