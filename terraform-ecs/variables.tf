# variables.tf

variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "tise_repo"
}

variable "ecr_image_tag_mutability" {
  description = "The tag mutability setting for the ECR repository"
  type        = string
  default     = "MUTABLE"
}

variable "ecr_scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the ECR repository"
  type        = bool
  default     = true
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "tise_cluster"
}

variable "ecs_task_family" {
  description = "Family name for the ECS task definition"
  type        = string
  default     = "tise_cluster_family"
}

variable "ecs_cpu" {
  description = "CPU units for the ECS task"
  type        = string
  default     = "1024"
}

variable "ecs_memory" {
  description = "Memory for the ECS task"
  type        = string
  default     = "2048"
}

variable "ecs_container_name" {
  description = "Name of the container"
  type        = string
  default     = "tise_container"
}

variable "ecs_container_port" {
  description = "Port on which the container listens"
  type        = number
  default     = 3000
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
  default     = "tise_service"
}

variable "ecs_desired_count" {
  description = "Number of tasks to run"
  type        = number
  default     = 2
}

variable "ecs_subnets" {
  description = "List of subnets for the ECS service"
  type        = list(string)
  default     = ["subnet-0cd198b82cb0148a5"]
}

variable "ecs_security_groups" {
  description = "List of security groups for the ECS service"
  type        = list(string)
  default     = ["sg-0246ca972400a0c81"]
}

variable "ecs_environment_variables" {
  description = "Environment variables for the container"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default = {
    Name = "DEV"
  }
}