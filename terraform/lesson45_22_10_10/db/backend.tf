terraform {
  backend "s3" {
    bucket = "igorgrishko-terraform-backend"
    key    = "db/terraform.tfstate"
    region = "us-east-1"
  }
}
