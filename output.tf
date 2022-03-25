output "jenkins_server_private_address" {
    value = aws_instance.jenkins_server.*.private_ip
}

output "jenkins_nodes_private_addresses" {
    value = aws_instance.jenkins_agent.*.private_ip
}

output "jenkins_lb_dns" {
    value = aws_lb.jenkins_master_alb.dns_name
}

output "jenkins_lb_zone_id" {
    value = aws_lb.jenkins_master_alb.zone_id
}


output "jenkins_nodes_arn" {
    value = aws_instance.jenkins_agent.*.arn
}