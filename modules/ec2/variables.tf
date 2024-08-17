variable "ami_value" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type_value" {
  description = "The type of instance to use"
  type        = string
}

variable "vpc_security_group_ids_value" {
  description = "A list of security group IDs to associate with the instance"
  type        = list(string)
}

variable "user_data_value" {
  description = "The user data to provide when launching the instance"
  type        = string
}

variable "subnet_id_value" {
  description = "The ID of the subnet to associate with the instance"
  type        = string
}

variable "user_data_value2" {
  description = "The user data to provide when launching the second instance"
  type        = string
}

variable "subnet_id_value2" {
  description = "The ID of the second subnet to associate with the second instance"
  type        = string
}
