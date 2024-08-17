provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "shamail" {

  cidr_block = var.cidrYO

}