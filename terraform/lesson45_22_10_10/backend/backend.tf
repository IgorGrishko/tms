terraform {
  backend "s3" {
    bucket = "igorgrishko-terraform-backend"
    key    = "s3_bucket/terraform.tfstate"
    region = "us-east-1"
  }
}
