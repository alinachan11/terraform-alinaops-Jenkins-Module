
resource "aws_instance" "jenkins_agent" {
    ami = data.aws_ami.amazon-2.id
    count = var.nodes_count
    instance_type = var.instance_type
    user_data = local.jenkins-nodes-userdata
    iam_instance_profile   = var.eks_control_profile_name
    #key_name = aws_key_pair.jenkins_new_key.key_name
    key_name               = var.keyname
    subnet_id = var.subnets_id_private[count.index]
    tags = {
    Name = "Jenkins Agent-${count.index+1}"
    task = "jenkins_node"
  }
    root_block_device {
    encrypted   = false
    volume_type = var.volumes_type
  }

  vpc_security_group_ids = var.security_groups
}

