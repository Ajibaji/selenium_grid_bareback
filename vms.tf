provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "node" {
  depends_on                  = ["aws_internet_gateway.SELENIUM_GRID_GW"]
  ami                         = "${var.ami}"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.SELENIUM_GRID_KEY_PAIR.key_name}"
  security_groups             = ["${aws_security_group.SELENIUM_GRID_Security_Group.id}"]
  subnet_id                   = "${aws_subnet.SELENIUM_GRID_Subnet.id}"

  tags {
    Name = "Selenium - Node ${count.index}"
  }

  count = "${var.no_of_nodes}"
 
  provisioner "local-exec" {
    command = "echo ${self.public_ip}-${self.private_ip} >> nodes.txt"
  }

}

resource "aws_instance" "hub" {
  depends_on                  = ["aws_internet_gateway.SELENIUM_GRID_GW"]
  ami                         = "${var.ami}"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.SELENIUM_GRID_KEY_PAIR.key_name}"
  security_groups             = ["${aws_security_group.SELENIUM_GRID_Security_Group.id}"]
  subnet_id                   = "${aws_subnet.SELENIUM_GRID_Subnet.id}"

  tags {
    Name = "Selenium - Hub"
  }
  
  provisioner "local-exec" {
    command = "echo ${aws_instance.hub.public_ip}-${aws_instance.hub.private_ip} > hub.txt"
  }

}
