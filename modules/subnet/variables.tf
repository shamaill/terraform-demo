variable "vpc_id_value" {
  description = "The ID of the VPC"
  type        = string
}

variable "cidr_block_value" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "cidr_block_value2" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "availability_zone_value" {
  description = "The availability zone for the subnet"
  type        = string
}

variable "availability_zone_value2" {
  description = "The second availability zone for the subnet"
  type        = string
}

variable "map_public_ip_on_launch_value" {
  description = "Boolean flag to enable/disable public IP on launch"
  type        = bool
}


