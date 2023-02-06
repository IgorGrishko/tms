data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "igorgrishko-terraform-backend"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "app_server" {
  ami                         = "ami-026b57f3c383c2eec" # ami of the instance
  instance_type               = "t2.micro"              # instance type
  associate_public_ip_address = true
  count                       = length(data.terraform_remote_state.network.outputs.network_avialability_zones)
  availability_zone           = data.terraform_remote_state.network.outputs.network_avialability_zones[count.index]
  subnet_id                   = data.terraform_remote_state.network.outputs.subnets_public[count.index]
  security_groups             = [data.terraform_remote_state.network.outputs.security_group_public]

  tags = {
    "Name" = "igorgrishko+${data.terraform_remote_state.network.outputs.network_avialability_zones[count.index]}"
  }
}
