resource "aws_lb" "nlb" {

  name               = "picterra-asg"

  load_balancer_type = "network"


  subnets             = [aws_subnet.pictory-public-1.id, aws_subnet.pictory-public-2.id]

  enable_cross_zone_load_balancing = true




}

resource "aws_lb_target_group" "lbtg" {

  name     = "TG-terra"

  port     = "80"

  protocol = "TCP"

  vpc_id   = aws_vpc.power.id

  deregistration_delay = "300"

  health_check {

    enabled = "true"

    healthy_threshold = 3

    unhealthy_threshold = 3

    interval = 30

    path = "/"

    port = 80



  }

 

}

resource "aws_lb_listener" "front_end" {

  load_balancer_arn = "${aws_lb.nlb.arn}"

  port              = "80"

  protocol          = "TCP"

  default_action {

    target_group_arn = "${aws_lb_target_group.lbtg.arn}"

    type             = "forward"

  }

}