variable "access_key" {
  default = "ABC123"
}

variable "secret_key" {
  default = "ABC123"
}

variable "region" {
  default = "eu-west-2"
}

variable "availabilityZone" {
  default = "eu-west-2a"
}

variable "ami" {
  default = "ami-0aff88ed576e63e90"
}

variable "no_of_nodes" {}

variable "instanceTenancy" {
  default = "default"
}

variable "dnsSupport" {
  default = true
}

variable "dnsHostNames" {
  default = false
}

variable "vpcCIDRblock" {
  default = "10.0.0.0/16"
}

variable "subnetCIDRblock" {
  default = "10.0.1.0/24"
}

variable "destinationCIDRblock" {
  default = "0.0.0.0/0"
}

variable "ingressCIDRblock" {
  type = "list"
  default = [ "0.0.0.0/0" ]
}

variable "egressCIDRblock" {
  type = "list"
  default = [ "0.0.0.0/0" ]
}

variable "mapPublicIP" {
  default = true
}

variable "path_to_public_key" {
  default = "encrypted_bertha.pem.pub"
}

