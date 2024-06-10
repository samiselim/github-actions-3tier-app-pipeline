
resource "aws_security_group" "sg" {
  name        = "${var.sg_name}"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.sg_name}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  count = var.sg_config["ingress_count"][0]["count"]
  security_group_id = aws_security_group.sg.id
  from_port         = var.sg_config["ingress_rule"][count.index]["port"]
  to_port           = var.sg_config["ingress_rule"][count.index]["port"]
  ip_protocol       = var.sg_config["ingress_rule"][count.index]["protocol"]
  cidr_ipv4         = var.sg_config["ingress_rule"][count.index]["cidr"]
  tags = {
    Name = "ingress"
  }
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}
