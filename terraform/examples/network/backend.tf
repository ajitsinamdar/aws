/* Terraform backend configuration */

terraform {
  backend "s3" {
    bucket = "terraform-backend-s3-bucket-name"
    key    = "path/to/statefile"
    region = "us-east-2"
  }
}