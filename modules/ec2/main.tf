resource "aws_launch_configuration" "guru" {
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = [var.security_group]

  user_data = templatefile("${path.module}/userdata.sh", {
    server_port = var.server_port
  })

  # Required when using a launch configuration with an auto scaling group.
  lifecycle {
    create_before_destroy = true
  }

}