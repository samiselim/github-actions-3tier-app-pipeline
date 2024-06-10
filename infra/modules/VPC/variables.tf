variable "vpc_cidr" {
  type = string
  description = "Cidr Block for VPC ex: 10.0.0.0/16"
}
variable "vpc_name" {
  type = string
  description = "Name of VPC"
}
variable "private_subnets_config" {
    type = map(any)
}
variable "public_subnets_config" {
    type = map(any)
}
