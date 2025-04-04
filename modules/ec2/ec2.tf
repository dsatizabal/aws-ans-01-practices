resource "aws_instance" "ec2_public" {
  for_each = var.ec2_instances

  ami           = data.aws_ami.ubuntu22.id
  instance_type = each.value.instance_type

  network_interface {
    network_interface_id = aws_network_interface.nics[index(var.ec2_instances, each.value)].id
    device_index         = 0
  }

  key_name = each.value.key_name

  root_block_device {
    iops                  = each.value.root_block_device.iops
    volume_size           = each.value.root_block_device.volume_size
    volume_type           = each.value.root_block_device.volume_type
    delete_on_termination = each.value.root_block_device.delete_on_termination

    tags = {
      Name = each.value.is_public ? "ec2_public_root_ebs_${index(var.ec2_instances, each.value)}" : "ec2_private_root_ebs_${index(var.ec2_instances, each.value)}"
    }
  }

  tags = {
    Name = each.value.is_public ? "ec2_public_${index(var.ec2_instances, each.value)}" : "ec2_public_${index(var.ec2_instances, each.value)}"
  }
}
