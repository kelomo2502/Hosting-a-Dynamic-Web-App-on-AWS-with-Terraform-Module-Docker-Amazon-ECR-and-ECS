variable "aws_region" {
  type    = string
  default = "us-east-1"
  description = "AWS region to deploy into"
}

variable "aws_account_id" {
  type    = string
  default = "010526247405"
  description = "AWS Account ID"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where ECS & ALB will be deployed"
  default = "vpc-06999366e5a7b9c99"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs for ECS tasks and the ALB"
  default = [ "subnet-0cd198b82cb0148a5","subnet-09f17ffa2a79a68be" ]
}

variable "lb_security_groups" {
  type        = list(string)
  description = "List of security group IDs for the ALB"
  default = [ "sg-0246ca972400a0c81" ]
}

variable "ecs_security_groups" {
  type        = list(string)
  description = "List of security group IDs for the ECS tasks"
  default = [ "sg-0246ca972400a0c81" ]
}

variable "execution_role_arn" {
  type        = string
  description = "IAM role ARN for ECS task execution"
  
}

variable "task_role_arn" {
  type        = string
  description = "IAM role ARN for ECS tasks"
}
