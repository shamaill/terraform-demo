provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver1" {
  ami                    = var.ami_value
  instance_type          = var.instance_type_value
  vpc_security_group_ids = var.vpc_security_group_ids_value
  subnet_id              = var.subnet_id_value
  user_data              = var.user_data_value
}

resource "aws_instance" "webserver2" {
  ami                    = var.ami_value
  instance_type          = var.instance_type_value
  vpc_security_group_ids = var.vpc_security_group_ids_value
  subnet_id              = var.subnet_id_value2
  user_data              = var.user_data_value2
}