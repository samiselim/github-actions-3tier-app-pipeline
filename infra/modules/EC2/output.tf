output "public_ec2_ips" {
  value = aws_instance.ec2_public[*].public_ip
}
