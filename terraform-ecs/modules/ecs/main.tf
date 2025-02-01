# modules/ecs/main.tf

resource "aws_ecs_cluster" "gbECS" {
  name = var.cluster_name

  tags = var.tags
}

 resource "aws_ecs_task_definition" "gbECS" {
   family                   = var.task_family
#   network_mode             = "awsvpc"
   requires_compatibilities = ["EC2"]
   cpu                      = var.cpu
   memory                   = var.memory
#   execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

   container_definitions = jsonencode([
     {
       name      = var.container_name
       image     = var.container_image
#       essential = true

#       portMappings = [
#         {
#           containerPort = var.container_port
#           hostPort      = var.container_port
#         }
#       ]

#       environment = var.environment_variables
     }
  ])

#   tags = var.tags
 }

 resource "aws_ecs_service" "gbECS" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.gbECS.id
  task_definition = aws_ecs_task_definition.gbECS.arn
  desired_count   = var.desired_count
  launch_type     = "EC2"

#   network_configuration {
#     subnets         = var.subnets
#     security_groups = var.security_groups
#     assign_public_ip = true
#   }

#   tags = var.tags
 }

# resource "aws_iam_role" "ecs_task_execution_role" {
#   name = "${var.task_family}-ecs-task-execution-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "ecs-tasks.amazonaws.com"
#         }
#       }
#     ]
#   })

#   tags = var.tags
# }

# resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }