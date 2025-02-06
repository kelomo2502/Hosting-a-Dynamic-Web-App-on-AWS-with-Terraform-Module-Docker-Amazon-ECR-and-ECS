variable "aws_region" {
  type    = string
  description = "AWS region to deploy into"
}

variable "repository_name" {
  type        = string
  description = "Name of the ECR repository"
}
