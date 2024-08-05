vpc_name     = "vpc1"
vpc_cidr     = "10.0.0.0/16"

public_subnets_config = {
  subnet_count = [0]
  subnet_cidrs = ["10.0.1.0/24" , "10.0.2.0/24"]
  subnet_azs   = ["eu-west-3a" , "eu-west-3b"]
}
private_subnets_config = {
  subnet_count = [3]
  subnet_cidrs = ["10.0.3.0/24" , "10.0.4.0/24" , "10.0.5.0/24"]
  subnet_azs   = ["eu-west-3a" , "eu-west-3b" , "eu-west-3c"]
}
sg_config = {
  ingress_count = [{count = 6}]
  ingress_rule = [{
    port = 443
    protocol = "tcp"
    cidr = "0.0.0.0/0"
  } , 
  { port = 80
    protocol = "tcp"
    cidr = "0.0.0.0/0"
  },
  { port = 22
    protocol = "tcp"
    cidr = "0.0.0.0/0"
  },
  { port = 8080
    protocol = "tcp"
    cidr = "0.0.0.0/0"
  },
  { port = 3000
    protocol = "tcp"
    cidr = "0.0.0.0/0"
  },
  { port = 3001
    protocol = "tcp"
    cidr = "0.0.0.0/0"
  }]
}
