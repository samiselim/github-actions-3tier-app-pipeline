
# resource "aws_key_pair" "deployer" {
#   key_name   = "deployer-key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDpVt6ZRfSE3D6neUA32uKzZ8dFLjgqaxWppJVKoMeyotaJW+wLclGWbVT8Lkeg7G3uLevOFmTLLHLiVGQr+L5KaYwQ+XenrDbsRML+bH6FUW1Wkls7HQyUTkcqC0Gf42VY7XPu+/CdwEmhm8JE/9EmVoL/G/vNeIKhYGrX01DeOQp8R4Bgh/C908tU/xpXybOaxVJlkX/9njl7nxUhNmm2IoIBJRBZ+xFxisrv5IvuXawgYnv6S/RQoIoZoAxP8Tkt2HzsLjMzo+BqikLs/Etp+dVqmp9U3EZDFZUpOqBr3EG9QIojyEceleXURyxF6rlQSsxZYWPM+UbfHhcJOug7ITpl8OyekakSG2YQz3KgbE478lZPCl0wMerrYMmb2zsRmMd/M4N+HgYR+RTXAVugVATVvAfmZvQJ3+yOvEptZ9vwaaq0GV2jcuMnX0H011n5heNRx4bRcygzClmM5fqkLG2IAKQ5KERQ5/nnb76vfpQ8L8JZ8MfUwNOBLSi4aDE= sami@localhost.localdomain"
# }
resource "aws_instance" "ec2_public" {
  count = var.ec2_config["instance_count"][0]
  ami             = var.ami
  instance_type   = var.ec2_config["instance_type"][0]
  subnet_id       = var.ec2_subnet_id
  associate_public_ip_address = true
  security_groups = [var.sg]
  key_name = var.ec2_config["key_name"][0]
  root_block_device {
    volume_size = 100 
    volume_type = "gp2" 
  }
  tags = {
    Name = var.ec2_config["instance_name"][count.index]
    "ENV" = "fp"
  }
}
