
provider "aws" {
  region = "us-east-1"
}
resource "aws_internet_gateway" "gateYO" {

  vpc_id = var.vpc_id_value
}