terraform {
  backend "s3" {
    bucket         = "kelomochenkobkt"    # Replace with your S3 bucket name
    key            = "hosting_dynamic_website/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"  # State locking with DynamoDB
  }
}
