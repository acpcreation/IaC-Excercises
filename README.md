# IaC Examples
- Needed: rsa and git PAT

## Terraform-ec2
- Create key pair: ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -N ""
- ssh into machine: ssh -i ~/.ssh/id_rsa ec2-user@34.201.205.204

## Ansible
- Ping: ansible -i inventory main-ec2 -m ping

To Start Run: 
    ./update-inventory.sh
    ansible-playbook -i inventory complete-deployment.yml

## StackGuardian
- Use the both private rsa and .pub rsa key to vault
- 


## .course
Original LinkedIn Learning course
