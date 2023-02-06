variable "tags" {
  type = map(any)
  default = {
    Project     = "igorgrishko-wordpress"
    Environment = "dev"
    Terraform   = true
  }
}
