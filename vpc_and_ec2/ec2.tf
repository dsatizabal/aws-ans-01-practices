data "aws_ami" "ubuntu22" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_network_interface" "public_nic" {
  subnet_id = aws_subnet.public_subnets[0].id

  security_groups = [
    aws_security_group.allow_ssh.id
  ]

  tags = {
    Name = "ec2_public_nic"
  }
}

resource "aws_network_interface" "private_nic_1" {
  subnet_id = aws_subnet.private_subnets[0].id

  security_groups = [
    aws_security_group.allow_ssh.id
  ]

  tags = {
    Name = "ec2_private_nic_1"
  }
}

resource "aws_network_interface" "private_nic_2" {
  subnet_id = aws_subnet.private_subnets[2].id

  security_groups = [
    aws_security_group.allow_ssh.id
  ]

  tags = {
    Name = "ec2_private_nic_2"
  }
}

resource "aws_instance" "ec2_public" {
  ami           = data.aws_ami.ubuntu22.id
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.public_nic.id
    device_index         = 0
  }

  key_name = "tf-test"

  root_block_device {
    iops                  = 100
    volume_size           = 64
    volume_type           = "gp3"
    delete_on_termination = true

    tags = {
      Name = "ec2_public_root_ebs"
    }
  }

  tags = {
    Name = "ec2_public_1"
  }
}

resource "aws_instance" "ec2_private_1" {
  ami           = data.aws_ami.ubuntu22.id
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.private_nic_1.id
    device_index         = 0
  }

  key_name = "tf-test"

  root_block_device {
    iops                  = 100
    volume_size           = 64
    volume_type           = "gp3"
    delete_on_termination = true

    tags = {
      Name = "ec2_private_1_root_ebs"
    }
  }

  tags = {
    Name = "ec2_private_1"
  }
}

resource "aws_instance" "ec2_private_2" {
  ami           = data.aws_ami.ubuntu22.id
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.private_nic_2.id
    device_index         = 0
  }

  key_name = "tf-test"

  root_block_device {
    iops                  = 100
    volume_size           = 64
    volume_type           = "gp3"
    delete_on_termination = true

    tags = {
      Name = "ec2_private_2_root_ebs"
    }
  }

  tags = {
    Name = "ec2_private_2"
  }
}
