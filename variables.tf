variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "nodes_count" {
  default = 2
}

variable "instance_type" {
  description = "The type of the ec2, for example - t2.medium"
  default     = "t2.micro"
  type        = string
}

variable "security_group_name" {
  default = "jenkins"
  type    = string
}

variable "volumes_type" {
  description = "The type of all the disk instances in my project"
  default     = "gp2"
}

variable "ubuntu_account_number" {
  description = "The AWS account number of the offical Ubuntu Images"
  default     = "099720109477"
  type        = string
}

variable "vpc_id" {
  description = "AWS VPC id"
  type    = string
}

variable "subnets_id_private" {
  description = "private Subnets ids"
  type    = list(string)
}

variable "subnets_id_public" {
  description = "public Subnets ids"
  type    = list(string)
}

variable "keyname" {
  default = "ansible_key"
  type = string
}

variable "keypath" {
  default = "ansible_key.pem"
  type = string
}

variable "bh_public_ip" {
  description = "public ip of bastion host"
}

variable "security_groups" {
  description = "security groups for module"
}

variable "consul_join_profile_name" {
  description = "profile name for consul join"
  type = string
  default = "opsschool-consul-join"
}

variable "eks_control_profile_name" {
  description = "profile name for eks control"
  type = string
  default = "eks-control"
}

variable "kubeconfig" {
  description = "kubeconfig data"

}







