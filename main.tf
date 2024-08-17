
module "vpc" {
  source = "./modules/vpc"
  cidrYO = "10.0.0.0/16"
}
module "subnet" {
source = "./modules/subnet"
vpc_id_value = module.vpc.vpc_id
cidr_block_value = "10.0.0.0/24"
availability_zone_value = "us-east-1a"
map_public_ip_on_launch_value = true
availability_zone_value2 = "us-east-1b"
cidr_block_value2 = "10.0.1.0/24"
}



module "gateway" {
  source = "./modules/gateway"
  vpc_id_value = module.vpc.vpc_id
}

module "routeTable" {
  source = "./modules/routeTable"
  vpc_id_value = module.vpc.vpc_id
  cidr_block_value = "0.0.0.0/0"
gateway_id_value = module.gateway.gateway_id
subnet_id_value = module.subnet.subnet_id1
subnet_id_value2 = module.subnet.subnet_id2
}

module "aws_route_table_association" {
  source = "./modules/routeAssociation"
  route_table_id = module.routeTable.route_table_id
  subnet_id_value = module.subnet.subnet_id1
  subnet_id_value2 = module.subnet.subnet_id2
}



module "securityGroup" {
  source = "./modules/securityGroup"
  vpc_id_value = module.vpc.vpc_id
  from_port_value = 80
  from_port_value2 = 22
  from_port_value3 = 0
  to_port_value = 80
  to_port_value2 = 22
  to_port_value3 = 0
  protocol_value = "tcp"
  protocol_value2 = "tcp"
  protocol_value3 = "-1"
  cidr_block_value = ["0.0.0.0/0"]
  name_value = "web"
  description_value = "http"
 description_value2 = "ssh"
}

module "ec2" {
  source = "./modules/ec2"
  ami_value = "ami-04a81a99f5ec58529"
  subnet_id_value = module.subnet.subnet_id1
  subnet_id_value2 = module.subnet.subnet_id2
  vpc_security_group_ids_value = [module.securityGroup.security_group_id]
  instance_type_value = "t2.micro"
  user_data_value = base64encode(file("userdata.sh"))
  user_data_value2 = base64encode(file("userdata1.sh"))
}

resource "aws_lb" "myalb" {
  name               = "myalb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [module.securityGroup.security_group_id]
  subnets         = [module.subnet.subnet_id1,module.subnet.subnet_id2]

  tags = {
    Name = "web"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "myTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = module.ec2.instance_id1
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = module.ec2.instance_id2
  port             = 80
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
  }
}

output "loadbalancerdns" {
  value = aws_lb.myalb.dns_name
}


