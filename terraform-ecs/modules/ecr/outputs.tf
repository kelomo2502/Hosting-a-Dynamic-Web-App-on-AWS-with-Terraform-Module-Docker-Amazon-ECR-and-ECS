# # modules/ecr/outputs.tf

output "repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.gbECR.repository_url
}