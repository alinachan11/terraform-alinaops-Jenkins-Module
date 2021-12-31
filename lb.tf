resource "aws_lb" "jenkins_master_alb" {
  name               = "jenkins-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            =  var.subnets_id_public
  security_groups    = var.security_groups

  tags = {
    "Name" = "jenkins-alb-${var.vpc_id}"
  }
}


resource "aws_lb_listener" "jenkins_master" {
  load_balancer_arn = aws_lb.jenkins_master_alb.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins_master.arn
  }
}

resource "aws_lb_target_group" "jenkins_master" {
  name     = "jenkins-master-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled = true
    path    = "/"
  }

  tags = {
    "Name" = "jenkins_master_target_group_${var.vpc_id}"
  }
}

resource "aws_lb_target_group_attachment" "jenkins_master" {
  target_group_arn = aws_lb_target_group.jenkins_master.id
  target_id        = aws_instance.jenkins_server.id
  port             = 8080
}

