variable "vpc_id_value" {
  description = "The ID of the VPC"
  type        = string
}

variable "from_port_value" {
  description = "Starting port range for security group rule 1"
  type        = number
}

variable "to_port_value" {
  description = "Ending port range for security group rule 1"
  type        = number
}

variable "protocol_value" {
  description = "Protocol for security group rule 1"
  type        = string
}

variable "cidr_block_value" {
  description = "CIDR block for security group rule 1"
  type        = list(string)
}

variable "description_value" {
  description = "Description for security group rule 1"
  type        = string
}

variable "from_port_value2" {
  description = "Starting port range for security group rule 2"
  type        = number
}

variable "to_port_value2" {
  description = "Ending port range for security group rule 2"
  type        = number
}

variable "protocol_value2" {
  description = "Protocol for security group rule 2"
  type        = string
}

variable "description_value2" {
  description = "Description for security group rule 2"
  type        = string
}

variable "name_value" {
  description = "Name of the security group"
  type        = string
}

variable "from_port_value3" {
  description = "Starting port range for security group rule 3"
  type        = number
}

variable "to_port_value3" {
  description = "Ending port range for security group rule 3"
  type        = number
}

variable "protocol_value3" {
  description = "Protocol for security group rule 3"
  type        = string
}
