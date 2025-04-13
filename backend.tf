terraform {
  backend "s3" {
    bucket         = "ankith-terraform-tfstate-bucket-8981900"  # Existing S3 bucket
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"  # Existing DynamoDB table
    encrypt        = true
  }
}
