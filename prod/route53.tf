resource "aws_route53_zone" "private_zone" {
  name = "vprofile.net"
  vpc {
    vpc_id = aws_vpc.web_app_vpc.id
  }
  tags = {
    Environment = "prod"
  }
}

resource "aws_route53_record" "mysql_record" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "db01.vprofile.net"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.mysql_instance.private_ip]
}

resource "aws_route53_record" "rabbitmq_record" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "rabbitmq.vprofile.net"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.rabbitmq_instance.private_ip]
}

resource "aws_route53_record" "memcached_record" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "mc01.vprofile.net"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.memcached_instance.private_ip]
}