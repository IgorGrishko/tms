terraform {
  backend "s3" {
    bucket = "igorgrishko-terraform-backend"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}
