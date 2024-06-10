vpc_name     = "vpc1"
vpc_cidr     = "10.0.0.0/16"

public_subnets_config = {
  subnet_count = [2]
  subnet_cidrs = ["10.0.1.0/24" , "10.0.2.0/24"]
  subnet_azs   = ["eu-west-3a" , "eu-west-3b"]
}
private_subnets_config = {
  subnet_count = [0]
  subnet_cidrs = ["10.0.3.0/24" , "10.0.4.0/24"]
  subnet_azs   = ["eu-west-3a" , "eu-west-3b"]
}
sg_config = {
  ingress_count = [{count = 4}]
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
  }]
}

oidc_cfg = {
  attachment_count = [9]
  AccountNumber = ["767397735708"]
  RepoName = ["samiselim/github-actions-3tier-app-pipeline"]
  policies_arn = [
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy",
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/IAMFullAccess"

  ]
}

