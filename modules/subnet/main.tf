provider "aws" {
  region = "us-east-1"
}

resource "aws_subnet" "subYO1" {
  vpc_id                  = var.vpc_id_value
  cidr_block              = var.cidr_block_value
  availability_zone       = var.availability_zone_value
  map_public_ip_on_launch = var.map_public_ip_on_launch_value
}

resource "aws_subnet" "subYO2" {
  vpc_id                  = var.vpc_id_value
  cidr_block              = var.cidr_block_value2
  availability_zone       = var.availability_zone_value2
  map_public_ip_on_launch = var.map_public_ip_on_launch_value
}