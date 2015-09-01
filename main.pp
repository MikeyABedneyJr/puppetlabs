# Ensures puppetlabs-ngnix module is installed
package { 'puppetlabs-nginx':
  ensure => present,
}

# Check that the directory is present before fetching exercise repo
file { '/var/www':
  ensure  => directory,
}

# Clone repo
exec { 'git clone https://github.com/puppetlabs/exercise-webpage':
  cwd     => '/var/www',
  creates => '/var/www/exercise-webpage/index.html',
  path    => '/usr/bin',
}

# Ensures nginx is running
service { 'nginx':
  enable => true,
  ensure => running,
  require => Package['puppetlabs-nginx'],
}

# Turn off default nginx.conf so later we can implement custom settings
file { '/etc/nginx/sites-enabled/default':
  ensure => absent,

}

# Deploy custom nginx config to puppet agent(s)
file { "/etc/nginx/nginx.conf":
  ensure => present,
  require => Package['puppetlabs-nginx']
  source =>"puppet:///nginx.conf"
}