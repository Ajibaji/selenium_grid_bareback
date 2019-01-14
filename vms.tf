provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "node" {
  depends_on      = ["aws_internet_gateway.SELENIUM_GRID_GW"]
  ami             = "${var.ami}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.SELENIUM_GRID_KEY_PAIR.key_name}"
  security_groups = ["${aws_security_group.SELENIUM_GRID_Security_Group.id}"]
  subnet_id       = "${aws_subnet.SELENIUM_GRID_Subnet.id}"

  tags {
    Name = "Selenium - Node"
  }

  count = "${var.no_of_nodes}"
}

resource "aws_instance" "hub" {
  depends_on      = ["aws_internet_gateway.SELENIUM_GRID_GW"]
  ami             = "${var.ami}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.SELENIUM_GRID_KEY_PAIR.key_name}"
  security_groups = ["${aws_security_group.SELENIUM_GRID_Security_Group.id}"]
  subnet_id       = "${aws_subnet.SELENIUM_GRID_Subnet.id}"


  tags {
    Name = "Selenium - Hub"
  }
}

resource "aws_eip" "ip-hub" {
  instance = "${aws_instance.hub.id}"
}

resource "aws_eip" "ip-node" {
  count    = "${var.no_of_nodes}"
  instance = "${element(aws_instance.node.*.id, count.index)}"
}

resource "null_resource" "close_hub" {
  provisioner "local-exec" {
    command = "echo ${aws_eip.ip-hub.public_ip}-${aws_eip.ip-hub.private_ip} > hub.txt"
  }
}

resource "null_resource" "close_node" {
  count = "${var.no_of_nodes}"

  provisioner "local-exec" {
    command = "echo ${element(aws_eip.ip-node.*.public_ip, count.index)}-${element(aws_eip.ip-node.*.private_ip, count.index)} > nodes.txt"
  }
}
