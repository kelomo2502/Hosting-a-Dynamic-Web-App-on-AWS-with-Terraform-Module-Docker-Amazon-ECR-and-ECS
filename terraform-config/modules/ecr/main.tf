# modules/ecr/main.tf

resource "aws_ecr_repository" "gbECR" {
  name = var.repository_name

  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = var.tags
}

# output "repository_url" {
#   value = aws_ecr_repository.gbECR.repository_url
# }