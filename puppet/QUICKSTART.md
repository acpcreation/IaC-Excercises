# Quick Start Guide

## Quick Deploy (Recommended)

Use the automated setup script:

```bash
# Make the script executable
chmod +x setup.sh

# Run the setup (replace IP address)
./setup.sh ubuntu 192.168.1.100
```

The script will:
1. Check SSH connectivity
2. Install Puppet Agent on the VM
3. Copy the project to the VM
4. Validate Puppet manifests
5. Apply the Node.js installation configuration
6. Verify the installation

## Manual Steps

### 1. SSH into your VM
```bash
ssh ubuntu@your-vm-ip
```

### 2. Install Puppet Agent
```bash
sudo wget https://apt.puppet.com/puppet-release-focal.deb
sudo dpkg -i puppet-release-focal.deb
sudo apt-get update
sudo apt-get install -y puppet-agent
```

### 3. Apply Puppet Configuration
```bash
# Option A: If you have the files on the VM
cd ~/puppet_project
sudo /opt/puppetlabs/bin/puppet apply manifests/site.pp --modulepath modules

# Option B: Direct from your machine (requires Puppet installed locally)
sudo puppet apply /path/to/puppet/manifests/site.pp --modulepath /path/to/puppet/modules
```

### 4. Verify Installation
```bash
node --version
npm --version
```

## Customization

### Change Node.js Version

Edit `data/common.yaml`:
```yaml
nodejs_install::nodejs_version: '18.x'
```

Then reapply:
```bash
sudo puppet apply manifests/site.pp --modulepath modules
```

### View Installation Logs

```bash
sudo cat /tmp/puppet_apply.log
```

## Troubleshooting

### Puppet not found
```bash
export PATH="/opt/puppetlabs/bin:$PATH"
```

### Permission errors
```bash
# Use sudo
sudo /opt/puppetlabs/bin/puppet apply manifests/site.pp --modulepath modules
```

### Test SSH connectivity first
```bash
ssh -vv ubuntu@your-vm-ip
```

## Next Steps

- Install global npm packages
- Configure Node.js environment variables
- Set up PM2 for process management
- Deploy your Node.js applications

For detailed information, see [README.md](README.md)
