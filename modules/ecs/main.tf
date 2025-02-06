#########################
# ECS Cluster & Service #
#########################
data "aws_vpc" "default" {
  default = true
}

resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

# Create the Task Definition using the image built & pushed to ECR
resource "aws_ecs_task_definition" "tise_task" {
  family                   = "tise_task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
      name  = "tise_container"
      image = var.image_url
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
      essential = true
    }
  ])
}

#########################
# Application Load Balancer #
#########################

resource "aws_lb" "this" {
  name               = "tise-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnets
  security_groups    = var.lb_security_groups
}

resource "aws_lb_target_group" "this" {
  name     = "tise-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
  target_type = "ip"

  health_check {
    path     = "/"
    protocol = "HTTP"
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

#########################
# ECS Service           #
#########################

resource "aws_ecs_service" "tise_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.tise_task.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnets
    security_groups = var.ecs_security_groups
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = "tise_container"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.this]
}
