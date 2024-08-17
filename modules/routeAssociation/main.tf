resource "aws_route_table_association" "rt1" {

    subnet_id = var.subnet_id_value
  route_table_id = var.route_table_id
}

resource "aws_route_table_association" "rt2" {

subnet_id = var.subnet_id_value2
  route_table_id = var.route_table_id
}