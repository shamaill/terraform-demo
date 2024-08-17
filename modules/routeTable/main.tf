provider "aws" {
  region = "us-east-1"
}

resource "aws_route_table" "rtYO" {
  vpc_id = var.vpc_id_value
route {
cidr_block = var.cidr_block_value
gateway_id = var.gateway_id_value

}
}

