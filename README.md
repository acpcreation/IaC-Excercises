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

## Kubernetes / Helm / Minikube
Deploying Containers
- Create deployment.yaml (this is all hard coded values)
- kubectl apply -f deployment.yaml 

- Helm allows us to variablize the deployment.yaml values
- helm upgrade --install [NAME] [CHART]
- NEED: 
    - [Example](https://helm.nginx.com/)
    - Control plane created with CLI (for aws eks or kubectl), or with TF (which is used in the platform)

Kubectl
    > Helm
        > Operators like ArgoCD (can be deployed on the cluster)
        > Actual containers

Steps:
1. terraform/ terraform init/apply
2. aws eks --region us-east-1 update-kubeconfig --name plattel-eks-cluster
3. kubectl commands:
    kubectl cluster-info
    kubectl get nodes
4. ./helm/deployment.yaml


## .course
Original LinkedIn Learning course
