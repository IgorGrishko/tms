terraform {
  backend "s3" {
    bucket = "igorgrishko-terraform-backend"
    key    = "instances/terraform.tfstate"
    region = "us-east-1"
  }
}
