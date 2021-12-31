data "aws_availability_zones" "available" {}

data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  owners = ["amazon"]
}

data "aws_ami" "jenkins_server" {
  most_recent = true
  owners      = [819861602579]

  filter {
    name   = "name"
    values = ["Jenkins-server-image"]
  }
}



