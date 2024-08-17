provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "vpcsg" {
  name   = var.name_value
  vpc_id = var.vpc_id_value

  ingress {
    description = var.description_value
    from_port   = var.from_port_value
    to_port     = var.to_port_value
    protocol    = var.protocol_value
    cidr_blocks = var.cidr_block_value
  }
  ingress {
    description = var.description_value2
    from_port   = var.from_port_value2
    to_port     = var.to_port_value2
    protocol    = var.protocol_value2
    cidr_blocks = var.cidr_block_value
  }

  egress {
    from_port   = var.from_port_value3
    to_port     = var.to_port_value3
    protocol    = var.protocol_value3
    cidr_blocks = var.cidr_block_value
  }

  tags = {
    Name = "Web-sg"
  }
}
