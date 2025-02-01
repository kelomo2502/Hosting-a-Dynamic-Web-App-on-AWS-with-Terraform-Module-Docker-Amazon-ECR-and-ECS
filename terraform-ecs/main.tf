# main.tf

provider "aws" {
  region = var.aws_region
}

module "ecr" {
  source = "./modules/ecr"

  repository_name      = var.ecr_repository_name
  # image_tag_mutability = var.ecr_image_tag_mutability
  # scan_on_push         = var.ecr_scan_on_push
  # tags                 = var.tags
}

module "ecs" {
  source = "./modules/ecs"

  cluster_name          = var.ecs_cluster_name
  # task_family           = var.ecs_task_family
  # cpu                   = var.ecs_cpu
  # memory                = var.ecs_memory
  # container_name        = var.ecs_container_name
  # container_image       = module.ecr.repository_url
  # container_port        = var.ecs_container_port
  # service_name          = var.ecs_service_name
  # desired_count         = var.ecs_desired_count
  # subnets               = var.ecs_subnets
  # security_groups       = var.ecs_security_groups
  # environment_variables = var.ecs_environment_variables
  tags                  = var.tags
}