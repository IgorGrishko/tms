resource "aws_s3_bucket" "backend_bucket" {
  bucket = "igorgrishko-terraform-backend"

  tags = {
    "Name" = "igorgrishko"
    "Env"  = "dev"
  }
}

resource "aws_s3_bucket_acl" "backend_bucket_acl" {
  bucket = aws_s3_bucket.backend_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "backet_versioning" {
  bucket = aws_s3_bucket.backend_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
