#!/bin/bash

# Script to update Ansible inventory with Terraform outputs
# Run this after terraform apply to sync the inventory

cd "$(dirname "$0")/../terraform-ec2"

# Get Terraform outputs
ANSIBLE_HOST=$(terraform output -raw ansible_host)
ANSIBLE_USER=$(terraform output -raw ansible_user)  
ANSIBLE_SSH_KEY=$(terraform output -raw ansible_ssh_private_key_file)

# Update the inventory file
cd ../ansible

cat > inventory << EOF
[main_ec2]
ec2-instance

[main_ec2:vars]
ansible_host=${ANSIBLE_HOST}
ansible_user=${ANSIBLE_USER}
ansible_ssh_private_key_file=${ANSIBLE_SSH_KEY}
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOF

echo "✅ Updated Ansible inventory with:"
echo "   Host: ${ANSIBLE_HOST}"
echo "   User: ${ANSIBLE_USER}"
echo "   SSH Key: ${ANSIBLE_SSH_KEY}"
echo ""
echo "You can now run: ansible-playbook -i inventory complete-deployment.yml"