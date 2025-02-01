# modules/ecr/variables.tf

variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default = "tise_repo"
}

# variable "image_tag_mutability" {
#   description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
#   type        = string
#   default     = "MUTABLE"
# }

# variable "scan_on_push" {
#   description = "Indicates whether images are scanned after being pushed to the repository"
#   type        = bool
#   default     = true
# }

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}