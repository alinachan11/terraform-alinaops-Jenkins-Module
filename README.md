# Jenkins Module

A small jenkins module, creates a Jenkins-Server on the private subnet and creates 2 more jenkins nodes on 2 different private subnets.

![](https://cdn.dribbble.com/users/1096850/screenshots/3488730/jenkins.gif)

# Input:
The module accepts the following inputs:
MUST:
1) vpc_id
2) subnets_id_private
3) subnets_id_public
4) bh_public_ip
5) security_groups

OPTIONAL:
1) nodes_count - default value 2
2) keyname and keypath - default value ansible_key
3) consul_join_profile_name - default value opsschool-consul-join
4) eks_control_profile_name - default value eks-control

# Output:
The module generates the following outputs:
1) jenkins_server_private_address
2) jenkins_nodes_private_addresses
3) jenkins_lb_dns
4) jenkins_nodes_arn

