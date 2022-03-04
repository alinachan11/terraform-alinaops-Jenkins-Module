

locals {
  jenkins_default_name = "jenkins"
  jenkins_home = "/home/ubuntu/jenkins_home"
  jenkins_home_mount = "${local.jenkins_home}:/var/jenkins_home"
  docker_sock_mount = "/var/run/docker.sock:/var/run/docker.sock"
  java_opts = "JAVA_OPTS='-Djenkins.install.runSetupWizard=false'"
}




resource "aws_instance" "jenkins_server" {
  ami = data.aws_ami.jenkins_server.id
  instance_type = "t3.micro"
  key_name               = var.keyname
  user_data = local.jenkins-server-userdata
  subnet_id = var.subnets_id_private[0]
  iam_instance_profile   = var.consul_join_profile_name
  vpc_security_group_ids = var.security_groups
  tags = {
    Name = "Jenkins Server"
    task = "jenkins"
    node_type = "ubuntu"
    consul_server = "false"
    consul_type ="client"
    #consul_connect = "true"
  }

  provisioner "file" {
    source      = "${var.keypath}"
    destination = "/home/ubuntu/${var.keypath}"
    connection {   
      type        = "ssh" 
      host        = self.private_ip
      user        = "ubuntu"
      private_key = file(var.keypath) 

      
      bastion_host = var.bh_public_ip
      bastion_user = "ubuntu"
      bastion_private_key = file(var.keypath)        
    }   
  }
}
