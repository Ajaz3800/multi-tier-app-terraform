terraform {
    backend "s3" {
        bucket         = var.bucket_name
        key            = "prod/terraform.tfstate"
        encrypt        = true
        dynamodb_table = "terraform-locks"
    }
}

