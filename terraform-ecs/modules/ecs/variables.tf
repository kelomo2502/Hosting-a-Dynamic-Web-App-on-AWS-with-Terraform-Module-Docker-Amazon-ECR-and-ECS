# modules/ecs/variables.tf

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "task_family" {
  description = "Family name for the ECS task definition"
  type        = string
  default = "gbFamilyECS"
}

variable "cpu" {
  description = "CPU units for the ECS task"
  type        = string
  default     = "1024"
}

variable "memory" {
  description = "Memory for the ECS task"
  type        = string
  default     = "1028"
}

variable "container_name" {
  description = "Name of the container"
  type        = string
  default = "gb_container"
}

variable "container_image" {
  description = "Docker image for the container"
  type        = string
  default     = "010526247405.dkr.ecr.us-east-1.amazonaws.com/tise_repo:v.0.0.1"
}

# variable "container_port" {
#   description = "Port on which the container listens"
#   type        = number
# }

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
  default = "tise_service"
}

variable "desired_count" {
  description = "Number of tasks to run"
  type        = number
  default     = 2
}

# variable "subnets" {
#   description = "List of subnets for the ECS service"
#   type        = list(string)
# }

# variable "security_groups" {
#   description = "List of security groups for the ECS service"
#   type        = list(string)
# }

# variable "environment_variables" {
#   description = "Environment variables for the container"
#   type        = list(map(string))
#   default     = []
# }

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}