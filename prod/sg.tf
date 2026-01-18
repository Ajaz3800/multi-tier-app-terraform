resource "aws_security_group" "tomcat_sg" {
  name        = "tomcat-sg"
  description = "Security group for Tomcat servers"
  vpc_id      = aws_vpc.web_app_vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
    description = "Allow traffic from Load Balancer to Tomcat"
    }
    egress {
    from_port   = 0
    to_port     = 0     
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
    tags = {
        Name = "tomcat-sg"
    }
}

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow internet traffic to ALB"
  vpc_id      = aws_vpc.web_app_vpc.id

  ingress {
    description = "HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Forward traffic to backend"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "rabbitmq_sg" {
  name        = "rabbitmq-sg"
  description = "Security group for RabbitMQ servers"
  vpc_id      = aws_vpc.web_app_vpc.id

  ingress {
    from_port   = 5672
    to_port     = 5672
    protocol    = "tcp"
    security_groups = [aws_security_group.tomcat_sg.id]
    description = "Allow traffic from Load Balancer to RabbitMQ"
    }
    egress {
    from_port   = 0
    to_port     = 0     
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
    tags = {
        Name = "rabbitmq-sg"
    }
}

resource "aws_security_group" "memcached_sg" {
  name        = "memcached-sg"
  description = "Security group for Memcached servers"
  vpc_id      = aws_vpc.web_app_vpc.id

  ingress {
    from_port   = 11211
    to_port     = 11211
    protocol    = "tcp"
    security_groups = [aws_security_group.tomcat_sg.id]
    description = "Allow traffic from Load Balancer to Memcached"
    }
    egress {
    from_port   = 0
    to_port     = 0     
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
    tags = {
        Name = "memcached-sg"
    }
}

resource "aws_security_group" "mysql_sg" {
  name        = "mysql-sg"
  description = "Security group for mysql servers"
  vpc_id      = aws_vpc.web_app_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.tomcat_sg.id]
    description = "Allow traffic from Load Balancer to mysql"
    }
    egress {
    from_port   = 0
    to_port     = 0     
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
    tags = {
        Name = "mysql-sg"
    }
}