# Displays the public IP address of the created EC2 instance
# This IP can be used to access the server from the internet
output "web_instance_public_ip" {
    value = aws_instance.web.public_ip
}

# Provides the complete SSH command to connect to the instance
# Copy and paste this command to access your server via SSH
output "ssh_command" {
    value = "ssh -i ~/.ssh/id_rsa ec2-user@${aws_instance.web.public_ip}"
}

output "ansible_host" {
    description = "Public IP for Ansible inventory"
    value = aws_instance.web.public_ip
}

output "ansible_user" {
    description = "SSH user for Ansible connection" 
    value = "ec2-user"
}

output "ansible_ssh_private_key_file" {
    description = "SSH private key path for Ansible"
    value = "~/.ssh/id_rsa"
}

# Commented out - legacy output from previous configuration
# output "instance_public_ip" {
#   value = aws_instance.ec2-instance.public_ip
# }
