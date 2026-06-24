#!/bin/bash

# Puppet Node.js Installation Setup Script
# This script helps set up and deploy the Puppet configuration to a VM

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VM_USER="${1:-ubuntu}"
VM_IP="${2:?Error: VM IP address is required. Usage: $0 [vm_user] <vm_ip>}"

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Puppet Node.js Installation Setup${NC}"
echo -e "${GREEN}========================================${NC}"
echo -e "VM User: ${YELLOW}${VM_USER}${NC}"
echo -e "VM IP: ${YELLOW}${VM_IP}${NC}"
echo -e "${GREEN}========================================${NC}"

# Step 1: Check SSH connectivity
echo -e "\n${YELLOW}[1/5]${NC} Checking SSH connectivity to VM..."
if ssh -o ConnectTimeout=5 "${VM_USER}@${VM_IP}" "echo 'SSH connection successful'" > /dev/null 2>&1; then
    echo -e "${GREEN}✓ SSH connection successful${NC}"
else
    echo -e "${RED}✗ Cannot connect to VM via SSH${NC}"
    echo "Make sure:"
    echo "  - The VM is running"
    echo "  - SSH port 22 is open"
    echo "  - Your SSH key is configured"
    exit 1
fi

# Step 2: Install Puppet Agent on VM
echo -e "\n${YELLOW}[2/5]${NC} Installing Puppet Agent on VM..."
ssh "${VM_USER}@${VM_IP}" << 'EOF'
    if ! command -v puppet &> /dev/null; then
        echo "Installing Puppet Agent..."
        sudo wget -q https://apt.puppet.com/puppet-release-focal.deb
        sudo dpkg -i puppet-release-focal.deb
        sudo apt-get update -qq
        sudo apt-get install -y puppet-agent > /dev/null 2>&1
        echo "Puppet Agent installed successfully"
    else
        echo "Puppet Agent already installed"
    fi
EOF
echo -e "${GREEN}✓ Puppet Agent ready${NC}"

# Step 3: Copy Puppet project to VM
echo -e "\n${YELLOW}[3/5]${NC} Copying Puppet project to VM..."
scp -r "${SCRIPT_DIR}" "${VM_USER}@${VM_IP}:~/puppet_project" > /dev/null 2>&1
echo -e "${GREEN}✓ Project copied${NC}"

# Step 4: Verify Puppet syntax
echo -e "\n${YELLOW}[4/5]${NC} Validating Puppet manifests..."
ssh "${VM_USER}@${VM_IP}" << 'EOF'
    cd ~/puppet_project
    /opt/puppetlabs/bin/puppet parser validate manifests/site.pp > /dev/null 2>&1 && echo "Syntax valid" || echo "Syntax error"
EOF
echo -e "${GREEN}✓ Manifests validated${NC}"

# Step 5: Apply Puppet configuration
echo -e "\n${YELLOW}[5/5]${NC} Applying Puppet configuration..."
ssh "${VM_USER}@${VM_IP}" << 'EOF'
    cd ~/puppet_project
    echo "Applying Node.js installation configuration..."
    sudo /opt/puppetlabs/bin/puppet apply manifests/site.pp \
        --modulepath modules \
        --hiera_config hiera.yaml \
        --detailed-exitcodes > /tmp/puppet_apply.log 2>&1 || true
    
    echo ""
    echo "Installation status:"
    node --version 2>/dev/null && echo "✓ Node.js installed" || echo "✗ Node.js installation failed"
    npm --version 2>/dev/null && echo "✓ npm installed" || echo "✗ npm installation failed"
EOF
echo -e "${GREEN}✓ Configuration applied${NC}"

# Completion message
echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}Setup Complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo -e "\nNode.js has been installed on your VM."
echo -e "\nTo verify the installation, run:"
echo -e "  ${YELLOW}ssh ${VM_USER}@${VM_IP} 'node --version && npm --version'${NC}"
echo -e "\nTo view the Puppet apply logs:"
echo -e "  ${YELLOW}ssh ${VM_USER}@${VM_IP} 'cat /tmp/puppet_apply.log'${NC}"
echo -e "\nFor more information, see README.md${NC}\n"
