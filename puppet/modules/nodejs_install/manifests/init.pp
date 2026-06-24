# nodejs_install module
# Installs Node.js and npm on the system

class nodejs_install (
  String $nodejs_version = '20.x',
  String $npm_version = 'latest',
) {
  # Ensure system packages are up to date
  exec { 'update_package_manager':
    command => 'apt-get update',
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    unless  => 'test -f /var/lib/apt/periodic/update-success-stamp',
  }

  # Install Node.js using the nodejs module from Puppet Forge
  class { 'nodejs':
    version      => $nodejs_version,
    npm_version  => $npm_version,
    repo_url_apt => "https://deb.nodesource.com/node_${nodejs_version}",
  }

  # Ensure npm is installed
  package { 'npm':
    ensure  => present,
    require => Class['nodejs'],
  }

  # Verify Node.js installation
  exec { 'verify_nodejs_install':
    command => 'node --version',
    path    => '/usr/bin:/bin:/usr/local/bin',
    unless  => 'which node',
  }

  # Verify npm installation
  exec { 'verify_npm_install':
    command => 'npm --version',
    path    => '/usr/bin:/bin:/usr/local/bin',
    unless  => 'which npm',
  }
}
