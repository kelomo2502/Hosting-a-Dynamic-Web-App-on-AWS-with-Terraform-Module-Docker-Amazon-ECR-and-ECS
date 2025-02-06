
provider "aws" {
  region = var.aws_region
}

module "ecr" {
  source           = "./ecr"
  aws_region       = var.aws_region
  repository_name  = "tise_repo"
}

module "ecs" {
  source              = "./ecs"
  aws_region          = var.aws_region
  cluster_name        = "tise_cluster"
  service_name        = "tise_service"
  image_url           = "${module.ecr.repository_url}:latest"
  vpc_id              = var.vpc_id
  subnets             = var.subnets
  lb_security_groups  = var.lb_security_groups
  ecs_security_groups = var.ecs_security_groups
  execution_role_arn  = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn       = aws_iam_role.ecs_task_role.arn
}

# Build and push the docker image using a null_resource and local-exec.
resource "null_resource" "docker_build_push" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Logging into ECR..."
      aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com

      echo "Building Docker image..."
      docker build -t tise_repo -f Dockerfile .

      echo "Tagging Docker image..."
      docker tag tise_repo:latest ${module.ecr.repository_url}:latest

      echo "Pushing Docker image to ECR..."
      docker push ${module.ecr.repository_url}:latest
    EOT
  }
  # Ensure ECR repository is created before building/pushing the image
  depends_on = [module.ecr]
}
