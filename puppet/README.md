# Puppet Node.js Installation Project

This Puppet project automates the installation of Node.js on remote VMs. It uses Puppet to manage configuration and dependencies.

## Project Structure

```
puppet/
├── puppet.conf                 # Main Puppet configuration
├── hiera.yaml                  # Hiera data hierarchy configuration
├── Puppetfile                  # Puppet module dependencies
├── manifests/
│   └── site.pp                 # Main site manifest for node definitions
├── modules/
│   └── nodejs_install/         # Custom module for Node.js installation
│       ├── manifests/
│       │   └── init.pp         # Module main class
│       └── metadata.json       # Module metadata
└── data/
    └── common.yaml             # Common Hiera data
```

## Prerequisites

1. **Puppet Agent**: Installed on the target VM
2. **SSH Access**: Ensure you can SSH into the target VM
3. **Sudo Privileges**: The puppet user must have sudo access
4. **Supported OS**: Ubuntu 20.04+ or other Debian-based distributions

## Installation Steps

### 1. Install Puppet Agent on Target VM

```bash
# SSH into your VM
ssh ubuntu@your-vm-ip

# Install Puppet repository
sudo wget https://apt.puppet.com/puppet-release-focal.deb
sudo dpkg -i puppet-release-focal.deb
sudo apt-get update

# Install Puppet Agent
sudo apt-get install -y puppet-agent

# Start Puppet Service
sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
```

### 2. Configure Puppet Master (or Standalone Mode)

For **standalone puppet runs** on each agent (no Puppet Master needed):

```bash
# On the target VM
sudo /opt/puppetlabs/bin/puppet apply /path/to/puppet/manifests/site.pp
```

For **Puppet Master setup** (more complex):
1. Set up a Puppet Master server
2. Configure agents to connect to it
3. Copy this project to `/etc/puppetlabs/code/environments/production`

### 3. Apply the Configuration

#### Option A: Standalone (Recommended for VMs)

```bash
# SSH into your VM
ssh ubuntu@your-vm-ip

# Copy the puppet project to the VM
scp -r /path/to/puppet ubuntu@your-vm-ip:~/puppet_project

# Run puppet apply
cd ~/puppet_project
sudo /opt/puppetlabs/bin/puppet apply manifests/site.pp --modulepath modules
```

#### Option B: Via Puppet Agent (with Puppet Master)

```bash
# On the VM with Puppet Agent running
sudo /opt/puppetlabs/bin/puppet agent --test
```

### 4. Verify Installation

```bash
# Check Node.js version
node --version

# Check npm version
npm --version

# List installed packages
npm list -g
```

## Configuration

### Customize Node.js Version

Edit `data/common.yaml`:

```yaml
nodejs_install::nodejs_version: '18.x'  # or '16.x', '20.x', etc.
nodejs_install::npm_version: '9.0.0'    # specify version or 'latest'
```

### Apply Node Configuration to Specific VMs

Edit `manifests/site.pp` and add node definitions:

```puppet
node 'your-vm-hostname.example.com' {
  class { 'nodejs_install':
    nodejs_version => '20.x',
    npm_version    => 'latest',
  }
}
```

## Module Details

### nodejs_install Class

**Parameters:**
- `nodejs_version` (String): Node.js version to install (default: '20.x')
- `npm_version` (String): npm version to install (default: 'latest')

**What it does:**
1. Updates the package manager
2. Installs Node.js from NodeSource repository
3. Installs npm
4. Verifies both installations

## Troubleshooting

### Puppet command not found
```bash
export PATH="/opt/puppetlabs/bin:$PATH"
```

### Permission Denied Errors
```bash
sudo /opt/puppetlabs/bin/puppet apply manifests/site.pp --modulepath modules
```

### Module Dependencies Missing
```bash
# Install dependencies via r10k or librarian-puppet
librarian-puppet install

# Or manually from Puppetfile
```

### Check Puppet Syntax
```bash
sudo /opt/puppetlabs/bin/puppet parser validate manifests/site.pp
```

## SSH Authentication

The Puppet module assumes the system runs with appropriate SSH credentials. To set up SSH key-based authentication:

1. On your local machine:
```bash
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
```

2. Copy the public key to your VM:
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@your-vm-ip
```

3. SSH into VM without password:
```bash
ssh ubuntu@your-vm-ip
```

## Running Puppet Agents Continuously

To have Puppet check and apply configuration every 30 minutes:

```bash
# Edit puppet.conf to enable agent service
sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
```

## Additional Resources

- [Puppet Documentation](https://puppet.com/docs)
- [NodeSource Node.js Repository](https://github.com/nodesource/distributions)
- [Puppetlabs Node.js Module](https://forge.puppet.com/modules/puppetlabs/nodejs)
- [Hiera Documentation](https://puppet.com/docs/puppet/latest/hiera.html)

## License

Apache 2.0
