locals {
jenkins-nodes-userdata = <<USERDATA
#!/bin/bash 
yum update -y
yum install docker git java-1.8.0 -y
service docker start
usermod -aG docker ec2-user
USERDATA

jenkins-server-userdata11 = <<USERDATA
#!/bin/bash 

chmod 600 /home/ubuntu/${var.keypath}
mv /home/ubuntu/${var.keypath} /home/ubuntu/.ssh/

USERDATA

jenkins-server-userdata = <<USERDATA
#!/bin/bash 

chmod 600 /home/ubuntu/${var.keypath}
mv /home/ubuntu/${var.keypath} /home/ubuntu/.ssh/

docker run -d --restart=always -p 8080:8080 -p 50000:50000 -v ${local.jenkins_home_mount} -v ${local.docker_sock_mount} --env ${local.java_opts} jenkins/jenkins
USERDATA
}