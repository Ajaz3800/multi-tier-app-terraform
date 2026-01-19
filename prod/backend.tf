terraform {
    backend "s3" {
        bucket         = "multi-tier-web-backend-bucket-123456"
        key            = "prod/terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
        dynamodb_table = "terraform-locks"
    }
}

