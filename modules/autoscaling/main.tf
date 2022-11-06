resource "aws_autoscaling_group" "guru" {
  launch_configuration = var.launch_configuration_name
  vpc_zone_identifier  = var.private_subnets
  target_group_arns    = [var.aws_lb_target_group_arn]
  health_check_type    = "ELB"

  min_size = var.min_size
  max_size = var.max_size

  tag {
    key                 = "Name"
    value               = var.cluster_name
    propagate_at_launch = true
  }
}