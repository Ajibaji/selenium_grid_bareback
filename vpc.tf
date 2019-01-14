# Create VPC/Subnet/Security Group/ACL

resource "aws_vpc" "SELENIUM_GRID_VPC" {
  cidr_block           = "${var.vpcCIDRblock}"
  instance_tenancy     = "${var.instanceTenancy}" 
  enable_dns_support   = "${var.dnsSupport}" 
  enable_dns_hostnames = "${var.dnsHostNames}"

  tags {
    Name = "SELENIUM GRID VPC"
  }
}

resource "aws_subnet" "SELENIUM_GRID_Subnet" {
  vpc_id                  = "${aws_vpc.SELENIUM_GRID_VPC.id}"
  cidr_block              = "${var.subnetCIDRblock}"
  availability_zone       = "${var.availabilityZone}"

  tags = {
   Name = "SELENIUM GRID Subnet"
  }
} 

resource "aws_key_pair" "SELENIUM_GRID_KEY_PAIR" {
  key_name = "encrypted_bertha"
  public_key = "${file("${var.path_to_public_key}")}"
}

resource "aws_security_group" "SELENIUM_GRID_Security_Group" {
  vpc_id       = "${aws_vpc.SELENIUM_GRID_VPC.id}"
  name         = "Selenium Grid Security Group"
  description  = "22/4444/5555/echo"
  ingress {
    cidr_blocks = "${var.ingressCIDRblock}"  
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = "${var.ingressCIDRblock}"  
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = "${var.ingressCIDRblock}"  
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = "${var.ingressCIDRblock}"  
    from_port   = 4444
    to_port     = 4444
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = "${var.ingressCIDRblock}"  
    from_port   = 5555
    to_port     = 5555
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = "${var.ingressCIDRblock}"  
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
  }

  ingress {
    cidr_blocks = "${var.ingressCIDRblock}"  
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
  }

  egress {
    cidr_blocks = "${var.egressCIDRblock}"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
        Name = "SELENIUM GRID Security Group"
  }
} 

resource "aws_network_acl" "SELENIUM_GRID_Security_ACL" {
  vpc_id = "${aws_vpc.SELENIUM_GRID_VPC.id}"
  subnet_ids = [ "${aws_subnet.SELENIUM_GRID_Subnet.id}" ]
  
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}" 
    from_port  = 22
    to_port    = 22
  }
 
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 80
    to_port    = 80
  } 
  
  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 1024
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 500
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 4444
    to_port    = 4444
  }

  ingress {
    protocol   = "icmp"
    rule_no    = 600
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "icmp"
    rule_no    = 700
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 0
    to_port    = 0
    icmp_type  = 8
  }
  
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 0
    to_port    = 0
  }
  
  tags {
    Name = "SELENIUM GRID ACL"
  }
} 

resource "aws_internet_gateway" "SELENIUM_GRID_GW" {
  vpc_id = "${aws_vpc.SELENIUM_GRID_VPC.id}"
  
  tags {
        Name = "SELENIUM GRID Internet Gateway"
    }
} 

resource "aws_route_table" "SELENIUM_GRID_route_table" {
  vpc_id = "${aws_vpc.SELENIUM_GRID_VPC.id}"
  
  route {
    cidr_block = "${var.destinationCIDRblock}"
    gateway_id = "${aws_internet_gateway.SELENIUM_GRID_GW.id}"
  }
 
  tags {
    Name = "SELENIUM GRID Route Table"
  }
} 

resource "aws_route_table_association" "SELENIUM_GRID_association" {
  subnet_id      = "${aws_subnet.SELENIUM_GRID_Subnet.id}"
  route_table_id = "${aws_route_table.SELENIUM_GRID_route_table.id}"
} 
