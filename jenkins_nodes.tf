
resource "aws_instance" "jenkins_agent" {
    ami = data.aws_ami.amazon-2.id
    count = var.nodes_count
    instance_type = var.instance_type
    user_data = local.jenkins-nodes-userdata
    #key_name = aws_key_pair.jenkins_new_key.key_name
    key_name               = var.keyname
    subnet_id = var.subnets_id_private[count.index]
    tags = {
    Name = "Jenkins Agent-${count.index+1}"
  }
    root_block_device {
    encrypted   = false
    volume_type = var.volumes_type
  }

  vpc_security_group_ids = var.security_groups
}

