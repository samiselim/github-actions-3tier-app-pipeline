# data "aws_instance" "jenkins"{
#   filter {
#     name= "tag:Name"
#     values = ["Jenkins"]
#   }
#   # depends_on = [ module.jenkins_instance ]
# }

# data "aws_ami" "aws_image_latest" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240423"]
#   }
# }

data "aws_ami" "amazon-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20240131.0-x86_64-gp2"]
  }
}
data "aws_ami" "amazon-3" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.20240513.0-kernel-6.1-x86_64"]
  }
}
