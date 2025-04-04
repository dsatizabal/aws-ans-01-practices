resource "aws_network_interface" "nics" {
  for_each = var.ec2_instances

  subnet_id = each.value.is_public ? var.public_subnets_ids[each.value.subnet_index] : var.private_subnets_ids[each.value.subnet_index]

  security_groups = [
    aws_security_group.allow_ssh.id
  ]

  tags = {
    Name = each.value.is_public ? "ec2_public_nic_${index(tolist(var.ec2_instances), each.value)}" : "ec2_private_nic_${index(tolist(var.ec2_instances), each.value)}"
  }
}
