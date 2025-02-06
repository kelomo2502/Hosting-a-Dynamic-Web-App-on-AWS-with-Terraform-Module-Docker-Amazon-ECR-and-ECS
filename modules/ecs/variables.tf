variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service"
}

variable "image_url" {
  type        = string
  description = "Image URL (from ECR) to deploy in the task"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID where resources are deployed"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs for ECS tasks and the ALB"
}

variable "lb_security_groups" {
  type        = list(string)
  description = "List of security groups for the ALB"
}

variable "ecs_security_groups" {
  type        = list(string)
  description = "List of security groups for the ECS tasks"

}

variable "execution_role_arn" {
  type        = string
  description = "IAM role ARN for ECS task execution"

}

variable "task_role_arn" {
  type        = string
  description = "IAM role ARN for the ECS task"

}
