data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "igorgrishko-terraform-backend"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_db_subnet_group" "default" {
  subnet_ids = data.terraform_remote_state.network.outputs.subnets_private

  tags = {
    "Name" = "igorgrishko"
  }
}

resource "aws_db_instance" "default" {
  identifier           = "igorgrishko"
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0.28"
  db_subnet_group_name = aws_db_subnet_group.default.name
  instance_class       = "db.t2.micro"
  name                 = "wordpress"
  username             = "admin"
  password             = "Passw0rd"
  skip_final_snapshot = true
  publicly_accessible = false
}
