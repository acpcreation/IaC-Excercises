# Main site manifest
# This manifest defines the configuration for all nodes

# Default node configuration
node default {
  include nodejs_install
}

# Example for a specific VM (replace with your VM hostname)
node 'vm-node-1.example.com' {
  include nodejs_install
}
